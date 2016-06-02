//
//  ViewController.m
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/5/31.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *bt;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.bt = [[UIButton alloc] initWithFrame:CGRectMake(100, 350, 175, 75)];
    [self.bt setTitle:@"Go To SecondView" forState:UIControlStateNormal];
    [self.bt addTarget:self action:@selector(GoToNextView:) forControlEvents:UIControlEventTouchDown];
    [self.bt setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.bt];

    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(selectLeftAction:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(selectRightAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (IBAction)selectLeftAction:(id)sender
{
   
}



- (IBAction)GoToNextView:(id)sender
{
    TableViewController *tvc = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:tvc animated:YES];
    tvc.title = @"TableView";
}



@end
