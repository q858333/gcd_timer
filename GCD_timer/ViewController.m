//
//  ViewController.m
//  GCD_timer
//
//  Created by dengbin on 14/9/22.
//  Copyright (c) 2014年 IUAIJIA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //间隔是1秒
    
    uint64_t interval = 1 * NSEC_PER_SEC;
    
    //创建一个专门执行timer回调的GCD队列
    
    dispatch_queue_t queue = dispatch_queue_create("my queue", 0);
    
    //创建Timer
    
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //使用dispatch_source_set_timer函数设置timer参数
    
    dispatch_source_set_timer(_timer, dispatch_time(DISPATCH_TIME_NOW, 0), interval, 0);
    
    //设置回调
    
    dispatch_source_set_event_handler(_timer, ^()
    {
        
        _sum++;
        
        NSLog(@"%d",_sum);
                                          
        
        if (_sum==10)
        {
            
            dispatch_source_cancel(_timer);
                                              
        }
        
        NSLog(@"Timer %@", [NSThread currentThread]);
                                          
        
    });
    
    dispatch_source_set_cancel_handler(_timer, ^{
        NSLog(@"cancel");
        
    });
    
    //dispatch_source默认是Suspended状态，通过dispatch_resume函数开始它
    
    dispatch_resume(_timer);
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
