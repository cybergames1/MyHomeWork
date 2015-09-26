//
//  ViewController.m
//  HomeWork
//
//  Created by jianting on 15/9/26.
//  Copyright © 2015年 jianting. All rights reserved.
//

#import "ViewController.h"
#import "ImagePickerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"A";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    B_VCViewController *c = [[B_VCViewController alloc] init];
    //    [self.navigationController pushViewController:c animated:YES];
    
    [ImagePickerManager pickMediaWithMediaType:ImagePickerMediaTypeMovie sourceType:ImagePickerSourceTypeCamera rootViewController:self finishBlock:^(NSString * _Nullable filePath) {
        //
    }];
}

@end
