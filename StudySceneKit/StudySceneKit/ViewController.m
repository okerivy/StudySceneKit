//
//  ViewController.m
//  StudySceneKit
//
//  Created by  View on 2022/8/30.
//

#import "ViewController.h"
#import "FSCubeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(@available(ios 15.0,*)){
            UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
            [appearance configureWithOpaqueBackground];
            appearance.backgroundColor = [UIColor orangeColor];
            appearance.shadowColor = [UIColor clearColor];
            self.navigationController.navigationBar.standardAppearance = appearance;
            self.navigationController.navigationBar.scrollEdgeAppearance=self.navigationController.navigationBar.standardAppearance;
        }
        
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (IBAction)cubeBtnClick:(UIButton *)sender {
    
    FSCubeViewController *vc = [FSCubeViewController viewController];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}



@end
