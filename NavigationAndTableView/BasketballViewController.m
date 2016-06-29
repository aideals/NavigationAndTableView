//
//  BasketballViewController.m
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/6/9.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "BasketballViewController.h"

@interface BasketballViewController ()
@property (nonatomic,copy) NSArray *candyArray;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchController *candySearchController;
@property (nonatomic,copy) NSMutableArray *filteredCandyArray;
@end

@implementation BasketballViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.candyArray = [NSArray arrayWithObjects:[Candy candyOfCategory:@"chocolate" name:@"chocolate bar"],
                    [Candy candyOfCategory:@"chocolate" name:@"chocolate chip"],
                    [Candy candyOfCategory:@"chocolate" name:@"dark chocolate"],
                    [Candy candyOfCategory:@"hard" name:@"lollipop"],
                    [Candy candyOfCategory:@"hard" name:@"candy cane"],
                    [Candy candyOfCategory:@"hard" name:@"jaw breaker"],
                    [Candy candyOfCategory:@"other" name:@"caramel"],
                    [Candy candyOfCategory:@"other" name:@"sour chew"],
                    [Candy candyOfCategory:@"other" name:@"peanut butter cup"],
                    [Candy candyOfCategory:@"other" name:@"gummi bear"],nil];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    self.candySearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.candySearchController.delegate = self;
    self.candySearchController.searchResultsUpdater = self;
    self.candySearchController.dimsBackgroundDuringPresentation = YES;
    self.candySearchController.obscuresBackgroundDuringPresentation = NO;
    self.candySearchController.hidesNavigationBarDuringPresentation = NO;
    self.candySearchController.searchBar.frame = CGRectMake(self.candySearchController.searchBar.frame.origin.x, self.candySearchController.searchBar.frame.origin.y, self.candySearchController.searchBar.frame.size.width, 44.0);
    
    self.tableView.tableHeaderView = self.candySearchController.searchBar;
   
    
    [self.view addSubview:self.tableView];

    self.filteredCandyArray = [NSMutableArray arrayWithCapacity:[self.candyArray count]];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.candySearchController.active) {
        return [self.filteredCandyArray count];
    }
    else {
    return [self.candyArray count];

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *reuseIdentifier = @"reuse";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }

    Candy *candy = nil;
    
    
    if (self.candySearchController.active) {
        candy = [self.filteredCandyArray objectAtIndex:indexPath.row];
    }
    else {
        candy = [self.candyArray objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = candy.name;
    
    return cell;

}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = [self.candySearchController.searchBar text];
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"SELE.name contains[c] %@",searchString];
    self.filteredCandyArray = [NSMutableArray arrayWithArray:[self.candyArray filteredArrayUsingPredicate:predicate]];
    
    [self.tableView reloadData];
    
}

@end
