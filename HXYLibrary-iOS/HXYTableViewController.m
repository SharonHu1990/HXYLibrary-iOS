//
//  HXYTableViewController.m
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/9/9.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "HXYTableViewController.h"
#import "MJRefresh.h"
#import "UIView+MJExtension.h"
#import "HXYTableViewCell.h"
#import "BaseTableViewProtocol.h"

#define STR1 @"我们我们"
#define STR2 @"我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们"
@interface HXYTableViewController ()
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, retain) BaseTableViewProtocol *baseTableViewProtocol;
@end
static NSString *CellID = @"CellID";
@implementation HXYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

//    self.page = 1;
//
//    self.items = [[NSMutableArray alloc] initWithCapacity:0];
//    for (int i = 0; i < 15; i++) {
//        [_items addObject:@"1"];
//    }
//    
//    
//    __weak __typeof(self) weakself = self;
//    
//    [self.tableView addLegendHeaderWithRefreshingBlock:^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [weakself.tableView.header endRefreshing];
//        });
//    }];
//
//    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.items = [NSMutableArray arrayWithObjects:STR1,STR2, nil];
    self.baseTableViewProtocol = [[BaseTableViewProtocol alloc] initWithItems:self.items cellIdentifier:CellID configureCellBlock:^(HXYTableViewCell *cell, id entity, NSIndexPath *indexPath) {
        [cell.contentLB setText:entity];
    }];

    self.tableView.dataSource = self.baseTableViewProtocol;
    [self.tableView registerNib:[HXYTableViewCell nib] forCellReuseIdentifier:CellID];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.f;
}


-(void)setupTableView
{
    
}

-(void)loadNewDataWithPage:(NSInteger)page
{
//    for (int i = 0; i < 15; i++) {
//        [_items addObject:@"1"];
//    }
//    [self.tableView reloadData];
//    
//    __weak __typeof(self) weakself = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [weakself.tableView.header endRefreshing];
//        if ([weakself.tableView.footer isRefreshing]) {
//            [weakself.tableView.footer endRefreshing];
//        }
//    });
    
}

-(void)loadMoreData
{
    self.page ++;
    [self loadNewDataWithPage:self.page];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return self.items.count;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    // Configure the cell...
////    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
////    [cell.textLabel setText:self.items[indexPath.row]];
////    
////    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
////    return cell;
//    
//    
////    HXYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
////    [cell.contentLB setText:self.items[indexPath.row]];
////    return cell;
//}


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
