//
//  Candy.m
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/6/26.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "Candy.h"

@implementation Candy

+ (id)candyOfCategory:(NSString *)category name:(NSString *)name
{
    Candy *newCandy = [[self alloc] init];
    newCandy.category = category;
    newCandy.name = name;

    return newCandy;
}



@end
