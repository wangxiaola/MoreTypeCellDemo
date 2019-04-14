//
//  WXLPublicCellConfigProtocol.h
//  MoreTypeCellDemo
//
//  Created by 小腊 on 2019/4/14.
//  Copyright © 2019 wxl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WXLPublicCellConfigProtocol <NSObject>
@optional

/**
 获取 cell 的复用标识
 
 @return 复用标识
 */
- (nullable NSString *)obtainCellReuseIdentifier;
/**
 获取 cell 的高度
 
 @param indexPath indexPath
 @return 高度
 */
- (CGFloat)obtainHeightWithindexPath:(NSIndexPath *)indexPath;

/**
 cell 点击

 @param indexPath indexPath
 @param other 其它对象
 */
- (void)cellDidSelectRowAtIndexPath:(NSIndexPath *)indexPath other:(_Nullable id)other;
@end

NS_ASSUME_NONNULL_END
