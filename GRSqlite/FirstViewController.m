//
//  FirstViewController.m
//  GRSqlite
//
//  Created by Student P_05 on 07/11/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [self reloadTask];
}
-(void)reloadTask{
    
    allTaskArray =[[GRDatabaseManager sharedManager]getAllTask];
    
    [self.myTableView reloadData];
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return allTaskArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [allTaskArray objectAtIndex:indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Delete");
    
    
    NSString *task = [allTaskArray objectAtIndex:indexPath.row];
    
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM TASK_TABLE WHERE TASK_ID = '%@'",task.uppercaseString];
    
    if ([[GRDatabaseManager sharedManager]executeQuery:deleteQuery] == 1) {
        NSLog(@"Successfully Deleted");
        [self reloadTask];
    }
    else {
        NSLog(@"Failed to Delete Task.");
        
    }
    
    
}

@end
