//
//  UIColor+Hex.m
//  FoodYou
//
//  Created by HEcom on 15/9/28.
//  Copyright (c) 2015年 AZLP. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+ (UIColor *)colorWithHex:(uint) hex
{
  int red, green, blue, alpha;
  
  blue = hex & 0x000000FF;
  green = ((hex & 0x0000FF00) >> 8);
  red = ((hex & 0x00FF0000) >> 16);
  alpha = ((hex & 0xFF000000) >> 24);
  
  return [UIColor colorWithRed:red/255.0f
                         green:green/255.0f
                          blue:blue/255.0f
                         alpha:alpha/255.f];
}

+ (UIColor *)colorWithHex:(uint) hex andAlpha:(float) alpha
{
  int red, green, blue;
  
  blue = hex & 0x000000FF;
  green = ((hex & 0x0000FF00) >> 8);
  red = ((hex & 0x00FF0000) >> 16);
  
  return [UIColor colorWithRed:red/255.0f
                         green:green/255.0f
                          blue:blue/255.0f
                         alpha:alpha];
}
@end
