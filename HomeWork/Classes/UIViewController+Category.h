//
//  UIViewController+Category.h
//  test
//
//  Created by jianting on 15/9/24.
//  Copyright © 2015年 jianting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePickerManager.h"

@interface UIViewController (UINavigationButtonItem)

/**
 设置返回按钮的标题
 **/
- (void)backButtonItemWithTitle:(nullable NSString *)title;

/**
 设置返回按钮的图片
 @param image 所要设置的图片
 @param hidden 是否需要隐藏返回按钮中系统自带的返回箭头
               如果隐藏，则用设置的图片替代返回箭头
               如果不隐藏，则显示为箭头在左图片在右的格式
 **/
- (void)backButtonItemWithImage:(nullable UIImage *)image backButtonHidden:(BOOL)hidden;

/**
 设置返回按钮的图片和标题
 @param image 所要设置的图片，在这个方法中隐藏系统自带箭头，用图片替代
 @param title 所要设置的标题
 **/
- (void)backButtonItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title;

@end

@interface UIViewController (ImagePicker)

/**
 弹出系统UIImagePickerController
 @param mediaType 指访问的是照片还是视频还是两者都有
 @param soureType 指访问系统相册还是调用系统相机拍
 **/
- (void)pickMediaWithMediaType:(ImagePickerMediaType)mediaType
                    sourceType:(ImagePickerSourceType)sourceType
                   finishBlock:(ImagePickerFinishBlock)finishBlock;

@end
