//
//  calc.m
//  First_iOS_App
//
//  Created by Zhenya on 26/01/16.
//  Copyright © 2016 Zhenya. All rights reserved.
//

#import "calc.h"

@implementation calc

-(NSString *) counter:(double)firstarg secondarg:(double)secondarg operation:(NSString*)operation
{

    NSString *sum = @"sum";
    NSString *sub = @"sub";
    NSString *mul = @"mul";
    NSString *div = @"div";
    if (operation == sum) {return [NSString stringWithFormat:@"%f",(firstarg + secondarg)];}
    else if (operation == sub) {return [NSString stringWithFormat:@"%f",(firstarg - secondarg)];}
    else if (operation == mul) {return [NSString stringWithFormat:@"%f",(firstarg * secondarg)];}
    else if (operation == div) {return [NSString stringWithFormat:@"%f",(firstarg / secondarg)];}
    else {return @"Err";}
    
    
}

@end
