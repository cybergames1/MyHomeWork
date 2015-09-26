//
//  UIViewController+Category.m
//  test
//
//  Created by jianting on 15/9/24.
//  Copyright © 2015年 jianting. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (UINavigationButtonItem)

- (void)backButtonItemWithTitle:(nullable NSString *)title {
    [self backButtonItemWithImage:nil title:title];
}

- (void)backButtonItemWithImage:(nullable UIImage *)image backButtonHidden:(BOOL)hidden {
    [self backButtonItemWithImage:image title:nil backButtonHidden:hidden];
}

- (void)backButtonItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title {
    [self backButtonItemWithImage:image title:title backButtonHidden:YES];
}

- (void)backButtonItemWithImage:(nullable UIImage *)image
                          title:(nullable NSString *)title
               backButtonHidden:(BOOL)hidden
{
    /* 因为backBarButtonItem的设置是上一个viewController设置在字viewController上显示的
     * 因此要先获取上一个viewController
     */
    NSArray *controllers = [self.navigationController viewControllers];
    UIViewController *_last_controller = controllers[[controllers count]-2];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    if (image) {
        if (hidden) {
            [backItem setBackButtonBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, image.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        }else {
            [backItem setImage:image];
        }
    }
    
    if (title) {
        [backItem setTitle:title];
    }else {
        [backItem setBackButtonTitlePositionAdjustment:UIOffsetMake(-400.f, 0) forBarMetrics:UIBarMetricsDefault];
    }
    
    _last_controller.navigationItem.backBarButtonItem = backItem;
}


@end


@implementation UIViewController (ImagePicker)

- (void)pickMediaWithMediaType:(ImagePickerMediaType)mediaType
                    sourceType:(ImagePickerSourceType)sourceType
                   finishBlock:(ImagePickerFinishBlock)finishBlock
{
    [ImagePickerManager pickMediaWithMediaType:mediaType
                                    sourceType:sourceType
                            rootViewController:self
                                   finishBlock:finishBlock];
}

@end
