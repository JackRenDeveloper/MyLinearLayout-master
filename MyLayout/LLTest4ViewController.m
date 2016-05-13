//
//  Test4ViewController.m
//  MyLayout
//
//  Created by oybq on 15/6/21.
//  Copyright (c) 2015年 YoungSoft. All rights reserved.
//

#import "LLTest4ViewController.h"
#import "MyLayout.h"

@interface LLTest4ViewController ()

@property(nonatomic,strong) MyLinearLayout *rootLayout;

@end

@implementation LLTest4ViewController


-(UIButton*)addActionButton:(NSString *)title tag:(NSInteger)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;

    button.myHeight = 50;
    button.myWidth = 90;
    
    return button;
}

-(MyLinearLayout*)addActionLayout
{
    
 
    MyLinearLayout *actionLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Horz];
    actionLayout.backgroundColor = [UIColor redColor];
    
    actionLayout.wrapContentHeight = YES;
    actionLayout.wrapContentWidth = YES;  //布局的高度和宽度由子视图决定
    actionLayout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    actionLayout.subviewMargin = 5;

    //四周的边线
    MyBorderLineDraw *bl = [[MyBorderLineDraw alloc] initWithColor:[UIColor greenColor]];
    bl.headIndent = 10;
    bl.tailIndent = 30;
    bl.thick = 1;
    actionLayout.bottomBorderLine = bl;
    actionLayout.topBorderLine = bl;
    actionLayout.leftBorderLine = bl;
    actionLayout.rightBorderLine = bl;
    
    
    
    MyLinearLayout *addLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    addLayout.backgroundColor = [UIColor blueColor];
    
    addLayout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    addLayout.subviewMargin = 5;
    addLayout.wrapContentWidth = YES;
    addLayout.wrapContentHeight = YES;  //布局的高度和宽度由子视图决定
    [actionLayout addSubview:addLayout];
    
    
    
    [addLayout addSubview:[self addActionButton:@"添加垂直布局" tag:100]];
    [addLayout addSubview:[self addActionButton:@"添加垂直按钮" tag:500]];

    
    [actionLayout addSubview:[self addActionButton:@"添加水平按钮" tag:200]];
    [actionLayout addSubview:[self addActionButton:@"删除自身布局" tag:300]];
    
    return actionLayout;
}


-(void)loadView
{
    UIScrollView *scrollView = [UIScrollView new];
    self.view = scrollView;
    
    self.rootLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    self.rootLayout.backgroundColor = [UIColor grayColor];
    self.rootLayout.wrapContentHeight = YES;
    self.rootLayout.wrapContentWidth = YES;  //布局的高度和宽度由子视图决定
    self.rootLayout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    self.rootLayout.subviewMargin = 5;
    [self.view addSubview:self.rootLayout];
    
    [self.rootLayout addSubview:[self addActionLayout]];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"线性布局-布局尺寸由子视图决定";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleAction:(UIButton*)sender
{
    
    if (sender.tag == 100)
    {
        [self.rootLayout addSubview:[self addActionLayout]];
    }
    else if (sender.tag == 200)
    {
        MyLinearLayout*actionLayout = (MyLinearLayout*)sender.superview;
        [actionLayout addSubview:[self addActionButton:@"删除自己" tag:400]];
    }
    else if (sender.tag == 300)
    {
         MyLinearLayout*actionLayout = (MyLinearLayout*)sender.superview;
        [actionLayout removeFromSuperview];
    }
    else if (sender.tag == 400)
    {
        [sender removeFromSuperview];
    }
    else if (sender.tag == 500)
    {
        MyLinearLayout*addLayout = (MyLinearLayout*)sender.superview;
        [addLayout addSubview:[self addActionButton:@"删除自己" tag:400]];

    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
