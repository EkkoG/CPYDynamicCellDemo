//
//  CPYDemoTableViewCell.m
//  CPYDynamicCellDemo
//
//  Created by ciel on 16/8/30.
//  Copyright © 2016年 CPY. All rights reserved.
//

#import "CPYDemoTableViewCell.h"
#import "UIView+CPYLayout.h"

@interface CPYDemoTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *retweetButton;

@end

@implementation CPYDemoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.retweetButton];
    
    // 用户名
    [[[self.nameLabel cpy_topToSuperview:8] cpy_leftToSuperview:8] cpy_rightToSuperview:8];
    // 标题
    [[[self.titleLabel cpy_topToView:self.nameLabel constant:8] cpy_leftToSuperview:8] cpy_rightToSuperview:8];
    // 内容
    [[[self.contentLabel cpy_topToView:self.titleLabel constant:8] cpy_leftToSuperview:8] cpy_rightToSuperview:8];
    // 按钮
    [[[[self.retweetButton cpy_topToView:self.contentLabel constant:8] cpy_bottomToSuperview:8] cpy_toWidth:80] cpy_alignXToSuperview];
}

- (void)setUser:(CPYUserModel *)user {
    self.nameLabel.text = user.name;
    self.titleLabel.text = user.tweet;
    if (user.retweet.length == 0) {
        [self.contentLabel removeFromSuperview];
        [self.retweetButton cpy_topToView:self.titleLabel constant:8];
    }
    else {
        self.contentLabel.text = user.retweet;
        [self.retweetButton cpy_topToView:self.contentLabel constant:8];
    }
}


- (UILabel *)nameLabel {
	if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
	}
	return _nameLabel;
}
- (UILabel *)titleLabel {
	if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
	}
	return _titleLabel;
}
- (UILabel *)contentLabel {
	if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
	}
	return _contentLabel;
}
- (UIButton *)retweetButton {
	if (!_retweetButton) {
        _retweetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_retweetButton setTitle:@"按钮" forState:UIControlStateNormal];
        [_retweetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _retweetButton.layer.borderWidth = 1.0f;
        _retweetButton.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
	}
	return _retweetButton;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
