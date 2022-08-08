//
//  PTFakeTouch_Tests.m
//  PTFakeTouch_Tests
//
//  Created by wangzhenyu on 08/08/2022.
//  Copyright (c) 2022 wangzhenyu. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

#import "ViewController.h"
#import <PTFakeTouch_/PTFakeTouch.h>
SPEC_BEGIN(InitialTests)

describe(@"ViewController", ^{

    it(@"pan", ^{
        ViewController *vc = (ViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        [[vc shouldEventuallyBeforeTimingOutAfter(2)] receive:@selector(pan:) withCountAtLeast:1];
        NSInteger pointId = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(10,200) withTouchPhase:UITouchPhaseBegan];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(100,200) withTouchPhase:UITouchPhaseMoved];
            [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(100,200) withTouchPhase:UITouchPhaseEnded];
        });

//        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10, false);
    });

    it(@"pinch", ^{
        ViewController *vc = (ViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        [[vc shouldEventuallyBeforeTimingOutAfter(2)] receive:@selector(pinch:) withCountAtLeast:1];
        NSInteger pointId = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(10,200) withTouchPhase:UITouchPhaseBegan];

        NSInteger pointId2 = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(300,200) withTouchPhase:UITouchPhaseBegan];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(100,200) withTouchPhase:UITouchPhaseMoved];
            [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(100,200) withTouchPhase:UITouchPhaseEnded];

            [PTFakeTouch fakeTouchId:pointId2 AtPoint:CGPointMake(200,200) withTouchPhase:UITouchPhaseMoved];
            [PTFakeTouch fakeTouchId:pointId2 AtPoint:CGPointMake(200,200) withTouchPhase:UITouchPhaseEnded];
        });

//        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10, false);
    });

    it(@"swipe", ^{
        ViewController *vc = (ViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        [[vc should] receive:@selector(swipe:) withCountAtLeast:1];
        NSInteger pointId = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(10,200) withTouchPhase:UITouchPhaseBegan];

        [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(100,200) withTouchPhase:UITouchPhaseMoved];
        [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(100,200) withTouchPhase:UITouchPhaseEnded];
//        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10, false);
    });

    it(@"tap", ^{
        ViewController *vc = (ViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        [[vc should] receive:@selector(tap:) withCountAtLeast:1];
        NSInteger pointId = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(10,200) withTouchPhase:UITouchPhaseBegan];

//        [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(100,200) withTouchPhase:UITouchPhaseMoved];
        [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(10,200) withTouchPhase:UITouchPhaseEnded];
//        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10, false);
    });

});

SPEC_END

