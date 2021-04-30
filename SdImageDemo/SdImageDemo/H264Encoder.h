//
//  H264Encoder.h
//  SdImageDemo
//
//  Created by hwly on 2021/4/23.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <VideoToolbox/VideoToolbox.h>

NS_ASSUME_NONNULL_BEGIN

@protocol H264EncoderDelegate <NSObject>

- (void)gotSpsPps:(NSData *)sps pps:(NSData *)pps;
- (void)gotEncodedData:(NSData *)data isKeyFrame:(BOOL)isKeyFrame;

@end

@interface H264Encoder : NSObject

- (void)initWithConfiguration;
- (void)start:(int)width height:(int)height;
- (void)initEncode:(int)width height:(int)height;
- (void)encode:(CMSampleBufferRef)sampleBuffer;
- (void)End;

@property (weak, nonatomic) NSString *error;
@property (weak, nonatomic) id<H264EncoderDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
