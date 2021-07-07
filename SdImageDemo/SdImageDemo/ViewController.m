//
//  ViewController.m
//  SdImageDemo
//
//  Created by hwly on 2021/2/26.
//

#import "ViewController.h"

@import UIKit;
@import AVFoundation;

#import <Masonry/Masonry.h>
#import <SDWebImage/SDWebImage.h>
#import <AFNetworking/AFNetworking.h>
#import "TableViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSubViews];

//    dispatch_queue_t globQueue = dispatch_queue_create("aa", DISPATCH_QUEUE_SERIAL);
//
//    __block NSInteger a = 0;
//
//    while (a < 5) {
//        dispatch_async(globQueue, ^{
//            a++;
//            NSLog(@"内部：%ld, - %@", a, [NSThread currentThread].name);
//        });
//    }
//
//    NSLog(@"外部打印：%ld", a);
}

- (void)initSubViews
{
    [self.view addSubview:self.contentScrollView];
    [self.contentScrollView addSubview:self.tableView];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(comicTapAction:)];
    [self.view addGestureRecognizer:tapGesture];

    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleComicTapAction:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGesture];

    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
}

- (void)doubleComicTapAction:(UITapGestureRecognizer *)sender
{
    //设置动画效果
    [UIView animateWithDuration:0.3 animations:^{
        //如果缩放为1,设置为2,如果缩放不为1,设置为1
        if (self.contentScrollView.zoomScale < 2) {
            self.contentScrollView.zoomScale = 2;
        } else {
            self.contentScrollView.zoomScale = 1;
        }
    }];
}

- (void)comicTapAction:(UITapGestureRecognizer *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        //如果缩放为1,设置为2,如果缩放不为1,设置为1
        self.contentScrollView.zoomScale = 3;
    }];
}

- (UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 812)];
        _contentScrollView.minimumZoomScale = 1;
        _contentScrollView.maximumZoomScale = 3;

        _contentScrollView.backgroundColor = [UIColor blackColor];
        _contentScrollView.delegate = self;
        _contentScrollView.contentSize = CGSizeMake(375, 0);
        if (@available(iOS 11.0, *)) {
            _contentScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _contentScrollView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 812) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.rowHeight = 90;
        _tableView.allowsSelection = NO;
        _tableView.delegate = self;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView == self.contentScrollView) {
        return self.tableView;
    }
    return nil;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
//	self.imageScale = scrollView.zoomScale;
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10020;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    cell.textLabel.text = @" [tableView dequeueReusableCellWithIdentifier:identifier]";
    return cell;
}

- (void)gotoTbVC:(UIButton *)sender
{
    TableViewController *tbVC = [[TableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    tbVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tbVC animated:YES completion:^{
    }];
}

@end
