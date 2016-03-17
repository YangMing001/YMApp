//
//  SoundHelper.m
//  YMApp
//
//  Created by YM on 16/3/15.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "SoundHelper.h"
#import <AVFoundation/AVFoundation.h>

@interface SoundHelper ()<AVAudioPlayerDelegate>
{
    AVAudioPlayer *_palyer;
}
@end

@implementation SoundHelper

+ (NSString *)FireworkPatk{
    return [[NSBundle mainBundle] pathForResource:@"Firework.mp3" ofType:nil];
}

- (instancetype)initWithSoundPath:(NSString *)path{
    if (self = [super init]) {
        self.soundPath = path;
    }
    return self;
}


- (void)setSoundPath:(NSString *)soundPath{
    _soundPath = soundPath;

    _palyer = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfFile:_soundPath] error:nil];
    _palyer.numberOfLoops = -1;
    _palyer.delegate = self;
}

- (void)play{
    if (_palyer.isPlaying) {
        return;
    }
    
    [_palyer prepareToPlay];
    _palyer.currentTime = 0.0;
    [_palyer play];
}

- (void)stop{
    if (_palyer.isPlaying) {
        [_palyer stop];
    }
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    
}


@end
