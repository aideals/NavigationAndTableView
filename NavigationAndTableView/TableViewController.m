//
//  TableViewController.m
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/6/1.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController()
@property (nonatomic) NSArray *cellList;

@end


@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.cellList = [[NSArray alloc] initWithObjects:@"apple",@"tea",@"play",@"basketball",@"dog",@"cat",@"iphone", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    UITableViewCell *cell;
    
    NSString *identifier = @"cell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [self.cellList objectAtIndex:row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    
}


@end
