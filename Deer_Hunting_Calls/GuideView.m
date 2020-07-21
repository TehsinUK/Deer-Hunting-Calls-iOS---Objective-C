//
//  GuideView.m
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import "GuideView.h"
#import "ViewController.h"
@implementation GuideView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"GuideView" owner:self options:nil] objectAtIndex:0] ;
        [self loadData];
    }
    return self;
}
- (void) loadData
{
    NSString *filePath= [[NSBundle mainBundle] pathForResource:@"deer_guide" ofType:@"html"];
    
    
    
    if (filePath) {
        
        NSString *myText = [NSString stringWithContentsOfFile:filePath];
        if (myText)
        {

            [webView_ loadHTMLString:myText baseURL:nil];
        }
        
        
    }
}
- (void) reLoadData
{
    NSString *filePath= [[NSBundle mainBundle] pathForResource:@"deer_guide" ofType:@"html"];
    
    
    
    if (filePath) {
        
        NSString *myText = [NSString stringWithContentsOfFile:filePath];
        if (myText)
        {
            
            [webView_ loadHTMLString:myText baseURL:nil];
        }
        
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)okClicked:(id)sender {
    
   
    
    [self removeFromSuperview];
}
-(IBAction) volumeSliderChanged:(id) sender{
    UISlider *slider = (UISlider *) sender;
    //    int progressAsInt =(int)(slider.value + 0.5f);
    NSString *filePath= [[NSBundle mainBundle] pathForResource:@"deer_guide" ofType:@"html"];
    
    
    
    if (filePath) {
        
        NSString *myText = [NSString stringWithContentsOfFile:filePath];
        
        float size = slider.value*110.0f;
       myText =[myText stringByReplacingOccurrencesOfString:@"font: 60" withString:[NSString stringWithFormat:@"font: %f",size]];
        if (myText)
        {
            
            [webView_ loadHTMLString:myText baseURL:nil];
        }
        
        
    }

    
    
//    [audioPlayer_ setVolume:slider.value];
//    
//    
//    if (!audioPlayer_.isPlaying) {
//        [audioPlayer_ play];
//    }
}

@end
