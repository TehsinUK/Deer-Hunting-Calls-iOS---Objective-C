//
//  itemInfodetailView.h
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemInfodetailView : UIView
{
    IBOutlet UIWebView *webView_;
    int itemNumber_;
    
}
@property (retain) UIWebView *webView;
- (IBAction)okClicked:(id)sender;
- (id)initWithItemNumber:(int) itemNo;

@end
