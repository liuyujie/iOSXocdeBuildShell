//
//  AppDelegate.m
//  SdImageDemo
//
//  Created by hwly on 2021/2/26.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
    
    [self tomTest];
	return YES;
}

- (void)tomTest
{
    dispatch_queue_t concurrentQueue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);

    for (NSInteger i = 0; i < 10; i++) {
        dispatch_async(concurrentQueue, ^{
            NSLog(@"%zd - %@", i,[NSThread currentThread]);
        });
    }

    dispatch_barrier_sync(concurrentQueue, ^{
        NSLog(@"barrier  - %@",[NSThread currentThread]);
    });

    NSLog(@"主线程执行东西- %@",[NSThread currentThread]);

    
    for (NSInteger i = 10; i < 20; i++) {
        dispatch_async(concurrentQueue, ^{
            NSLog(@"%zd - %@", i,[NSThread currentThread]);
        });
    }
    
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
	// Called when a new scene session is being created.
	// Use this method to select a configuration to create the new scene with.
	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
	// Called when the user discards a scene session.
	// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
	// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
