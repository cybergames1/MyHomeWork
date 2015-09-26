//
//  ImagePickerManager.m
//  test
//
//  Created by jianting on 15/9/25.
//  Copyright © 2015年 jianting. All rights reserved.
//

#import "ImagePickerManager.h"
#import <MobileCoreServices/UTCoreTypes.h>

static UIImagePickerController * _pickerController = nil;
static ImagePickerFinishBlock _finishBlock = nil;

@interface ImagePickerManager () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ImagePickerManager

+ (ImagePickerManager *)sharedInstance
{
    static ImagePickerManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ImagePickerManager alloc] init];
    });
    return instance;
}

+ (void)pickMediaWithMediaType:(ImagePickerMediaType)mediaType
                    sourceType:(ImagePickerSourceType)sourceType
            rootViewController:(nonnull UIViewController *)rootViewController
                   finishBlock:(ImagePickerFinishBlock)finishBlock
{
    NSArray *mediaTypes = nil;
    if (mediaType == ImagePickerMediaTypeImage) {
        mediaTypes = @[(NSString *)kUTTypeImage];
    }else if (mediaType == ImagePickerMediaTypeMovie) {
        mediaTypes = @[(NSString *)kUTTypeMovie,(NSString *)kUTTypeVideo];
    }else {
        mediaTypes = @[(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie,(NSString *)kUTTypeVideo];
    }
    [[ImagePickerManager sharedInstance] pickMediaWithSourceType:sourceType
                                                      mediaTypes:mediaTypes
                                              rootViewController:rootViewController
                                                     finishBlock:finishBlock];
}

- (BOOL)isImagePickerSourceCameraAvailable
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL)isImagePickerSoureLibraryAvailable
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)setImagePickerSourceType:(ImagePickerSourceType)sourceType
{
    if (sourceType == ImagePickerSourceTypeCamera) {
        if ([self isImagePickerSourceCameraAvailable]) {
            _pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            _pickerController.showsCameraControls = YES;
        }
    }else if (sourceType == ImagePickerSourceTypePhotoLibrary) {
        if ([self isImagePickerSoureLibraryAvailable]) {
            _pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
    }else {
        //
    }
}

- (void)removeImagePickerController
{
    if (_finishBlock) {
        [_finishBlock release];
        _finishBlock = nil;
    }
    
    if (_pickerController) {
        _pickerController.delegate = nil;
        [_pickerController dismissViewControllerAnimated:YES completion:nil];
        [_pickerController release];
        _pickerController = nil;
    }
}

- (void)pickMediaWithSourceType:(ImagePickerSourceType)sourceType
                     mediaTypes:(nonnull NSArray *)mediaTypes
             rootViewController:(nonnull UIViewController *)rootViewController
                    finishBlock:(ImagePickerFinishBlock)finishBlock
{
    if (finishBlock) {
        _finishBlock = [finishBlock copy];
    }
    
    _pickerController = [[UIImagePickerController alloc] init];
    _pickerController.delegate = self;
    _pickerController.allowsEditing = YES;
    _pickerController.mediaTypes = mediaTypes;
    [self setImagePickerSourceType:sourceType];
    
    [rootViewController presentViewController:_pickerController animated:YES completion:nil];
}

#pragma mark -
#pragma mark UIImagePickerController Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self removeImagePickerController];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self removeImagePickerController];
}

@end
