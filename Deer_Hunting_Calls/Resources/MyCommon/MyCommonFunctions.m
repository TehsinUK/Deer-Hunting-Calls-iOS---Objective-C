//
//   
//  xFit Abs
//
//  Created by Naveed Butt on 22/08/2013.
//  Copyright 2013 WIN Solutions. All rights reserved.
//

#import "MyCommonFunctions.h"
#import "AppDelegate.h"
//#import "JSON.h"
//#import "myJson.h"
#import <QuartzCore/QuartzCore.h>
//#import "UIImageView+WebCache.h"
#import "defines.h"

@implementation MyCommonFunctions


+(void)checkIfAppIsCracked
{
    NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/_CodeSignature", bundlePath]];
    BOOL fileExists2 = [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/CodeResources", bundlePath]];
    BOOL fileExists3 = [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@/ResourceRules.plist", bundlePath ]];
    
    NSString* path = [NSString stringWithFormat:@"%@/Info.plist", bundlePath];
    NSDate* infoModifiedDate = [[[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil] fileModificationDate];
    NSDate* pkgInfoModifiedDate = [[[NSFileManager defaultManager] attributesOfItemAtPath:[NSString stringWithFormat:@"%@/PkgInfo", bundlePath] error:nil] fileModificationDate];
    
#if TARGET_IPHONE_SIMULATOR
    return;
#endif
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:APP_NAME message:@"Crack detected." delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
    
    if (!fileExists) {
        //Pirated
        if(kShowLog)
            NSLog(@"Pirated1");
        exit(0);
        //        [alert show];
    }
    else if (!fileExists2) {
        //Pirated
        if(kShowLog)
            NSLog(@"Pirated2");
        //        [alert show];
        exit(0);
    }
    else if (!fileExists3) {
        //Pirated
        if(kShowLog)
            NSLog(@"Pirated3");
        //        [alert show];
        exit(0);
    }
    else if(fabs([infoModifiedDate timeIntervalSinceReferenceDate] - [pkgInfoModifiedDate timeIntervalSinceReferenceDate]) > 600) {	
        if(kShowLog)
            NSLog(@"Pirated4");
        //        [alert show];
        exit(0);
	}
}


+(NSString*)getDeviceType
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
    if ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] &&
        [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        // iPad specific layout changes
        return @"iPad";
    }
    else
#endif
    {
        // iPhone layout
        return @"";
    }
}

 
+(void)animateView :(UIView *)view AnimationType:(ANIMATION_TYPE)animationType;
{
    
    if(animationType == ANIMATE_RIGHT_TO_LEFT || animationType == ANIMATE_LEFT_TO_RIGHT || animationType == ANIMATE_TOP_TO_BOTTOM || animationType == ANIMATE_BOTTOM_TO_TOP)
    {
        if(animationType == ANIMATE_RIGHT_TO_LEFT)
        {
            [view setFrame:CGRectMake(view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
        }
        else if(animationType == ANIMATE_LEFT_TO_RIGHT)
        {
            [view setFrame:CGRectMake(-view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
        }
        else if(animationType == ANIMATE_TOP_TO_BOTTOM)
        {
            [view setFrame:CGRectMake(view.frame.origin.x, -view.frame.size.height, view.frame.size.width, view.frame.size.height)];
        }
        else if(animationType == ANIMATE_BOTTOM_TO_TOP)
        {
            [view setFrame:CGRectMake(view.frame.origin.y, view.frame.size.height, view.frame.size.width, view.frame.size.height)];
        }
        [UIView beginAnimations:@"myanimation" context:nil];
        [UIView setAnimationDuration:kAnimationDuration];
        [view setFrame:CGRectMake(0.0f, 0.0f, view.frame.size.width, view.frame.size.height)];
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:@"myanimation" context:nil];
        [UIView setAnimationDuration:kAnimationDuration];
        
        
        
        if(animationType == ANIMATE_LEFT)
        {
            [view setFrame:CGRectMake(-view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
        }
        else if(animationType == ANIMATE_RIGHT)
        {
            [view setFrame:CGRectMake(view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
        }
        else if(animationType == ANIMATE_TOP)
        {
            [view setFrame:CGRectMake(view.frame.origin.x, -view.frame.size.height, view.frame.size.width, view.frame.size.height)];
        }
        else if(animationType == ANIMATE_BOTTOM)
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.size.height, view.frame.size.width, view.frame.size.height)];
        }
        
        [UIView commitAnimations];
    }
}

+(NSUInteger)indexOf:(NSString*)characterString InString:(NSString*)inString
{
    NSRange range = [inString rangeOfString:characterString];
    //    NSLog(@"%i", range.location);
    return range.location;
}

#pragma mark - IMAGE_FUNCTIONS

+ (NSString*)saveImageInDocuments:(UIImage*)senderImage {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	NSDate *selected = [NSDate date];
	
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"ddmmyyyyhhmmss"];
	NSString *imgName = [dateFormat stringFromDate:selected];
	imgName = [NSString stringWithFormat:@"%@.png",imgName];
    
	NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:imgName];
	
	UIImage *image = senderImage;
	NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
	[imageData writeToFile:savedImagePath atomically:YES];
	return imgName;
}

+ (UIImage*)getImageFromDocuments:(NSString*)senderImageName {
	
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:senderImageName];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL fileExist = [fileManager fileExistsAtPath:getImagePath]; // Returns a BOOL  
	
	UIImage *img = [[UIImage alloc] init];
	if(fileExist)
	{
		img = [[UIImage alloc] init];
		img = [UIImage imageWithContentsOfFile:getImagePath];
	}
	return img;
}

+ (void)removeImageFromDocuments:(NSString*)fileName {
	
	NSFileManager *fileManager = [NSFileManager defaultManager];	 
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);	 
	NSString *documentsDirectory = [paths objectAtIndex:0];	 
	NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", fileName]];
	
	[fileManager removeItemAtPath: fullPath error:NULL];
	
	NSLog(@"image removed from documents");
}


+(NSString*)replaceURLAndRetrunImageName:(NSString*)URL
{
	NSString *strContains = [NSString stringWithFormat:@"/"];
	NSString *currentCharacter = @"";
	for (int i =0; i< [URL length]; i++) {
		unichar ch = [URL characterAtIndex:i];
		NSString *str = [NSString stringWithCharacters:&ch length:1];		
		currentCharacter = [NSString stringWithFormat:@"%@", str];
		if([currentCharacter isEqualToString:strContains])
		{
			URL = [URL substringFromIndex:i+1];
			i = 0;
		}
	}
	return URL;
}
+(bool) doesFileExist: (NSString *)filePath 
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath];
}

+(UIImage *)getOrDownloadImage:(NSString*)photoUrl
{
    UIImage *image = [UIImage imageNamed:kPlaceHolderImageName];
	if (!photoUrl) {
		return image;
	}
	NSString *targetString = photoUrl;
	NSString *myImageName = @"";	
	myImageName = [MyCommonFunctions replaceURLAndRetrunImageName:targetString];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	NSString * filePath =  [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", myImageName]];
	//NSLog(filePath);
	
	if(![myImageName isEqualToString:@""])
	{	
		if([self doesFileExist:filePath])
		{
			NSLog(@"Image Found.");
			image = [UIImage imageWithContentsOfFile:filePath];
			return image;
		}
	}
	
	NSData *receivedData = [[NSData dataWithContentsOfURL:[NSURL URLWithString:photoUrl]] retain];
	if([receivedData length] > 0)
	{
		image = [UIImage  imageWithData:receivedData];		
		NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
		[imageData writeToFile:filePath atomically:YES];
		NSLog(@"Image downloaded to documents.");
	}
	return image;
}

+(UIImage *)getOrDownloadASyncImage:(NSString*)photoUrl AndPlaceHolder:(NSString *)placeHolderImageURL
{
    UIImageView *tempImgView = [[UIImageView alloc] init];
    tempImgView.image = [UIImage imageNamed:kPlaceHolderImageName];
    
	if (!photoUrl) {
		return tempImgView.image;
	}
	
    [tempImgView setImageWithURL:[NSURL URLWithString:photoUrl] placeholderImage:[UIImage imageNamed:placeHolderImageURL]];
	return tempImgView.image;
}



#pragma mark - DATE_FUNCTIONS

/* 
 SAMPLE CODE
 
 NSString *inputDateString = @"2007-08-11T19:30:00Z";
 NSString *outputDateString = [NSDateFormatter
 dateStringFromString:inputDateString
 sourceFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"
 destinationFormat:@"h:mm:ssa 'on' MMMM d, yyyy"];
 */
+ (NSString *)dateStringFromString:(NSString *)sourceString sourceFormat:(NSString *)sourceFormat destinationFormat:(NSString *)destinationFormat
{
	
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat:sourceFormat];
    NSDate *date = [dateFormatter dateFromString:sourceString];
    [dateFormatter setDateFormat:destinationFormat];
    return [dateFormatter stringFromDate:date];
}


/*
 SAMPLE CODE
 NSString *dateString = [[NSDate date] dateStringWithStyle:NSDateFormatterLongStyle];
 */

+ (NSString *)dateStringWithStyle:(NSDateFormatterStyle)style
{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateStyle:style];
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (NSDate*) convertToUTC:(NSDate*)sourceDate
{
    NSTimeZone* currentTimeZone = [NSTimeZone localTimeZone];
    NSTimeZone* utcTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    
    NSInteger currentGMTOffset = [currentTimeZone secondsFromGMTForDate:sourceDate];
    NSInteger gmtOffset = [utcTimeZone secondsFromGMTForDate:sourceDate];
    NSTimeInterval gmtInterval = gmtOffset - currentGMTOffset;
    
    NSDate* destinationDate = [[[NSDate alloc] initWithTimeInterval:gmtInterval sinceDate:sourceDate] autorelease];     
    return destinationDate;
}


+ (NSDate *) GMTNow
{ 
    NSDate *sourceDate = [NSDate date];
    NSTimeZone* currentTimeZone = [NSTimeZone localTimeZone];
    NSInteger currentGMTOffset = [currentTimeZone secondsFromGMT];
    
    sourceDate = [sourceDate addTimeInterval:currentGMTOffset];
    
    return sourceDate;
}

/* 
 SAMPLE CODE
 
 NSString *inputDateString = @"2007-08-11 19:30:00";
 NSString *outputDateString = [NSDateFormatter
 dateStringFromString:inputDateString
 sourceFormat:@"yyyy-MM-dd HH:mm:ss"
 destinationFormat:@"yyyy-MM-dd HH:mm:ss"];
 
 string=[MyCommonFunctions getRemainingTimeStringFromDateString:outputDateString TimeFormat:@"yyyy-MM-dd HH:mm:ss"];
 */

+(NSString*)getRemainingTimeStringFromDateString:(NSString*)StringTime TimeFormat:(NSString*)TimeFormat
{
	
    NSString *strTime=@"";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:TimeFormat];    
    NSString *tempStr = TimeFormat;
    NSString *inputDateString = [StringTime substringToIndex:[tempStr length]];
    NSDate *expiryDate = [dateFormatter dateFromString:inputDateString];
	NSDate *currentDate = [MyCommonFunctions GMTNow];
    //    int NoOfHours = [MyCommonFunctions howManyHoursHavePast:currentDate today:expiryDate];
    //  expiryDate = [expiryDate addTimeInterval:(NoOfHours-3)*60]; // add or subtract timezone
    //    expiryDate = [expiryDate addTimeInterval:5*60*60]; // add 5 hours [server is 5 hours back]
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	unsigned int unitFlagsRemaining = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
	NSDateComponents *components = [gregorian components:unitFlagsRemaining fromDate:currentDate toDate:expiryDate options:0];
	int remainingDays = [components day];
    int remainingHour = [components hour];
    remainingHour +=2;
	int remainingMin = [components minute];
	int remainingSec = [components second];
    
    if (remainingDays <= 0 && remainingHour <= 0 && remainingMin <= 0 && remainingSec <= 0){
		//[myTimer invalidate];
        
        //This deal has been expired.
        
        //[self goBack];
        
	}
    if(remainingDays > 0)
    {
        strTime = [NSString stringWithFormat:@"%02id %02ih: %02im: %02is", remainingDays, remainingHour, remainingMin,remainingSec];
    }
    
    else if(remainingHour > 0 || remainingMin>0 ||remainingSec>0)
        strTime = [NSString stringWithFormat:@"%02ih: %02im: %02is", remainingHour, remainingMin,remainingSec];
	
    return strTime;
    
}

#pragma mark - URL Shortner

+(NSString *)shortenedURLForURL:(NSString *)URLString { //can be used within this class, or from other classes
	
	return [NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://tinyurl.com/api-create.php?url=%@",URLString]] 
                                    encoding:NSASCIIStringEncoding 
                                       error:nil];
	
}


+(NSString *)textWithShortURLsFromText:(NSString *)Text {
    
	NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"(?i)\\b((?:[a-z][\\w-]+:(?:/{1,3}|[a-z0-9%])|www\\d{0,3}[.]|[a-z0-9.\\-]+[.][a-z]{2,4}/)(?:[^\\s()<>]+|\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\))+(?:\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\)|[^\\s`!()\\[\\]{};:'\".,<>?«»“”‘’]))" options:NSRegularExpressionCaseInsensitive error:NULL];
    int counter = 0;
    NSString *match = @"";
    match = [Text substringWithRange:[expression rangeOfFirstMatchInString:Text options:NSMatchingCompleted range:NSMakeRange(0, [Text length])]];
    NSMutableArray *matchedStringsArray = [[NSMutableArray alloc] init];
    while ([match  length] > 0) {
        [matchedStringsArray addObject:match];
        Text=[Text stringByReplacingOccurrencesOfString:match withString:[NSString stringWithFormat:@"~%%%i%%~", counter]];
        counter++;
        if([MyCommonFunctions contains:@"http://" InString:Text])
            match = [Text substringWithRange:[expression rangeOfFirstMatchInString:Text options:NSMatchingCompleted range:NSMakeRange(0, [Text length])]];
        else
            match = @"";
    }
    
    if([matchedStringsArray count] > 0)
    {
        for(int i=0; i< counter; i++)
        {
            Text=[Text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"~%%%i%%~", i] withString:[self shortenedURLForURL:[matchedStringsArray objectAtIndex:i]]];
        }
    }
    
    //    Text=[Text stringByReplacingOccurrencesOfString:match withString:[self shortenedURLForURL:match]];
    return Text;
}


#pragma mark - OTHER_FUNCTIONS

+(void)clearWebviewBG:(UIWebView *)myWebview
{
    for (UIView* subView in [myWebview subviews])
    {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            for (UIView* shadowView in [subView subviews])
            {
                if ([shadowView isKindOfClass:[UIImageView class]]) {
                    [shadowView setHidden:YES];
                }
            }
        }
    }
}

+ (void)isUserRemembered {
	/*
	
	NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
	NSData *dataRepresentingUser = [currentDefaults objectForKey:@"savedUser"];
	
	
	
	UserClass *savedUser;
	
	if ([dataRepresentingUser length] > 0) // user is already remembered
	{
		savedUser = (UserClass*)[NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingUser];
		[[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:savedUser] forKey:@"currentUser"];
	}
	else 
	{
		savedUser = nil;
	}
	
	if(!savedUser) // show login screen
	{
		// Override point for customization after app launch    
		Share_Your_RockViewController *syr = [[Share_Your_RockViewController alloc]initWithNibName:@"Share_Your_RockViewController" bundle:[NSBundle mainBundle]];
		navigationController = [[UINavigationController alloc]initWithRootViewController:syr]; 
		
		[navigationController.view addSubview:syr.view];
		
		[window addSubview:navigationController.view];		
	}
	else
	{
		if(savedUser.language  != nil)			
			if([savedUser.language isEqualToString:@"Spanish"])
			{
				isEnglishLanguage = NO;
			}
		// go to main menu view controller
		MainMenuViewController *mmvc = [[MainMenuViewController alloc] initWithNibName:@"MainMenuViewController" bundle:[NSBundle mainBundle]];
		navigationController = [[UINavigationController alloc]initWithRootViewController:mmvc]; 
		
		[navigationController.view addSubview:mmvc.view];
		
		[window addSubview:navigationController.view];
	}*/
}

+ (NSString *)stringWithUrl:(NSURL *)url {
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
												cachePolicy:NSURLRequestReturnCacheDataElseLoad
											timeoutInterval:30];
	// Fetch the JSON response
	NSData *urlData;
	NSURLResponse *response;
	NSError *error;
	
	// Make synchronous request
	urlData = [NSURLConnection sendSynchronousRequest:urlRequest
									returningResponse:&response
												error:&error];
	
 	// Construct a String around the Data from the response
	return [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
}
 
+ (UIImage*)scaleImage:(UIImage *)img toSize:(CGSize) targetSize {
    if (img == nil)
        return nil;
        
    UIImage * sourceImage = img;
	
    UIImage *newImage = nil;        
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
	//    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) 
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
		//        if (widthFactor > heightFactor) 
		//            scaleFactor = widthFactor; // scale to fit height
		//        else
		//            scaleFactor = heightFactor; // scale to fit width
		//        scaledWidth  = width * scaleFactor;
		//        scaledHeight = height * scaleFactor;
        
        scaledWidth = width * widthFactor;
        scaledHeight = height * heightFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
        }
        else 
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }       
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) 
        NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

+(BOOL)contains:(NSString*) strContains InString:(NSString*)targetString {
	//NSNotFound is a built i variable; it's value is 0
	
	if([[NSString stringWithFormat:@"%@", targetString] isEqualToString:@"(null)"] == TRUE)
		return FALSE;
	if([targetString length] == 0)
		return FALSE;
	
	if ([targetString rangeOfString:strContains].location == NSNotFound) {
		return FALSE;
	} else {
		return TRUE;		
	}
}


+(BOOL)isCoordinateValid:(NSString*)coordinate
{
	if([[NSString stringWithFormat:@"%@", coordinate] isEqualToString:@"(null)"] == TRUE)
		return FALSE;
	if([coordinate length] == 0)
		return FALSE;
	
	NSString *RegEx = @"[-]?[0-9]{1,3}[.]{1}[0-9]{2,6}";

	NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", RegEx];
	BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:coordinate];
	if(!myStringMatchesRegEx)
	{
		return FALSE;
	}
	return TRUE;
}


+(BOOL)isEmailValid:(NSString*)emailAddress
{
	if([[NSString stringWithFormat:@"%@", emailAddress] isEqualToString:@"(null)"] == TRUE)
		return FALSE;
	if([emailAddress length] == 0)
		return FALSE;
		
	NSString *email = [emailAddress lowercaseString];
	NSString *emailRegEx =
	@"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
	@"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
	@"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
	@"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
	@"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
	@"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
	@"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";

	NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
	BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:email];
	if(!myStringMatchesRegEx)
	{		
		return FALSE;
	}
	return TRUE;
}



@end
