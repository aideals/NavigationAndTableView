//
//  apple.m
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/6/9.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "AppleViewController.h"

@interface AppleViewController ()
{
    UITableView *tableViewCopy;
}
@property (nonatomic) NSArray *ary1;
@property (nonatomic) NSArray *ary2;
@property (nonatomic) NSArray *ary3;
@property (nonatomic) NSArray *ary4;
@property (nonatomic) NSArray *ary5;
@property (nonatomic) NSArray *ary6;
@end

@implementation AppleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableViewCopy = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, 320, self.view.frame.size.height - 45) style:UITableViewStyleGrouped];
    tableViewCopy.delegate = self;
    tableViewCopy.dataSource = self;
    
    [self.view addSubview:tableViewCopy];
    
    self.ary1 = [[NSArray alloc] initWithObjects:@"dog",@"cat",@"apple",@"pen",@"box",@"view", nil];
    self.ary2 = [[NSArray alloc] initWithObjects:@"blue",@"green",@"yellow",@"banana",@"red",@"black", nil];
    self.ary3 = [[NSArray alloc] initWithObjects:@"copy",@"wrong",@"right",@"white",@"array",@"run", nil];
    self.ary4 = [[NSArray alloc] initWithObjects:@"and",@"table",@"delegate",@"or",@"data",@"rect", nil];
    self.ary5 = [[NSArray alloc] initWithObjects:@"navigation",@"app",@"box",@"play",@"laugh",@"football", nil];
    self.ary6 = [[NSArray alloc] initWithObjects:@"call",@"basketball",@"phone",@"width",@"subview",@"file", nil];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (!(section == 0)) {
        return 0;
    }
    else
    {
        return 35.0;
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"one",@"two",@"three",@"four",@"five",@"six", nil];
    NSString *headerAry = [array objectAtIndex:section];
    
    return headerAry;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    NSString *identifier = @"section";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    switch (section) {
        case 0:
            cell.textLabel.text = [self.ary1 objectAtIndex:row];
            break;
        case 1:
            cell.textLabel.text = [self.ary2 objectAtIndex:row];
            break;
        case 2:
            cell.textLabel.text = [self.ary3 objectAtIndex:row];
            break;
        case 3:
            cell.textLabel.text = [self.ary4 objectAtIndex:row];
            break;
        case 4:
            cell.textLabel.text = [self.ary5 objectAtIndex:row];
            break;
        case 5:
            cell.textLabel.text = [self.ary6 objectAtIndex:row];
            break;
        
        default:
            break;
    }
    
    
    
    return cell;
}

@end
