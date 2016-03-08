//
//  DBManager.m
//  YMApp
//
//  Created by YM on 16/3/8.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "DBManager.h"
#import <FMDB.h>
#import "StudentModel.h"

typedef NS_ENUM(NSInteger, DBVersion) {
    DBVersionV1,
    DBVersionV2,    //历史版本
    DBVersionV3,    //当前版本
};

static NSString *const DBVersionNum  = @"DBVersionNum";
static NSString *const dbPath = @"\tmp\tmp.db";     //数据库地址

static NSString *const createTable = @"create table if not exists  t1("
"id  integer PRIMARY KEY AUTOINCREMENT NOT NULL,"
"name char(50),"
"sex char(4),"
"recordDate  TIMESTAMP default (datetime('now', 'localtime')))";

@interface DBManager ()
{
    FMDatabaseQueue *_queue;
}
@end

@implementation DBManager

+ (instancetype)manager{
    
    static DBManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DBManager alloc] init];
    });
    return manager;
}

- (instancetype)init{
    if (self = [super init]) {
        _queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }
    return self;
}

/*
 *  需要初始化表结构时，调用此方法
 */
- (void)newDBVersionInit{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:DBVersionNum]) {
        //系统之前没有数据库 新建立表。
        [self createTables];
    }else{
        DBVersion ver = [[[NSUserDefaults standardUserDefaults] objectForKey:DBVersionNum] integerValue];
        switch (ver) {
            case DBVersionV1:{
                [self v1ToV2];
            }
            case DBVersionV2:{
                [self v2Tov3];
            }
            case DBVersionV3:{
                
            }
                break;
            default:
                break;
        }
    }
}

/*
 *  创建新表
 */
- (void)createTables{
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        @try {
            [db executeUpdate:createTable];
        }
        @catch (NSException *exception) {
            *rollback = YES;
        }
    }];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:DBVersionV3] forKey:DBVersionNum];
}

/*
 *  版本1 向 版本2 数据迁移
 */
- (void)v1ToV2{
    
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        @try {
            
            //将原始表名T1 修改为 tempT1
            NSString *renameString = @"alter table t1 rename to tempT1";
            [db executeUpdate:renameString];
            
            //创建新表T1（V2版本的新表创建）
            [db executeUpdate:createTable];
            
            //迁移数据
            NSString *toString = @"insert into t1(name,sex)  select name,sex from tempT1";
            [db executeUpdate:toString];
            
            //删除tempT1临时表
            NSString *dropTableStr1 = @"drop table tempT1";
            [db executeUpdate:dropTableStr1];
        }
        @catch (NSException *exception) {
            *rollback = YES;
        }
    }] ;

    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:DBVersionV2] forKey:DBVersionNum];
}

/*
 *  版本2 向 版本3 数据迁移
 */
- (void)v2Tov3{
    
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        @try {
            
            //将原始表名T1 修改为 tempT1
            NSString *renameString = @"alter table t1 rename to tempT1";
            [db executeUpdate:renameString];
            
            //创建新表T1(V3版本的新表创建)
            [db executeUpdate:createTable];
            
            //迁移数据
            NSString *toString = @"insert into t1(name,sex)  select name,sex from tempT1";
            [db executeUpdate:toString];
            
            //删除tempT1临时表
            NSString *dropTableStr1 = @"drop table tempT1";
            [db executeUpdate:dropTableStr1];
        }
        @catch (NSException *exception) {
            *rollback = YES;
        }
    }] ;

    
     [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:DBVersionV3] forKey:DBVersionNum];
}


//- (void)insertData{
//    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
//        @try {
//            [db executeUpdateWithFormat:@"insert into t1(name,sex) values (%@,%@)",[NSString stringWithFormat:@"ym"],@"m" ];
//        }
//        @catch (NSException *exception) {
//            *rollback = YES;
//        }
//    }];
//}
//
//- (void)selectData{
//    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
//        NSString *selectStr = @"select * from t1";
//        FMResultSet *result = [db executeQuery:selectStr];
//        while ([result next]) {
//            PersonModel *person = [[StudentModel alloc] init];
//            person.name = [result stringForColumn:@"name"];
//            person.sex  = [result stringForColumn:@"sex"];
//            person.bir  = [result stringForColumn:@"recordDate"];
//            person.ID = [result intForColumn:@"id"];
//            BLogInfo(@"  person %@",person);
//        }
//    }];
//
//
//}

//- (void)updateTables{;
//    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
//        @try {
//
//            //将原始表名T1 修改为 tempT1
//            NSString *renameString = @"alter table t1 rename to tempT1";
//            [db executeUpdate:renameString];
//
//            //创建新表T1
//            [db executeUpdate:createTable];
//
//            //迁移数据
//            NSString *toString = @"insert into t1(name,sex)  select name,sex from tempT1";
//            [db executeUpdate:toString];
//
//            //删除tempT1临时表
//            NSString *dropTableStr1 = @"drop table tempT1";
//            [db executeUpdate:dropTableStr1];
//        }
//        @catch (NSException *exception) {
//            *rollback = YES;
//        }
//    }] ;
//}



@end
