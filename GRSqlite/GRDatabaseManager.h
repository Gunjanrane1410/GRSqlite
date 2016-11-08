//
//  GRDatabaseManager.h
//  GRSqlite
//
//  Created by Student P_05 on 07/11/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface GRDatabaseManager : NSObject
{
    sqlite3 *myDatabase;
}
+(instancetype)sharedManager;

-(NSString *)getDatabasePath;

-(int)executeQuery:(NSString *)query;

-(NSMutableArray *)getAllTask;


@end
