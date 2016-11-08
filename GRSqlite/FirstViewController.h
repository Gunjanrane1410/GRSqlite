//
//  FirstViewController.h
//  GRSqlite
//
//  Created by Student P_05 on 07/11/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "GRDatabaseManager.h"
@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *allTaskArray;
}

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

