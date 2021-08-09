//
//  GDThread.m
//  SdImageDemo
//
//  Created by Liuyujie on 2021/7/10.
//

#import "GDThread.h"

@interface GDThread ()

@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, assign, getter = isStoped) BOOL stoped;

@end

@implementation GDThread

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.stoped = NO;
        __weak typeof(self) weakSelf = self;
        self.thread = [[NSThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            while (!weakSelf.isStoped && weakSelf)
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }];
        [self.thread start];
    }
    return self;
}

- (void)stop
{
    if (!self.thread) {
        return;
    }
    [self performSelector:@selector(stopThread) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)executeTask:(GDThreadTaskAction)taskAction
{
    taskAction();
}

- (void)stopThread
{
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.stoped = YES;
    self.thread = nil;
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
