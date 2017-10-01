//
//  PDContextCell.h
//  Pods
//
//  Created by Pavel Deminov on 01/10/2017.
//
//

#import <UIKit/UIKit.h>
#import "PDItemModel.h"

@interface PDContextCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *valueLabel;
@property (nonatomic, weak) IBOutlet UILabel *errorLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property (nonatomic, strong) PDItemModel *model;

+ (BOOL)dynamicHeight;
+ (CGFloat)defaultHeight;
- (void)updateUI;

@end