//
//  WXLHomePublicTableViewCell.h
//  MoreTypeCellDemo
//
//  Created by 小腊 on 2019/4/14.
//  Copyright © 2019 wxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXLPublicCellConfigProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface WXLHomePublicTableViewCell : UITableViewCell
/**
 协议对象
 */
@property (nonatomic, strong) id<WXLPublicCellConfigProtocol>cellConfig;
@end

NS_ASSUME_NONNULL_END
