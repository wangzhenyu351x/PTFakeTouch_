//
//  PTFakeTouch.m
//  PTFakeTouch
//
//  Created by In8 on 2018/3/24.
//  Copyright © 2018年 In8. All rights reserved.
//

#import "PTFakeTouch.h"
#import "UITouch-KIFAdditions.h"
//#import "UIApplication-KIFAdditions.h"
#import "common.h"
#import "UIEvent+KIFAdditions.h"
static NSMutableArray *touchAry;
@implementation PTFakeTouch
+ (void)load{
    KW_ENABLE_CATEGORY(UITouch_KIFAdditions);
    KW_ENABLE_CATEGORY(UIEvent_KIFAdditions);
    touchAry = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i<10; i++) {
        UITouch *touch = [[UITouch alloc] initTouch];
        [touch setPhaseAndUpdateTimestamp:UITouchPhaseEnded];
        [touchAry addObject:touch];
    }
}

+ (NSInteger)fakeTouchId:(NSInteger)pointId AtPoint:(CGPoint)point withTouchPhase:(UITouchPhase)phase{
    //NSLog(@"4. fakeTouchId , phase : %ld ",(long)phase);
    if (pointId==0) {
        //随机一个没有使用的pointId
        pointId = [self getAvailablePointId];
        if (pointId==0) {
            NSLog(@"PTFakeTouch ERROR! pointId all used");
            return 0;
        }
    }
    pointId = pointId - 1;
    UITouch *touch = [touchAry objectAtIndex:pointId];
    if (phase == UITouchPhaseBegan) {
        touch = nil;
        touch = [[UITouch alloc] initAtPoint:point inWindow:[UIApplication sharedApplication].keyWindow];
        
#warning - Keyboard -
        //// Keyboard FIX: Artem Levkovich, ITRex Group: http://itrexgroup.com
        CGRect keyboardFrame;
        // AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        // keyboardFrame = appDelegate.keyboardFrame; (get keyboard frame using UIKeyboardDidShowNotification)
        if([[[UIApplication sharedApplication].windows lastObject] isKindOfClass:NSClassFromString(@"UIRemoteKeyboardWindow")] && (CGRectContainsPoint(CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height-keyboardFrame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, keyboardFrame.size.height), point))) {
            touch = [[UITouch alloc] initAtPoint:point inWindow:[[UIApplication sharedApplication].windows lastObject]];
        }
        
        [touchAry replaceObjectAtIndex:pointId withObject:touch];
        [touch setLocationInWindow:point];
    }else{
        [touch setLocationInWindow:point];
        [touch setPhaseAndUpdateTimestamp:phase];
    }
    
    
    
    UIEvent *event = [self eventWithTouches:touchAry];
    [[UIApplication sharedApplication] sendEvent:event];
    if ((touch.phase==UITouchPhaseBegan)||touch.phase==UITouchPhaseMoved) {
        [touch setPhaseAndUpdateTimestamp:UITouchPhaseStationary];
    }
    return (pointId+1);
}


+ (UIEvent *)eventWithTouches:(NSArray *)touches
{
    // _touchesEvent is a private selector, interface is exposed in UIApplication(KIFAdditionsPrivate)
    UIEvent *event = [[UIApplication sharedApplication] _touchesEvent];
    [event _clearTouches];
    [event kif_setEventWithTouches:touches];
    
    for (UITouch *aTouch in touches) {
        [event _addTouch:aTouch forDelayedDelivery:NO];
    }
    
    return event;
}

+ (NSInteger)getAvailablePointId{
    NSInteger availablePointId=0;
    NSMutableArray *availableIds = [[NSMutableArray alloc]init];
    for (NSInteger i=0; i<touchAry.count; i++) {
        UITouch *touch = [touchAry objectAtIndex:i];
        if (touch.phase==UITouchPhaseEnded) {
//            [availableIds addObject:@(i+1)];
            availablePointId = i+1;
            break;
        }
    }
//    availablePointId = availableIds.count==0 ? 0 : [[availableIds objectAtIndex:(arc4random() % availableIds.count)] integerValue];
    NSLog(@"availableID :%d",availablePointId);
    return availablePointId;
}
@end
