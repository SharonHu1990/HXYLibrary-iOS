//
//  HXYTableViewCell.m
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/9/9.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "HXYTableViewCell.h"

@implementation HXYTableViewCell

+(UINib *)nib{
    return [UINib nibWithNibName:@"HXYTableViewCell" bundle:nil];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
