//
//  FSCubeViewController.m
//  StudySceneKit
//
//  Created by  View on 2022/8/30.
//

#import "FSCubeViewController.h"

@interface FSCubeViewController ()

@end

@implementation FSCubeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


/// 直接allow生成vc
+ (instancetype)viewController {
    return[[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}



@end
