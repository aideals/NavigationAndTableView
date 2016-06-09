//
//  TableViewController.h
//  NavigationAndTableView
//
//  Created by 鹏 刘 on 16/6/1.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppleViewController.h"
#import "TeaViewController.h"
#import "PlayViewController.h"
#import "BasketballViewController.h"
#import "DogViewController.h"
#import "CatViewController.h"
#import "IphoneViewController.h"

@interface TableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) AppleViewController *avc;
@property (nonatomic,strong) TeaViewController *tvc;
@property (nonatomic,strong) PlayViewController *pvc;
@property (nonatomic,strong) BasketballViewController *bvc;
@property (nonatomic,strong) DogViewController *dvc;
@property (nonatomic,strong) CatViewController *cvc;
@property (nonatomic,strong) IphoneViewController *ivc;

@end
