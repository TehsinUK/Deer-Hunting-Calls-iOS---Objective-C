//
//  GuideView.h
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface GuideView : UIView
{
    IBOutlet UIWebView *webView_;
    
}
- (IBAction)okClicked:(id)sender;
-(IBAction) volumeSliderChanged:(id) sender;
@end
