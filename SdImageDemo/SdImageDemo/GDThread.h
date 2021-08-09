//
//  GDThread.h
//  SdImageDemo
//
//  Created by Liuyujie on 2021/7/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GDThreadTaskAction)(void);

@interface GDThread : NSObject

- (void)stop;

- (void)executeTask:(GDThreadTaskAction)taskAction;

- (void)stopThread;

@end

NS_ASSUME_NONNULL_END
