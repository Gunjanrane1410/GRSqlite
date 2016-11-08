//
//  GRDatabaseManager.m
//  GRSqlite
//
//  Created by Student P_05 on 07/11/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import "GRDatabaseManager.h"

@implementation GRDatabaseManager
+(instancetype)sharedManager{
    static GRDatabaseManager *sharedInstance;
    
    if (sharedInstance == nil) {
        sharedInstance = [[GRDatabaseManager alloc]init];
        
        
    }
    return sharedInstance;
}

-(NSString *)getDatabasePath{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/GRSDatabase.sqlite"];
    
}

-(int)executeQuery:(NSString *)query{
    int status=0;
    sqlite3_stmt *statement;
    const char *UTFQuery = [query UTF8String];
    const char *UTFDBPath = [[self getDatabasePath]UTF8String];
    
    if (sqlite3_open(UTFDBPath, &myDatabase)== SQLITE_OK) {
        if (sqlite3_prepare_v2(myDatabase, UTFQuery, -1, &statement, NULL)==SQLITE_OK) {
            if (sqlite3_step(statement)==SQLITE_DONE) {
                status =1;
                
            }
        }
        sqlite3_close(myDatabase);
    }
    return status;
}

-(NSMutableArray *)getAllTask {
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT TASK FROM TASK_TABLE";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDatabase) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDatabase, UTFquery, -1, &statement, nil) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char * taskString = (const char *)sqlite3_column_text(statement, 0);
                
                
                
                NSString *task = [NSString stringWithUTF8String:taskString];
                
                [mArray addObject:task];
                
                
                
            }
            
        }
        
        sqlite3_close(myDatabase);
    }
    
    return mArray;
    
}

@end
