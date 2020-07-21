//
//  infoViewController.h
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface infoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate,UIAlertViewDelegate>
{
    NSArray *itemsArray_;
    IBOutlet UITableView *tableViewObj_;
    BOOL bannerIsVisible_;
    IBOutlet UIView *myView;
    IBOutlet UIActivityIndicatorView *myActivityIndicator;
}
@property (retain, nonatomic) IBOutlet UIImageView *imgView;
@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) IBOutlet UIView *subView;

- (IBAction)backClicked:(id)sender;
- (IBAction)addcloseBtnClicked:(id)sender;
- (IBAction)cancelClicked;
@property (nonatomic,assign) BOOL bannerIsVisible;
@end
