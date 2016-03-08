//
//  AppDelegateHelper.m
//  YMApp
//
//  Created by YM on 16/3/7.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "AppDelegateHelper.h"

@implementation AppDelegateHelper

+ (void)setupAnalyseLib{
    //设置TalkingData
    [TalkingData sessionStarted:TalkingDataKey
                  withChannelId:@"App_Store"];
    [TalkingData setExceptionReportEnabled:NO];
    [TalkingData setSignalReportEnabled:NO];
    
    //设置Bugly
    [[CrashReporter sharedInstance] enableLog:YES];
    [[CrashReporter sharedInstance] installWithAppId:BuglyKey];
    [BuglyLog initLogger:(BLYLogLevelInfo) consolePrint:!PAT];
}


@end
