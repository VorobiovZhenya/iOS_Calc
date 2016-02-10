//
//  ViewController.m
//  First_iOS_App
//
//  Created by Zhenya on 25/01/16.
//  Copyright © 2016 Zhenya. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self test];
    operand = [[NSString alloc] init];
    dotStatus = NO;
    
}
-(IBAction)digits:(id)sender
{
    
    NSLog(@"%li", [sender tag]);
    operand = [NSString stringWithFormat:@"%@%li", operand,[sender tag]];
    displayLabel.text = operand;
}

-(IBAction)dot:(id)sender
{
    
    NSLog(@"dot");
    if (!dotStatus)
    {
      operand = [NSString stringWithFormat:@"%@%@", operand,@"."];
    }
    
    dotStatus = YES;
    displayLabel.text = operand;
}

-(IBAction)operations:(id)sender
{
    NSLog(@"operations");
    
        x = [operand doubleValue];
        switch (operationTag)
            {
            case 10:
                x =y+x;
                break;
            case 11:
                x =y-x;
                break;
            case 12:
                x =y*x;
                break;
            case 13:
                x =y/x;
                break;
        
            default:
                break;
            }
        y = x;
        displayLabel.text = [NSString stringWithFormat:@"%f",x];
    
    if ([sender tag] != 14) {
        operationTag = [sender tag];
    }
    operand = @"";
    dotStatus = NO;
}

-(IBAction)clearAll:(id)sender
{
    NSLog(@"clearAll");
    dotStatus = NO;
    operand = @"";
    displayLabel.text = @"0";
    x = 0;
    y = 0;
}

-(IBAction)inversSign:(id)sender
{
  NSLog(@"inversSign");
}

-(IBAction) percent:(id)sender
{
    NSLog(@"percent");
}

-(void)test
{
    calc *newCalc = [[calc alloc] init];
    double a = 100.5;
    double b =4.154;
    NSString *oper = @"div";
    NSString * resStr = [newCalc counter:a secondarg:b operation:oper];
    NSLog(@"%@",resStr);
    NSLog(@"test");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


