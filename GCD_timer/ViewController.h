//
//  ViewController.h
//  GCD_timer
//
//  Created by dengbin on 14/9/22.
//  Copyright (c) 2014年 IUAIJIA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    dispatch_source_t _timer;
    int _sum;
}

@end

