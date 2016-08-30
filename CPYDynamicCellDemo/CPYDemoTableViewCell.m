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
@property (nonatomic, strong) UILabel *tweetLabel;
@property (nonatomic, strong) UILabel *retweetLabel;
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
    [self.contentView addSubview:self.tweetLabel];
    [self.contentView addSubview:self.retweetLabel];
    [self.contentView addSubview:self.retweetButton];
    
    [[[self.nameLabel cpy_topToSuperview:8] cpy_leftToSuperview:8] cpy_rightToSuperview:8];
    [[[self.tweetLabel cpy_topToView:self.nameLabel constant:8] cpy_leftToSuperview:8] cpy_rightToSuperview:8];
    [[[self.retweetLabel cpy_topToView:self.tweetLabel constant:8] cpy_leftToSuperview:8] cpy_rightToSuperview:8];
    [[self.retweetButton cpy_bottomToSuperview:8] cpy_alignXToSuperview];
}

- (void)setUser:(CPYUserModel *)user {
    self.nameLabel.text = user.name;
    self.tweetLabel.text = user.tweet;
    if (user.retweet.length == 0) {
        [self.retweetLabel removeFromSuperview];
        [self.retweetButton cpy_topToView:self.tweetLabel constant:8];
    }
    else {
        self.retweetLabel.text = user.retweet;
        [self.retweetButton cpy_topToView:self.retweetLabel constant:8];
    }
}


- (UILabel *)nameLabel {
	if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
	}
	return _nameLabel;
}
- (UILabel *)tweetLabel {
	if (!_tweetLabel) {
        _tweetLabel = [[UILabel alloc] init];
        _tweetLabel.numberOfLines = 0;
	}
	return _tweetLabel;
}
- (UILabel *)retweetLabel {
	if (!_retweetLabel) {
        _retweetLabel = [[UILabel alloc] init];
        _retweetLabel.numberOfLines = 0;
	}
	return _retweetLabel;
}
- (UIButton *)retweetButton {
	if (!_retweetButton) {
        _retweetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_retweetButton setTitle:@"转推" forState:UIControlStateNormal];
        [_retweetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	}
	return _retweetButton;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
