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
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 550;
    
    [self.tableView registerClass:[CPYDemoTableViewCell class] forCellReuseIdentifier:kCPYDemoTableCellReuseIdentifer];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        CPYUserModel *user = [[CPYUserModel alloc] init];
        user.name = [NSString stringWithFormat:@"%d", i];
        user.tweet = @"有个问题，你们如果要做动态高度的TableViewCell，是怎么隐藏其中一个SubView然后让它改变高度的……这个问题折磨我好久了一直没有头绪";
        user.retweet = @"You can find the documentation for pdnsd in the doc/ directory. The html\ndocumentation (which I recommend) is in the doc/html/ subdirectory.\nThe pure text documentation (which is generated automatically from the \nhtml documentation) is in doc/txt/.\nThe following documents are available:";
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
