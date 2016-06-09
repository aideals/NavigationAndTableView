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
    
    switch (row) {
        case 0:
            self.avc = [[AppleViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:_avc animated:YES];
            self.avc.title = @"Apple";
            break;
            
        case 1:
            self.tvc = [[TeaViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:_tvc animated:YES];
            self.tvc.title = @"Tea";
            break;
            
        case 2:
            self.pvc = [[PlayViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:_pvc animated:YES];
            self.pvc.title = @"Play";
            break;
            
        case 3:
            self.bvc = [[BasketballViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:_bvc animated:YES];
            self.bvc.title = @"Basketball";
            break;
            
        case 4:
            self.dvc = [[DogViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:_dvc animated:YES];
            self.dvc.title = @"Dog";
            break;
            
        case 5:
            self.cvc = [[CatViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:_cvc animated:YES];
            self.cvc.title = @"Cat";
            break;
            
        case 6:
            self.ivc = [[IphoneViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:_ivc animated:YES];
            self.ivc.title = @"Iphone";
            break;
        
        default:
            break;
    }
    
    
}


@end
