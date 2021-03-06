/*!
 @header CHCUFTool.h
 @abstract 基础工具类 主要是或许系统的基本信息 此类划分为:硬件信息,软件（系统）信息,网络信息
 @author Lemon
 @version 0.5 2012/03/28 Creation 
 @Copyright 2012 Hecom. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HCLog.h"
#import <sys/utsname.h>
#include <AdSupport/AdSupport.h>
//#import <float.h>

  // 判断是不是568 iphone5 长屏幕
#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
  // 判断是否是iphone
#define IS_IPHONE ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone" ] )
  // 判断是否是ipod
#define IS_IPOD   ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPod touch" ] )
  //  判断是否是iphone5
#define IS_IPHONE_5 ( IS_IPHONE && IS_WIDESCREEN )
  //  判断是否是iPod touch5
#define IS_IPOD_TOUCH_5 ( IS_IPOD && IS_WIDESCREEN )
  // 获取当前os版本  
#define HC_CURENT_OS_V [[[UIDevice currentDevice] systemVersion] floatValue]
#define HCCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
// 获取当前屏幕高度
#define HC_CUERNT_SCREEN_HEIGHT [[ UIScreen mainScreen ] bounds ].size.height

// 判断当前设备尺寸 - Add By Conway
#define DEVICE_3_5_INCH ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define DEVICE_4_INCH ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define DEVICE_4_7_INCH ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define DEVICE_5_5_INCH ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/*!
 @enum
 @abstract IOS各种设备
 @constant            
*/
enum {
  MODEL_IPHONE_SIMULATOR,
  MODEL_IPOD_TOUCH,
  MODEL_IPOD,
  MODEL_IPOD_TOUCH5,
  MODEL_IPHONE,
  MODEL_IPHONE_3G,
  MODEL_IPHONE_3GS,
  MODEL_IPHONE_4,
  MODEL_IPHONE_4S,
  MODEL_IPHONE_5,
  MODEL_IPHONE_5C,
  MODEL_IPHONE_5S,
  MODEL_IPHONE_6,
  MODEL_IPHONE_6_PLUS,
  MODEL_IPAD,
  MODEL_IPAD2,
  MODEL_NEWPAD,
  MODEL_IPAD4,
  MODEL_IPADAIR,
  MODEL_IPADMINI,
  MODEL_IPADMINI_RETINA,
  MODEL_UNKNOWN
};
   
@interface CHCUFTool : NSObject
{
  NSString *fontName;
  CGFloat    pointSize;
  CGFloat    ascender;
  CGFloat    descender;
  CGFloat    capHeight;
  CGFloat    xHeight;
}

/*!
 @method
 @abstract 获取ios设备的MAC地址
 @discussion 
 @result 返回结果不需要释放  
 */
+ (NSString *) getMacAddress;
/*!
 @method
 @abstract 获取ios设备的advertisingIdentifier
 @discussion
 @result 返回结果不需要释放
 */
+ (NSString *) advertisingIdentifier;

/*!
 @method
 @abstract 获取设备类型信息
 @discussion 
 @result 返回结果不需要释放  
 */
+ (uint) detectDevice;

/*!
 @method
 @abstract 获取ios设备的类型和版本
 @discussion 
 @result 返回结果不需要释放  
 */
+ (NSString *) getDeviceName:(BOOL)ignoreSimulator;

/*!
 @method
 @abstract 具体判断是不是iphone设备，常用于电话，短信的调用功能
 @discussion 
 @result
 */
+ (BOOL) isIPodTouch;

/*!
 @method
 @abstract 获取系统的内存信息  返回剩余内存数。
 @discussion 
 @result   
 */
+ (double)availableMemory;
/*!
 @method
 @abstract 获取产品编号
 @discussion a string unique to each device based on various hardware info
 @result 返回结果不需要释放  
 */
//+ (NSString*)getUniqueIdentifier ;

/*!
 @method
 @abstract 获取本地模式信息
 @discussion 
 @result 返回结果不需要释放  
 */
+ (NSString*)getLocalizedModel;
/*!
 @method
 @abstract 系统版本信息
 @discussion 
 @result 返回结果不需要释放  
 */
+ (NSString*)getSystemVersion;
/*!
 @method
 @abstract 系统名称信息
 @discussion 
 @result 返回结果不需要释放  
 */
+ (NSString*)getSystemName;
/*!
 @method
 @abstract 获取模式信息，iphone ipod or ipad。
 @discussion 
 @result 返回结果不需要释放  
 */
+ (NSString*)getModel;

/*!
 @method  获取总体的信息
 @abstract 在实际开发中，有时需要考虑到兼容性问题，这两个信息还是很有用的，我一般都是程序开始时读取，存到公共变量里。
 @discussion 
 @result  
 */
//在实际开发中，有时需要考虑到兼容性问题，这两个信息还是很有用的，我一般都是程序开始时读取，存到公共变量里。
//- (void)getDeviceAndOSInfo;

/*!
 @method
 @abstract 获取设备的IMSI。
 @discussion 
 @result 返回结果不需要释放  
 */
+ (NSString*)getIMSI;
/*!
 @method
 @abstract 获取设备的IMEI。
 @discussion 
 @result 返回结果不需要释放  
 */
+ (NSString*)getIMEI;

/*!
 @method
 @abstract     
 @discussion 
 @param       参数imsi 为ios设备imsi 
 @result      返回结果运营商的英文名称  
 @result      “China Mobile”   中国移动   "China Unicom"   中国联通 
              "China Telecom"  中国电信   "China Tietong"  中国铁通
 
 */
+ (NSString*)getOperator:(NSString*)aimsi;
/*!
 @method
 @abstract 获取设备获取当前使用语言的状态。
 @discussion 
 @result 返回结果不需要释放  
 */
+ (NSString*)getLanuageState;
/*!
 @method
 @abstract 获取设备获取当前ip地址。
 @discussion 
 @result 返回结果不需要释放  
 */
+(NSString *)getIpAddress;

/*!
 @method  获取UIFont实例的字体大小。
 @abstract 
 @discussion 
 @param      
 @result  
 */
//+ (UIFont *) boldFont;
/*!
 @method
 @abstract    获取应用程序的分辨率，结果类似于：320*480
 @discussion  
 @result      返回结果不需要释放 
 */

+ (NSString *)getAppScreenResolution; 
/*!
 @method
 @abstract    获取设备的分辨率，结果类似于：320*480
 @discussion  
 @result      返回结果不需要释放 
 */
+ (NSString *) getDeviceScreenResolution:(BOOL)ignoreSimulator;
/*!
 @method
 @abstract    获取屏幕的尺寸，结果类似于：35
 @discussion  
 @result      返回结果不需要释放 
 */

+ (NSString *) getDeviceScreenSize:(BOOL)ignoreSimulator;

/*!
 @method
 @abstract    获取设备的类型，返回:phone，pad
 @discussion  
 @result      返回结果不需要释放 
 */

+ (NSString *)getDeviceType;
/*!
 *	@method
 *	@abstract	wifi是否可用
 *	@discussion	
 *	@result	
 */
+ (BOOL)isWifiAble;
/*!
 *	@method
 *	@abstract	是否是手机
 *	@discussion
 *	@result
 */
+ (BOOL) isIphone;
/*!
 *	@method
 *	@abstract	获取app version
 *	@discussion
 *	@result
 */
+ (NSString *) appVersion;
/*!
 *	@method
 *	@abstract	获取build 
 *	@discussion
 *	@result
 */
+ (NSString *) appbuild;
/*!
 *	@method
 *	@abstract	 获取 version build
 *	@discussion
 *	@result
 */
+ (NSString *) versionBuild;
/*!
 	@method
 	@abstract	判断是否高清屏幕
 	@discussion
 	@result
 */
+ (BOOL) isRetinaDisplay;

/*!
 *	@method
 *	@abstract	 与传入的参数aNewVersion 比较当前app version与其大小 
 *  @param 
 *	@discussion aNewVersion 服务器上的app 版本
 *	@result NSInteger 如果当前app version大于传入参数 返回正数，否则返回负数，相等返回0
 */
+ (NSInteger) compareCurrentAppVersionWithString:(NSString *)aNewVersion;
@property(nonatomic,readonly,retain) NSString *familyName;
@property(nonatomic,readonly,retain) NSString *fontName;
@property(nonatomic,readonly)        CGFloat   pointSize;
@property(nonatomic,readonly)        CGFloat   ascender;
@property(nonatomic,readonly)        CGFloat   descender;
@property(nonatomic,readonly)        CGFloat   capHeight;
@property(nonatomic,readonly)        CGFloat   xHeight;
@end
