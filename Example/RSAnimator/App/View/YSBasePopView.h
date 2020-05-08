//
//  FMRedPacketResultView.h
//  YiShou
//
//  Created by lyonLiu on 2020/4/11.
//  Copyright © 2020 FuMi. All rights reserved.
//

#import "YSAnimatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSBasePopView : UIView

/// 默认动画弹窗
- (void)showInView:(UIView *)view;
/// 根据Animator做动画  (场景->向上 向下 向左 向右滑动弹出等）
/// @param sourceView 父视图
- (void)showByAnimator:(id<YSAnimatorProtocol>)animator inView:(UIView *)sourceView;
- (void)dismiss;


@end

NS_ASSUME_NONNULL_END
