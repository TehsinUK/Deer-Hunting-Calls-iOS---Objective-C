//
//  FullVersionBuyView.h
//  Deer_Hunting_Calls
//
//  Created by Synergy Computers on 2/13/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FullVersionBuyView : UIView<UIWebViewDelegate,UIAlertViewDelegate>
{
    IBOutlet UIWebView * webView_;
    IBOutlet UILabel *loadingLabel_;
    IBOutlet UIActivityIndicatorView *spinner_;
}

@end
