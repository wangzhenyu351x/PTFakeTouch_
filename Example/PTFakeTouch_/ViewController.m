//
//  ZYViewController.m
//  PTFakeTouch_
//
//  Created by wangzhenyu on 08/08/2022.
//  Copyright (c) 2022 wangzhenyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:gesture];


    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinch];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];

    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [self.view addGestureRecognizer:swipe];


}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

//    NSInteger pointId = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(10,200) withTouchPhase:UITouchPhaseBegan];
////    NSInteger pointId2 = [PTFakeTouch fakeTouchId:[PTFakeTouch getAvailablePointId] AtPoint:CGPointMake(300,200) withTouchPhase:UITouchPhaseBegan];
//
//    [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(100,200) withTouchPhase:UITouchPhaseMoved];
//    [PTFakeTouch fakeTouchId:pointId AtPoint:CGPointMake(100,200) withTouchPhase:UITouchPhaseEnded];


//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{



//        [PTFakeTouch fakeTouchId:pointId2 AtPoint:CGPointMake(200,200) withTouchPhase:UITouchPhaseMoved];


//        [PTFakeTouch fakeTouchId:pointId2 AtPoint:CGPointMake(200,200) withTouchPhase:UITouchPhaseEnded];

//    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButtonClicked:(id)sender {

}

- (IBAction)longPressButtonClicked:(id)sender {

}

- (void)tap:(UITapGestureRecognizer *)tap {

}

- (void)swipe:(UISwipeGestureRecognizer *)swipe {
    NSLog(@"%@",swipe);
}

- (void)pan:(UIPanGestureRecognizer *)panGes {
    NSLog(@"%@ %d",panGes, panGes.state);
}

- (void)pinch:(UIPinchGestureRecognizer *)pinchGes {
    NSLog(@"%@ %.2f",pinchGes,pinchGes.scale);
}


@end
