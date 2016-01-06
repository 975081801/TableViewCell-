//
//  ViewController.m
//  TableViewCell点击高度变化
//
//  Created by 管复生 on 16/1/6.
//  Copyright © 2016年 GFS. All rights reserved.
//  cell点击后高度变化的实现

#import "ViewController.h"

@interface ViewController ()
/**
 *  保存点击的行号
 */
@property(nonatomic,assign)NSInteger selectedRow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//- (NSInteger)selectedRow
//{
//    return _selectedRow ? _selectedRow : -1 ;
//}
#pragma mark- 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]init];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行，点击可以变宽",indexPath.row];
    return cell;
}
#pragma mark- 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRow = indexPath.row +1 ;
    [self.tableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == (self.selectedRow - 1) ? 240 : 40;
}
@end
