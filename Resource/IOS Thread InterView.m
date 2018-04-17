//
//  ViewController.m
//  Demo
//
//  Created by 燕文强 on 2017/7/19.
//  Copyright © 2017年 燕文强. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)onClick:(id)sender {
    [self func1];
//    [self func2];
}

- (void)func1{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(80, 80, 200, 200)];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    
    [NSThread sleepForTimeInterval:2];
    
    [view removeFromSuperview];
}

- (void)func2{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(80, 80, 200, 200)];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    
    [NSThread sleepForTimeInterval:2];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:2];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(80, 80, 200, 200)];
            [view2 setBackgroundColor:[UIColor redColor]];
            [self.view addSubview:view2];
        });
    });
    
    [view removeFromSuperview];
}

@end
