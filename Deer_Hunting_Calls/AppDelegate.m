//
//  AppDelegate.m
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import "AppDelegate.h"
#import "MyCommonFunctions.h"
#import "ViewController.h"

@implementation AppDelegate
@synthesize appVersionType = appVersionType_;
@synthesize IsProductAvialable;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    sleep(3);
#ifdef IS_LITE_VERSION
    //- Code that should be executed if the build target is set to MyGameLite
    NSLog(@"Lite APP here");
    appVersionType_ = kVersionLite;
#else
    //- Code that should be executed if the build target is set to MyGame
    NSLog(@"Provsion APP here");
    appVersionType_ = kVersionPro;
#endif

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *rootVC;
    if ([[MyCommonFunctions getDeviceType]isEqualToString:@"iPad"]) {
        rootVC =  [[[ViewController alloc] initWithNibName:@"ViewController_iPhoneiPad" bundle:nil] autorelease];
    }
    else{
   
    rootVC =  [[[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil] autorelease];
        
    }
    
    
        
  
            
    
    self.navViewController = [[UINavigationController alloc] init];
    self.navViewController.navigationBarHidden = YES;
    self.window.rootViewController = self.navViewController;
    [self.navViewController pushViewController:rootVC animated:NO];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
