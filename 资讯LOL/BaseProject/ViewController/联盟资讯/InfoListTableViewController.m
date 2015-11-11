//
//  InfoListTableViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InfoListTableViewController.h"
#import "InforMationCell.h"
#import "InformationViewModel.h"
@interface InfoListTableViewController ()
@property(nonatomic,strong)InformationViewModel *InfoVM;
@end

@implementation InfoListTableViewController
- (InformationViewModel *)InfoVM
{
    if (!_InfoVM) {
        _InfoVM = [[InformationViewModel alloc]initWithType:_infoType.integerValue];
    }return _InfoVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[InforMationCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.InfoVM refreshDataCompletionHandle:^(NSError *error) {
            
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.InfoVM getMoreDataCompletionHandle:^(NSError *error) {
            
            
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];

}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.InfoVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InforMationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.timeLb.text = [self.InfoVM titleForRowInList:indexPath.row];
    cell.descLb.text = [self.InfoVM descForRowInList:indexPath.row];
    [cell.iconView.imageView setImageWithURL:[self.InfoVM iconURLForRowInList:indexPath.row]];
    
    // Configure the cell...
    
    return cell;
}
kRemoveCellSeparator

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
