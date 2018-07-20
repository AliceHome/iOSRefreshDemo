//
//  ProductListVC.m
//  RefreshControl
//
//  Created by Maple on 2018/7/20.
//  Copyright © 2018 Maple. All rights reserved.
//

#import "ProductListVC.h"

@interface ProductListVC ()

@end

@implementation ProductListVC

static void setupRefreshControl(ProductListVC *object) {
    //初始化
    object.refreshControl = [[UIRefreshControl alloc] init];
    //设置菊花颜色
    object.refreshControl.tintColor = [UIColor redColor];
    //设置文字和文字颜色
    NSDictionary *redAttributeDic = @{NSForegroundColorAttributeName:[UIColor redColor]};
    object.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新中 ..."
                                                                            attributes:redAttributeDic];
    //刷新调用方法
    [object.refreshControl addTarget:object
                              action:@selector(refresh)
                    forControlEvents:UIControlEventValueChanged];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    setupRefreshControl(self);
}

/**
 在这个方法中:
 1. 实现网络加载
 2. 网络加载完成后，关闭刷新状态
 */
- (void)refresh {
    
    NSLog(@"refresh ... ...");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshControl endRefreshing];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = @"one";
    return cell;
}


@end
