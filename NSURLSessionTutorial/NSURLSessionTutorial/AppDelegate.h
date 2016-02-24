//
//  AppDelegate.h
//  NSURLSessionTutorial
//
//  Created by Himanshu Khatri on 2/23/16.
//  Copyright © 2016 bdAppManiac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
+(void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void(^)(NSData *data))completionHandler;


@end

