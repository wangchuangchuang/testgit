//
//  ViewController.m
//  ForkingDogDemo
//
//  Created by wcc on 2017/12/12.
//  Copyright © 2017年 WeX. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "MyCell.h"

static  NSString *cellID = @"cellID";

@interface MyModel : NSObject

@property (nonatomic,copy)NSString *content;
@property (nonatomic,assign)BOOL isSpread;
@end

@implementation MyModel
@end

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@property (nonatomic,strong)NSMutableArray *datasArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datasArray = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        MyModel *model = [[MyModel alloc] init];
        model.content = @"阿斯顿发收到发送\n的发生的发收到发生大发收到发送的发生的ksf93r23是打发是大法师打发斯蒂芬阿打发是大法师打发斯蒂芬苏UI诶入俄日阿什顿发的而批评了萨达发多少发";
        if (i == 0) {
            model.isSpread = YES;
        }
        [_datasArray addObject:model];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:_tableView];
    
     [_tableView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:cellID];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datasArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:self options:nil] lastObject];
    }
    [self configCell:cell indexpath:indexPath];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyModel *model = _datasArray[indexPath.row];
    model.isSpread = !model.isSpread;
    [tableView reloadData];
}

- (void)configCell:(MyCell *)cell indexpath:(NSIndexPath *)index
{
    MyModel *model = _datasArray[index.row];
    if (model.isSpread) {
        cell.title.numberOfLines = 0;
    }
    else
    {
        cell.title.numberOfLines = 1;
    }
    
    cell.title.text = model.content;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:cellID configuration:^(MyCell * cell) {
        [self configCell:cell indexpath:indexPath];
    }];
    
}





@end
