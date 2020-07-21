//
//  AppDelegate.h
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum kVersionType
{
    kVersionPro = 1,
    kVersionLite = 2
}kVersionType;
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    kVersionType appVersionType_;
}
@property (strong, nonatomic) UIWindow *window;
@property (assign, nonatomic) kVersionType appVersionType;
@property (strong, nonatomic) UINavigationController *navViewController;
@property int IsProductAvialable;

#define REVMOB_ID @"51daa67419354781d800004b"
#define APP_NAME    [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey]

#define APPDELEGATE \
((AppDelegate*)[UIApplication sharedApplication].delegate)


#define GET_DEFAULTS \
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

#define ALERT_VIEW(msg)\
{\
UIAlertView *av = [[UIAlertView alloc] initWithTitle:APP_NAME message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];\
[av show];\
[av release];\
}

#define kFB_ID @"243292585704776"
#define kFB_Local_ID @""
- (void)showBusyViewWithMessage:(NSString*)message;
- (void)hideBusyView;

@end
