//
//  ViewController.m
//  CPYDynamicCellDemo
//
//  Created by ciel on 16/8/30.
//  Copyright © 2016年 CPY. All rights reserved.
//

#import "ViewController.h"
#import "CPYDemoTableViewCell.h"

static NSString *const kCPYDemoTableCellReuseIdentifer = @"com.cielpy.cpydymanicdemo.demtableviewcell";

@interface ViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.estimatedRowHeight = 550;
    
    [self.tableView registerClass:[CPYDemoTableViewCell class] forCellReuseIdentifier:kCPYDemoTableCellReuseIdentifer];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 200; i++) {
        CPYUserModel *user = [[CPYUserModel alloc] init];
        user.name = [NSString stringWithFormat:@"用户%d", i];
        user.tweet = @"这里是标题区域";
        NSString *str = @"GitHub是一个通过Git进行版本控制的软件源代码托管服务，由GitHub公司（曾称Logical Awesome）的开发者Chris Wanstrath、PJ Hyett和Tom Preston-Werner使用Ruby on Rails编写而成。GitHub同时提供付费账户和免费账户。";
        user.retweet = [str substringToIndex:arc4random() % str.length];
        if (i == 1) {
            user.retweet = @"";
        }
        [arr addObject:user];
    }
    self.data = [arr copy];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CPYDemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCPYDemoTableCellReuseIdentifer forIndexPath:indexPath];
    cell.user = self.data[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
