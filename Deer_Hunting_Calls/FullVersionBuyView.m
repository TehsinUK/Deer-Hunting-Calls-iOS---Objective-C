//
//  FullVersionBuyView.m
//  Deer_Hunting_Calls
//
//  Created by Synergy Computers on 2/13/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import "FullVersionBuyView.h"

@implementation FullVersionBuyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void) loadPage
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/quran-explorer/id451133186?mt=8"]];
    [webView_ loadRequest:request];
}
- (id)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"FullVersionBuyView" owner:self options:nil] objectAtIndex:0] ;
        [self loadPage];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [spinner_ removeFromSuperview];
    [loadingLabel_ removeFromSuperview];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Loading Failed" message:@"Please check your internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    alert.delegate = self;
    [alert show];
    [alert release];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self removeFromSuperview];
}
@end
