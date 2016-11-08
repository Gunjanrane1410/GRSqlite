//
//  SecondViewController.h
//  GRSqlite
//
//  Created by Student P_05 on 07/11/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRDatabaseManager.h"
@interface SecondViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *taskField;
@property (strong, nonatomic) IBOutlet UIButton *saveoutlet;
- (IBAction)saveAction:(id)sender;

@end

