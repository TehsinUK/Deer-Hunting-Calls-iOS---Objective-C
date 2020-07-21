//
//  ViewController.h
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//
#import <iAd/iAd.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "GuideView.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ADBannerViewDelegate,UIAlertViewDelegate>
{
    AVAudioPlayer *audioPlayer_;
    NSArray *itemsArray_;
    IBOutlet UITableView *tableView_;
    IBOutlet UISlider *volumeSlider_;
    IBOutlet UIImageView *myImageview;
    IBOutlet UIView *myView;
    IBOutlet UIActivityIndicatorView *myActivityIndicator;
    BOOL bannerIsVisible_;
    IBOutlet ADBannerView *adView;
}

@property (nonatomic,assign) BOOL bannerIsVisible;
- (IBAction)guideClicked:(id)sender;
- (IBAction)infoClicked:(id)sender;
-(IBAction) volumeSliderChanged:(id) sender;
- (IBAction)addcloseBtnClicked:(id)sender;
@property(nonatomic) UITableViewCellSelectionStyle selectionStyle;
@end
