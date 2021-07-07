//
//  VideoController.m
//  SdImageDemo
//
//  Created by hwly on 2021/4/23.
//

#import "VideoController.h"
#import "AACEncoder.h"
#import "H264Encoder.h"

#define CAPTURE_FRAMES_PER_SECOND 20
#define SAMPLE_RATE               44100
#define VideoWidth                480
#define VideoHeight               640

@interface VideoController ()<AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureAudioDataOutputSampleBufferDelegate, H264EncoderDelegate>
{
    UIButton *startBtn;
    bool startCalled;

    H264Encoder *h264Encoder;
    AACEncoder *aacEncoder;

    AVCaptureSession *captureSession;

    dispatch_queue_t _audioQueue;

    AVCaptureConnection *_audioConnection;
    AVCaptureConnection *_videoConnection;

    NSMutableData *_data;
    NSString *h264File;
    NSFileHandle *fileHandle;
}

@end

@implementation VideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    startCalled = true;

    _data = [[NSMutableData alloc] init];
    captureSession = [[AVCaptureSession alloc] init];

    [self initStartBtn];
}

#pragma mark
#pragma mark - 设置音频 capture

- (void)setupAudioCapture {
    aacEncoder = [[AACEncoder alloc] init];
    // create capture device with video input

    /*
     * Create audio connection
     */
    AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    NSError *error = nil;
    AVCaptureDeviceInput *audioInput = [[AVCaptureDeviceInput alloc] initWithDevice:audioDevice error:&error];
    if (error) {
        NSLog(@"Error getting audio input device: %@", error.description);
    }
    if ([captureSession canAddInput:audioInput]) {
        [captureSession addInput:audioInput];
    }

    _audioQueue = dispatch_queue_create("Audio Capture Queue", DISPATCH_QUEUE_SERIAL);
    AVCaptureAudioDataOutput *audioOutput = [[AVCaptureAudioDataOutput alloc] init];
    [audioOutput setSampleBufferDelegate:self queue:_audioQueue];
    if ([captureSession canAddOutput:audioOutput]) {
        [captureSession addOutput:audioOutput];
    }
    _audioConnection = [audioOutput connectionWithMediaType:AVMediaTypeAudio];
}

- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position
{
    AVCaptureDeviceDiscoverySession *deviceDiscoverySession = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:@[AVCaptureDeviceTypeBuiltInWideAngleCamera] mediaType:AVMediaTypeVideo position:position];
	NSArray *devices = deviceDiscoverySession.devices;
	return devices.firstObject;
	
//    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
//    for (AVCaptureDevice *device in devices) {
//        if (device.position == position) return device;
//    }
    return nil;
}

#pragma mark
#pragma mark - 设置视频 capture
- (void)setupVideoCaprure
{
    h264Encoder = [H264Encoder alloc];
    [h264Encoder initWithConfiguration];

    NSError *deviceError;

    AVCaptureDevice *cameraDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    cameraDevice = [self cameraWithPosition:AVCaptureDevicePositionBack];
//    cameraDevice.position = AVCaptureDevicePositionBack;
    AVCaptureDeviceInput *inputDevice = [AVCaptureDeviceInput deviceInputWithDevice:cameraDevice error:&deviceError];

    // make output device

    AVCaptureVideoDataOutput *outputDevice = [[AVCaptureVideoDataOutput alloc] init];

    NSString *key = (NSString *)kCVPixelBufferPixelFormatTypeKey;

    NSNumber *val = [NSNumber
                     numberWithUnsignedInt:kCVPixelFormatType_420YpCbCr8BiPlanarFullRange];
    NSDictionary *videoSettings =
        [NSDictionary dictionaryWithObject:val forKey:key];

    NSError *error;
    [cameraDevice lockForConfiguration:&error];
    if (error == nil) {
        NSLog(@"cameraDevice.activeFormat.videoSupportedFrameRateRanges IS %@", [cameraDevice.activeFormat.videoSupportedFrameRateRanges objectAtIndex:0]);

        if (cameraDevice.activeFormat.videoSupportedFrameRateRanges) {
            [cameraDevice setActiveVideoMinFrameDuration:CMTimeMake(1, CAPTURE_FRAMES_PER_SECOND)];
            [cameraDevice setActiveVideoMaxFrameDuration:CMTimeMake(1, CAPTURE_FRAMES_PER_SECOND)];
        }
    } else {
        // handle error2
    }
    [cameraDevice unlockForConfiguration];

    // Start the session running to start the flow of data

    outputDevice.videoSettings = videoSettings;

    [outputDevice setSampleBufferDelegate:self queue:dispatch_get_main_queue()];

    // initialize capture session

    if ([captureSession canAddInput:inputDevice]) {
        [captureSession addInput:inputDevice];
    }
    if ([captureSession canAddOutput:outputDevice]) {
        [captureSession addOutput:outputDevice];
    }

    // begin configuration for the AVCaptureSession
    [captureSession beginConfiguration];

    // picture resolution
    [captureSession setSessionPreset:[NSString stringWithString:AVCaptureSessionPreset640x480]];

    _videoConnection = [outputDevice connectionWithMediaType:AVMediaTypeVideo];

    //Set landscape (if required)
    if ([_videoConnection isVideoOrientationSupported]) {
        AVCaptureVideoOrientation orientation = AVCaptureVideoOrientationLandscapeRight;
        [_videoConnection setVideoOrientation:orientation];
    }

    // make preview layer and add so that camera's view is displayed on screen

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    h264File = [documentsDirectory stringByAppendingPathComponent:@"test.h264"];
    [fileManager removeItemAtPath:h264File error:nil];
    [fileManager createFileAtPath:h264File contents:nil attributes:nil];

    // Open the file using POSIX as this is anyway a test application
    //fd = open([h264File UTF8String], O_RDWR);
    fileHandle = [NSFileHandle fileHandleForWritingAtPath:h264File];

    [h264Encoder initEncode:VideoWidth height:VideoHeight];
    h264Encoder.delegate = self;
}

#pragma mark
#pragma mark - sampleBuffer 数据
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection

{
    CMTime pts = CMSampleBufferGetPresentationTimeStamp(sampleBuffer);
    double dPTS = (double)(pts.value) / pts.timescale;
    NSLog(@"DPTS is %f",dPTS);

    if (connection == _videoConnection) {
        [h264Encoder encode:sampleBuffer];
    } else if (connection == _audioConnection) {
        [aacEncoder encodeSampleBuffer:sampleBuffer completionBlock:^(NSData *encodedData, NSError *error) {
            if (encodedData) {
                NSLog(@"Audio data (%lu): %@", (unsigned long)encodedData.length, encodedData.description);

#pragma mark
#pragma mark -  音频数据(encodedData)
				[self->_data appendData:encodedData];
            } else {
                NSLog(@"Error encoding AAC: %@", error);
            }
        }];
    }
}

#pragma mark
#pragma mark - 视频 sps 和 pps
- (void)gotSpsPps:(NSData *)sps pps:(NSData *)pps
{
    const char bytes[] = "\x00\x00\x00\x01";
    size_t length = (sizeof bytes) - 1;     //string literals have implicit trailing '\0'
    NSData *ByteHeader = [NSData dataWithBytes:bytes length:length];
    [fileHandle writeData:ByteHeader];
    [fileHandle writeData:sps];
    [fileHandle writeData:ByteHeader];
    [fileHandle writeData:pps];
}

#pragma mark
#pragma mark - 视频数据回调
- (void)gotEncodedData:(NSData *)data isKeyFrame:(BOOL)isKeyFrame
{
    NSLog(@"Video data (%lu): %@", (unsigned long)data.length, data.description);

    if (fileHandle != NULL) {
        const char bytes[] = "\x00\x00\x00\x01";
        size_t length = (sizeof bytes) - 1;         //string literals have implicit trailing '\0'
        NSData *ByteHeader = [NSData dataWithBytes:bytes length:length];

#pragma mark
#pragma mark - 视频数据(data)

        [fileHandle writeData:ByteHeader];
        //[fileHandle writeData:UnitHeader];
        [fileHandle writeData:data];
    }
}

#pragma mark
#pragma mark - 录制
- (void)startBtnClicked
{
    if (startCalled) {
        [self startCamera];
        startCalled = false;
        [startBtn setTitle:@"Stop" forState:UIControlStateNormal];
    } else {
        [startBtn setTitle:@"Start" forState:UIControlStateNormal];
        startCalled = true;
        [self stopCarmera];
    }
}

- (void)startCamera
{
    [self setupAudioCapture];
    [self setupVideoCaprure];
    [captureSession commitConfiguration];
    [captureSession startRunning];
}

- (void)stopCarmera
{
    [h264Encoder End];
    [captureSession stopRunning];
    //close(fd);
    [fileHandle closeFile];
    fileHandle = NULL;

    // 获取程序Documents目录路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    NSMutableString *path = [[NSMutableString alloc]initWithString:documentsDirectory];
    [path appendString:@"/AACFile"];

    [_data writeToFile:path atomically:YES];
}

- (void)initStartBtn
{
    startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(0, 0, 100, 30);
    startBtn.center = self.view.center;
    [startBtn addTarget:self action:@selector(startBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [startBtn setTitle:@"Start" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:startBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
