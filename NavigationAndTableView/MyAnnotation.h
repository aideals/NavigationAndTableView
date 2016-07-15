//
//  MyAnnotation.h
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/7/10.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subTitle;
@property (nonatomic) CLLocationCoordinate2D *mycoordinate;
@end
