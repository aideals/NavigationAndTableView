//
//  Candy.h
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/6/26.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Candy : NSObject
@property (nonatomic,copy) NSString *category;
@property (nonatomic,copy) NSString *name;

+ (id)candyOfCategory:(NSString *)category name:(NSString *)name;

@end
