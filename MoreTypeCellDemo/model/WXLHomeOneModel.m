//
//  WXLHomeOneModel.m
//  MoreTypeCellDemo
//
//  Created by 小腊 on 2019/4/14.
//  Copyright © 2019 wxl. All rights reserved.
//

#import "WXLHomeOneModel.h"

@implementation WXLHomeOneModel
/**
 获取 cell 的复用标识
 
 @return 复用标识
 */
- (nullable NSString *)obtainCellReuseIdentifier{
    return @"WXLHomeOneTableViewCellID";
}
/**
 获取 cell 的高度
 
 @param indexPath indexPath
 @return 高度
 */
- (CGFloat)obtainHeightWithindexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

/**
 cell 点击
 
 @param indexPath indexPath
 @param other 其它对象
 */
- (void)cellDidSelectRowAtIndexPath:(NSIndexPath *)indexPath other:(id)other{
    
    NSLog(@"%@ 点击 %ld",NSStringFromClass([self class]),indexPath.row);
}
@end
