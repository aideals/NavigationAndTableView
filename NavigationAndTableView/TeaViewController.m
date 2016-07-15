//
//  TeaViewController.m
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/6/9.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "TeaViewController.h"

@interface TeaViewController ()
@property (nonatomic,strong) MKMapView *mapView;
@end


@implementation TeaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.zoomEnabled = YES;
    self.mapView.scrollEnabled = YES;
    self.mapView.rotateEnabled = YES;
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    [self.view addSubview:self.mapView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMap:)];
    [self.mapView addGestureRecognizer:tap];
}

- (IBAction)tapMap:(UITapGestureRecognizer *)tap
{
    CGPoint point = [tap locationInView:tap.view];
    
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    
    MyAnnotation *annotation = [[MyAnnotation alloc] init];
    annotation.title = @"我喜欢小芳";
    annotation.subTitle = @"很喜欢";
    annotation.coordinate = coordinate;
    [self.mapView addAnnotation:annotation];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (![annotation isKindOfClass:[MyAnnotation class]])
        return nil;
    
    static NSString *reuID = @"reuAnnotation";
    
    MKAnnotationView *annView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuID];
    
    if (annView == nil) {
        annView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuID];
        annView.calloutOffset = CGPointMake(0, -10);
        annView.canShowCallout = YES;
        annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
        annView.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
        annView.annotation = annotation;
        
    }
    return annView;    
}

@end
