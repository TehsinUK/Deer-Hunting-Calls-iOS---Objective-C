//
//  
//  xFit Abs
//
//  Created by Naveed Butt on 22/08/2013.
//  Copyright 2013 WIN Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ANIMATE_LEFT_TO_RIGHT,
    ANIMATE_RIGHT_TO_LEFT,
    ANIMATE_TOP_TO_BOTTOM,
    ANIMATE_BOTTOM_TO_TOP,
    ANIMATE_TOP,
    ANIMATE_BOTTOM,
    ANIMATE_LEFT,
    ANIMATE_RIGHT
} ANIMATION_TYPE;

@interface MyCommonFunctions : NSObject {

	
}


+(NSString *)shortenedURLForURL:(NSString *)URL; 
+(NSString *)textWithShortURLsFromText:(NSString *)Text;
+(void)checkIfAppIsCracked;
+(NSString*)getDeviceType;
+(void)animateView :(UIView *)view AnimationType:(ANIMATION_TYPE)animationType;
+(NSUInteger)indexOf:(NSString*)characterString InString:(NSString*)inString;
+ (NSString*)saveImageInDocuments:(UIImage*)senderImage;
+ (UIImage*)getImageFromDocuments:(NSString*)senderImageName;
+ (void)removeImageFromDocuments:(NSString*)fileName;
+(UIImage *)getOrDownloadImage:(NSString*)photoUrl;
+(bool) doesFileExist: (NSString *)filePath;
+ (NSString *)dateStringFromString:(NSString *)sourceString sourceFormat:(NSString *)sourceFormat destinationFormat:(NSString *)destinationFormat;
+ (NSString *)dateStringWithStyle:(NSDateFormatterStyle)style;
+(NSString*)getRemainingTimeStringFromDateString:(NSString*)StringTime TimeFormat:(NSString*)TimeFormat;
+ (void)isUserRemembered ;
+ (UIImage*)scaleImage:(UIImage *)img toSize:(CGSize) targetSize;
+(BOOL)contains:(NSString*) strContains InString:(NSString*)targetString;
+(BOOL)isCoordinateValid:(NSString*)coordinate;
+(BOOL)isEmailValid:(NSString*)emailAddress;
+(void)clearWebviewBG:(UIWebView *)myWebview;


@end
