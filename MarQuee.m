//
//  MarQuee.m
//  MarQuee
//
//  Created by 1860 on 2017/5/8.
//  Copyright © 2017年 HangZhao. All rights reserved.
//

#import "MarQuee.h"

@implementation MarQuee
{
    //记录位置
    CGRect rectMark0;
    CGRect rectMark1;
    //
    NSMutableArray *labelArr;
    //
    NSTimeInterval time;
}

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        title = [NSString stringWithFormat:@"  %@  ",title];
        self.backgroundColor = [UIColor whiteColor];
        time = [self displayDurationForString:title];
        //创建 label
        UILabel *textLab = [[UILabel alloc] initWithFrame:CGRectZero];
        textLab.textColor = [UIColor redColor];
        textLab.font = [UIFont systemFontOfSize:14.0f];
        textLab.text = title;
        //计算lable大小
        CGSize sizeOfText = [textLab sizeThatFits:CGSizeZero];
        
        rectMark0 = CGRectMake(0, 0, sizeOfText.width, self.bounds.size.height);
        
        rectMark1 = CGRectMake(rectMark0.origin.x+rectMark0.size.width, 0, sizeOfText.width, self.bounds.size.height);
        textLab.frame = rectMark0;
        [self addSubview:textLab];
        labelArr = [NSMutableArray arrayWithObject:textLab];
        BOOL isMarQuee = sizeOfText.width > frame.size.width ? YES : NO;
        if (isMarQuee) {
            //创建 label
            UILabel *reserveTextLb = [[UILabel alloc] initWithFrame:CGRectZero];
            reserveTextLb.textColor = [UIColor redColor];
            reserveTextLb.font = [UIFont systemFontOfSize:14.0f];
            reserveTextLb.text = title;
            reserveTextLb.frame = rectMark1;
            [self addSubview:reserveTextLb];
            [labelArr addObject:reserveTextLb];
            [self MarQueeIsShow];
        }
    }
    return self;
}
- (void)MarQueeIsShow{
    UILabel *lable0 = labelArr[0];
    UILabel *label1 = labelArr[1];
    __weak typeof(self) weakSelf = self;
    //匀速
    [UIView transitionWithView:self duration:time options:(UIViewAnimationOptionCurveLinear) animations:^{
        lable0.frame = CGRectMake(-rectMark0.size.width, 0, rectMark0.size.width, rectMark0.size.height);
        label1.frame = CGRectMake(lable0.frame.origin.x+lable0.frame.size.width, 0, label1.frame.size.width, label1.frame.size.height);
    } completion:^(BOOL finished) {
        label1.frame = rectMark0;
        lable0.frame = rectMark1;
        [labelArr replaceObjectAtIndex:0 withObject:label1];
        [labelArr replaceObjectAtIndex:1 withObject:lable0];
        [weakSelf MarQueeIsShow];
    }];
}
- (NSTimeInterval)displayDurationForString:(NSString*)string {
    
    return string.length/5;
    //    return MIN((float)string.length*0.06 + 0.5, 5.0);
}


@end
