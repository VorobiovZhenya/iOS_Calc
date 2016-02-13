//
//  ViewController.m
//  First_iOS_App
//
//  Created by Zhenya on 25/01/16.
//  Copyright © 2016 Zhenya. All rights reserved.
//

#import "ViewController.h"
enum
{   PLUS = 10,
    MINUS = 11,
    MULTI = 12,
    DIV = 13,
    EQUAL = 14
};

@implementation ViewController


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self test];
    [self reset];
    
}

-(void)reset
{
    operationTag = 0;
    dotStatus = NO;
    equalStatus = NO;
    operand = @"";
    displayLabel.text = @"0";
    x = 0;
    y = 0;
}

-(IBAction)digits:(id)sender
{
    
    NSLog(@"%li", [sender tag]);
    if (equalStatus) {
        [self reset];
    }
    operand = [NSString stringWithFormat:@"%@%li", operand,[sender tag]];
    displayLabel.text = operand;
}

-(IBAction)dot:(id)sender
{
    
    NSLog(@"dot");
    
    if (equalStatus) {
        [self reset];
    }
    if (!dotStatus)
    {
        if ([operand isEqual:@""]) {
            operand = [NSString stringWithFormat:@"%@",@"0."];
        } else{
            operand = [NSString stringWithFormat:@"%@%@", operand,@"."];
        }
    }
    dotStatus = YES;
    displayLabel.text = operand;
}

-(IBAction)operations:(id)sender
{
    NSLog(@"operations");
    if ([operand isEqual:@""]) {
        operationTag = [sender tag];
    } else
    {
        if (equalStatus && ([sender tag] != EQUAL))
        {
            equalStatus = NO;
        } else
        {
            x = [operand doubleValue];
            switch (operationTag)
            {
                case PLUS:
                    y = y+x;
                    break;
                case MINUS:
                    y = y-x;
                    break;
                case MULTI:
                    y = y*x;
                    break;
                case DIV:
                    y = y/x;
                    break;
                    
                default:
                    y = x;
                    break;
            }
        }
        if ([sender tag] != EQUAL)
        {
            operationTag = [sender tag];
            operand = @"";
        }else{
            equalStatus = YES;
        }
        displayLabel.text = [NSString stringWithFormat:@"%g",y];
        dotStatus = NO;
    }
}

-(IBAction)percent:(id)sender
{
    operand = [NSString stringWithFormat:@"%g",([operand doubleValue]/100*y)];
    displayLabel.text = operand;
}

-(IBAction)clearAll:(id)sender
{
    NSLog(@"clearAll");
    [self reset];
}

-(IBAction)inversSign:(id)sender
{
    NSLog(@"inversSign");
    if ((equalStatus) || [operand isEqual:@""]) {
        y=-y;
        displayLabel.text = [NSString stringWithFormat:@"%g",y];
    }else{
        operand = [NSString stringWithFormat:@"%g",([operand doubleValue]*(-1))];
        displayLabel.text = operand;
    }
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


