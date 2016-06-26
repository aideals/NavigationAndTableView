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
@property (nonatomic,strong) UISearchBar *candySearchBar;
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

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.candySearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
    self.candySearchBar.delegate = self;
    self.candySearchBar.placeholder = @"search candy";
    
    
    [self.tableView addSubview:self.candySearchBar];
    [self.view addSubview:self.tableView];

    self.filteredCandyArray = [NSMutableArray arrayWithCapacity:[self.candyArray count]];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.candyArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *reuseIdentifier = @"reuse";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }

    Candy *candy = nil;
    candy = [self.candyArray objectAtIndex:indexPath.row];

    cell.textLabel.text = candy.name;
    
    return cell;

}

- (void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    [self.filteredCandyArray removeAllObjects];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    
    self.filteredCandyArray = [NSMutableArray arrayWithArray:[self.candyArray filteredArrayUsingPredicate:predicate]];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    
}



@end
