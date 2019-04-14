
//
//  WXLHomeThreeTableViewCell.m
//  MoreTypeCellDemo
//
//  Created by 小腊 on 2019/4/14.
//  Copyright © 2019 wxl. All rights reserved.
//

#import "WXLHomeThreeTableViewCell.h"
#import "WXLHomeThreeModel.h"

@implementation WXLHomeThreeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setCellConfig:(id<WXLPublicCellConfigProtocol>)cellConfig
{
    WXLHomeThreeModel *model = cellConfig;
    
    self.textLabel.text = model.name;
    self.textLabel.textColor = model.backColor;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
