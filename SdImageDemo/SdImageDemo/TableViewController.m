//
//  TableViewController.m
//  SdImageDemo
//
//  Created by hwly on 2021/2/26.
//

#import "TableViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell_ID"];
    self.tableView.rowHeight = 180;

    self.dataSource = [[NSMutableArray alloc] init];

    [self.dataSource addObject:@"http://cdn.community.didiyd.vip/file/resource/6/images/20210220/Hp7XsQiSAbocpYhkg0JAJCS4aiZHhZsH4x14xWNS.jpeg?x-oss-process=image/resize,w_800"];
    [self.dataSource addObject:@"http://cdn.community.didiyd.vip/file/resource/6/images/20210221/QQ2Fdx6ZOFRZqt4hSwgyHWlFNin8IypjjCq3KDjH.jpeg?x-oss-process=image/resize,w_800"];
    [self.dataSource addObject:@"http://cdn.community.didiyd.vip/file/resource/6/images/20210221/Hrts8oByaBJQYQN05GINkYoLH3WR9ZpQd2DOjOPu.jpeg?x-oss-process=image/resize,w_800"];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell_ID" forIndexPath:indexPath];
    if (cell) {
        cell.imageView.hidden = NO;
        cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
        cell.imageView.layer.cornerRadius = 8;
        cell.imageView.layer.masksToBounds = YES;
        cell.imageView.frame = CGRectMake(10, 20, 120, 120);
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.dataSource[indexPath.row]] placeholderImage:[UIImage imageNamed:@"p"]];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
