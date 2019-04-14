//
//  WXLHomeTwoTableViewCell.m
//  MoreTypeCellDemo
//
//  Created by 小腊 on 2019/4/14.
//  Copyright © 2019 wxl. All rights reserved.
//

#import "WXLHomeTwoTableViewCell.h"
#import "WXLHomeTwoModel.h"
@implementation WXLHomeTwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setCellConfig:(id<WXLPublicCellConfigProtocol>)cellConfig
{
    WXLHomeTwoModel *model = cellConfig;
    
    self.textLabel.text = model.name;
    self.textLabel.textColor = model.backColor;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
