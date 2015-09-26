//
//  ImagePickerManager.h
//  test
//
//  Created by jianting on 15/9/25.
//  Copyright © 2015年 jianting. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ImagePickerMediaType) {
    ImagePickerMediaTypeImage, //图片
    ImagePickerMediaTypeMovie, //视频
    ImagePickerMediaTypeAll, //视频+图片
};

typedef NS_ENUM(NSInteger, ImagePickerSourceType) {
    ImagePickerSourceTypePhotoLibrary,
    ImagePickerSourceTypeCamera,
    ImagePickerSourceTypeSavedPhotoAlbum,
};

typedef void (^__nullable ImagePickerFinishBlock)( NSString * _Nullable filePath);

@interface ImagePickerManager : NSObject

+ (void)pickMediaWithMediaType:(ImagePickerMediaType)mediaType
                    sourceType:(ImagePickerSourceType)sourceType
             rootViewController:(nonnull UIViewController *)rootViewController
                    finishBlock:(ImagePickerFinishBlock)finishBlock;

@end
