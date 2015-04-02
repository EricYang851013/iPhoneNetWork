//
//  BaseViewController.m
//  IPhoneNetWork
//
//  Created by yangxu on 15-4-1.
//  Copyright (c) 2015年 yangxu. All rights reserved.
//

#import "BaseViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "UICalculateViewController.h"
#import "OpenUrlViewController.h"
#import "SendEventViewController.h"
#import "NetWorkViewController.h"

@interface BaseViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

{
    UIImagePickerController *_imagePicker;
}
@property (nonatomic)NSArray *tabViewControllers;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(presentImagePicker) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentImagePicker
{
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
    _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    _imagePicker.mediaTypes = @[(NSString *)kUTTypeMovie];
    [self presentViewController:_imagePicker animated:YES completion:NULL];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Setter And Getter Methods
-(NSArray *)tabViewControllers
{
    return [NSArray arrayWithObjects:
            [[UINavigationController alloc] initWithRootViewController:[[UICalculateViewController alloc] init]] ,
            [[UINavigationController alloc] initWithRootViewController:[[UICalculateViewController alloc] init]] , nil];
}

@end
