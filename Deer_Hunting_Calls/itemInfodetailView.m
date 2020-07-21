

//
//  itemInfodetailView.m
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import "itemInfodetailView.h"

@implementation itemInfodetailView
@synthesize webView = webView_;
- (id)initWithItemNumber:(int) itemNo
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"itemInfoDetailView" owner:self options:nil] objectAtIndex:0] ;
        itemNumber_ = itemNo;
        [self loadData];
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
- (void) loadData
{
    
    NSString *resourceName = [NSString stringWithFormat:@"deer_%d",itemNumber_];
    NSString *filePath= [[NSBundle mainBundle] pathForResource:resourceName ofType:@"html"];
    
    
    
    if (filePath) {
        
        NSString *myText = [NSString stringWithContentsOfFile:filePath];
        if (myText)
        {
            
            [webView_ loadHTMLString:myText baseURL:nil];
        }
        
        
    }
}
- (IBAction)okClicked:(id)sender {
    [self removeFromSuperview];
}
@end
