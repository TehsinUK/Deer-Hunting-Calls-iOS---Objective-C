//
//  infoViewController.m
//  Deer_Hunting_Calls
//
//  Created by Naveed on 2/2/13.
//  Copyright (c) 2013 Naveed. All rights reserved.
//

#import "infoViewController.h"
#import "itemInfodetailView.h"
#import "AppDelegate.h"
#import "FullVersionBuyView.h"
#import "MyCommonFunctions.h"
@interface infoViewController ()

@end

@implementation infoViewController
@synthesize bannerIsVisible = bannerIsVisible_;
@synthesize subView;
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
    CGRect frame = aWebView.frame;
    frame.size.height = 1;
    aWebView.frame = frame;
    CGSize fittingSize = [aWebView sizeThatFits:CGSizeZero];
    frame.size = fittingSize;
    if (frame.size.height < 460)
    {
        aWebView.frame = CGRectMake((320-aWebView.frame.size.width)/2,(460/2)-frame.size.height/2, aWebView.frame.size.width, frame.size.height);
        
    }
    else
    {
        aWebView.frame = CGRectMake((320-aWebView.frame.size.width)/2, 30, aWebView.frame.size.width,400);
    }
   
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    tableViewObj_.backgroundColor = [UIColor clearColor];
    [myActivityIndicator startAnimating];
    NSString *ver =  [[UIDevice currentDevice] systemVersion];
    float ios_ver  = [ver floatValue];
    
    
//    if ([[UIScreen mainScreen] bounds].size.height == 568)
//    {
//        myView.frame = CGRectMake(0, 520, 320, 50);
//        
//        tableViewObj_.frame = CGRectMake(0, 60, 320, 460);
//        
//    }
    
	// Do any additional setup after loading the view, typically from a nib.
    
      itemsArray_ = [[NSArray alloc] initWithObjects:@"Contact Call",@"Doe Grunt",@"Doe Bleat",@"Doe Warning Cough",@"Buck Grunt",@"Buck Dominant Grunt",@"Buck Bawl",@"Buck Snort.",@"Bucks Fighting",@"Breeding Bellow",@"Estrus Bleat",@"Tending Runts",@"Ragen Grunt",@"Sparring",@"Fawndistress1", nil];

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
    
    if ([[MyCommonFunctions getDeviceType]isEqualToString:@"iPad"])
    {
        
        NSString *resourceName = [NSString stringWithFormat:@"deer_%d",indexPath.row+1];
        NSString *filePath= [[NSBundle mainBundle] pathForResource:resourceName ofType:@"html"];
        
        if (filePath) {
            
            NSString *myText = [NSString stringWithContentsOfFile:filePath];
            if (myText)
            {
                
                [webView loadHTMLString:myText baseURL:nil];
            }

        [self.view addSubview:subView];
        
    }
        else
        {
        }
       
    }
    else
    {
        itemInfodetailView *detailViewObj = [[itemInfodetailView alloc] initWithItemNumber:indexPath.row+1];
        detailViewObj.webView.delegate =self;
        detailViewObj.frame = self.view.frame;
        [self.view addSubview:detailViewObj];

    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.textColor = [UIColor whiteColor];
        //[cell setFont:[UIFont fontWithName:@"Copperplate-Bold" size:28]];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
//    [cell.textLabel setFont:[UIFont fontWithName:@"Ethnocentric_Bold" size:14]];
    NSString *cellTitle = [NSString stringWithFormat:@"%@ Info",[itemsArray_ objectAtIndex:indexPath.row]];
    cell.textLabel.text = cellTitle;
    UIView *cellBackView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    //cellBackView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"btn2.png"]];
    cell.backgroundView = cellBackView;
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
  
    //        46-139-87
    //        0-100-0, 50-205-50,72-209-204,178-34-34,49-79-79,60-179-113,245-255-250
  //  myBackView.backgroundColor = [UIColor colorWithRed:245/255 green:255/255 blue:250/255 alpha:1];
   // cell.selectedBackgroundView = myBackView;
   // [myBackView release];
  cell.selectionStyle = UITableViewCellEditingStyleNone;
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

- (IBAction)backClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
    [myView release];
    [myActivityIndicator release];
    [subView release];
    [webView release];
    [super dealloc];
}

- (IBAction)cancelClicked
{
    [subView removeFromSuperview];
}
@end
