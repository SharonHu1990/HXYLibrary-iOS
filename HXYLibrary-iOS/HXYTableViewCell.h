//
//  HXYTableViewCell.h
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/9/9.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXYTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLB;

+(UINib *)nib;
@end
