//
//  FMRedPacketResultView.m
//  YiShou
//
//  Created by lyonLiu on 2020/4/11.
//  Copyright © 2020 FuMi. All rights reserved.
//

#import "YSBasePopView.h"
#import "YSAnimator.h"

@interface YSBasePopView ()<UIGestureRecognizerDelegate>

/// 动画的主体视图
@property (weak, nonatomic) IBOutlet UIView *contentView;

/// 使用strong预防视图show完animator 就dealloc
@property (nonatomic, strong) id<YSAnimatorProtocol>animator;

@end

@implementation YSBasePopView

- (void)dealloc{
    NSLog(@"%s",__func__);
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

#pragma mark - public

- (void)showInView:(UIView *)view
{
    YSAnimator *animator = [[YSAnimator alloc] init];
    [self showByAnimator:animator inView:view];
}

- (void)showByAnimator:(id<YSAnimatorProtocol>)animator inView:(UIView *)sourceView
{
    self.animator = animator;
    animator.objView = self;
    [animator showInView:sourceView];
}

- (void)dismiss
{
    [self.animator dismiss];
}

#pragma mark - delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return touch.view == self;
}

@end
