//
//  PlayViewController.m
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/6/9.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()
@property (nonatomic,strong) UISegmentedControl *segmented;

@end

@implementation PlayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *segmentedList = [[NSArray alloc] initWithObjects:@"apple",@"banana",@"dog",@"dragon", nil];
    self.segmented = [[UISegmentedControl alloc] initWithItems:segmentedList];
    self.segmented.frame = CGRectMake(0, 65, self.view.frame.size.width, 45);
    
    self.segmented.selectedSegmentIndex = 0;
    
    [self.segmented addTarget:self action:@selector(doSomethingSegment:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.segmented];
    
}

- (IBAction)doSomethingSegment:(UISegmentedControl *)seg
{
    NSInteger index = seg.selectedSegmentIndex;
    
    
    
    
}


@end
