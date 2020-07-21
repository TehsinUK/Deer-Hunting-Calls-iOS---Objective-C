//
//  ViewController.m
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//
#import "FullVersionBuyView.h"
#import "ViewController.h"
#import "GuideView.h"
#import "infoViewController.h"
#import "AppDelegate.h"
#import "MyCommonFunctions.h"
@interface ViewController ()
-(void) initializeiAd;
@end

@implementation ViewController
@synthesize bannerIsVisible = bannerIsVisible_;
@synthesize selectionStyle;
- (void)viewDidLoad
{
    [super viewDidLoad];
    tableView_.backgroundColor = [UIColor clearColor];
    [myActivityIndicator startAnimating];
    
    
    NSString *ver =  [[UIDevice currentDevice] systemVersion];
    float ios_ver  = [ver floatValue];
	// Do any additional setup after loading the view, typically from a nib.
    itemsArray_ = [[NSArray alloc] initWithObjects:@"Contact Call",@"Doe Grunt",@"Doe Bleat",@"Doe Warning Cough",@"Buck Grunt",@"Buck Dominant Grunt",@"Buck Bawl",@"Buck Snort.",@"Bucks Fighting",@"Breeding Bellow",@"Estrus Bleat",@"Tending Runts",@"Ragen Grunt",@"Sparring",@"Fawndistress1", nil];
    
    if ([[UIScreen mainScreen] bounds].size.height == 568)
    {
        myView.frame = CGRectMake(0, 520, 320, 50);
        myImageview.frame = CGRectMake(0, 0, 320, 568);
        tableView_.frame = CGRectMake(0, 60, 320, 460);
        
    }

//     [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background_vertical.png"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return itemsArray_.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [audioPlayer_ stop];
    [tableView cellForRowAtIndexPath:indexPath].selected = NO;
    NSString *resourcePath = [NSString stringWithFormat:@"deer_%d_sf",indexPath.row+1];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:resourcePath ofType:@"wav"];
    audioPlayer_=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    audioPlayer_.delegate = self;
    audioPlayer_.numberOfLoops = 0;
    [audioPlayer_ play];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UIView *cellBackView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
        //cellBackView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"btn2.png"]];
        cell.backgroundView = cellBackView;
        cell.textLabel.textColor = [UIColor whiteColor];
        //[cell setFont:[UIFont fontWithName:@"Copperplate-Bold" size:28]];
        //[cell setFont:[UIFont fontWithName:@"HelveticaNeue" size:28]];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.selectionStyle = UITableViewCellEditingStyleNone;

    }
    
  

    cell.textLabel.text = [itemsArray_ objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"bar.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    
}

- (IBAction)guideClicked:(id)sender
{
    GuideView *guidView = [[GuideView alloc] init];
    
    if ([[MyCommonFunctions getDeviceType]isEqualToString:@"iPad"]) {
      
        //guidView.frame = CGRectMake(250, 250, 320, 508);
        //[guidView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        //[guidView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    }

    else{
    if ([[UIScreen mainScreen] bounds].size.height == 568)
    {
        //guidView.frame = CGRectMake(0, 60, 320, 508);
                
    }
}
  
    //[guidView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
    //[guidView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    guidView.frame = self.view.frame;
    [self.view addSubview:guidView];
}

- (IBAction)infoClicked:(id)sender {
    
    infoViewController *infoVC = nil;
    if ([[MyCommonFunctions getDeviceType]isEqualToString:@"iPad"]) {
        infoVC = [[infoViewController alloc]initWithNibName:@"infoViewControlleriPad" bundle:nil];
    }
    else{
    
   infoVC = [[infoViewController alloc]initWithNibName:@"infoViewController" bundle:nil];
    }
    
    [self.navigationController pushViewController:infoVC animated:YES];
}


-(IBAction) volumeSliderChanged:(id) sender{
    UISlider *slider = (UISlider *) sender;
//    int progressAsInt =(int)(slider.value + 0.5f);
    
    
    
    [audioPlayer_ setVolume:slider.value];
    
    
    if (!audioPlayer_.isPlaying) {
        [audioPlayer_ play];
    }
}

- (IBAction)addcloseBtnClicked:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Pro Version Download" message:@"Download pro version without ads, with a better look." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Download", nil];
    [alert show];
    [alert release];
//    FullVersionBuyView *buyView = [[FullVersionBuyView alloc] init];
//    [self.view addSubview:buyView];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    switch (buttonIndex) {
        case 0:
        {
            
        }
        break;
        case 1:
        {
            FullVersionBuyView *buyView = [[FullVersionBuyView alloc] init];
            [self.view addSubview:buyView];
        }
        default:
            break;
    }
}
- (void)dealloc {
    [myActivityIndicator release];
    [myView release];
    [myImageview release];
   
    [super dealloc];
}

@end
