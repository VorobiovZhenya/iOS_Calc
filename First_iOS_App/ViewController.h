//
//  ViewController.h
//  First_iOS_App
//
//  Created by Zhenya on 25/01/16.
//  Copyright © 2016 Zhenya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "calc.h"

@interface ViewController : UIViewController
{
    IBOutlet UILabel *displayLabel;
    NSString * operand;
    double x,y;
    BOOL dotStatus;
    long operationTag;
}

-(IBAction)digits:(id)sender;
-(IBAction)operations:(id)sender;
-(IBAction)clearAll:(id)sender;
-(IBAction)inversSign:(id)sender;
-(IBAction) percent:(id)sender;


@end

