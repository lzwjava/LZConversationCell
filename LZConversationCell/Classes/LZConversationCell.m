//
//  LeanChatConversationTableViewCell.m
//  MessageDisplayKitLeanchatExample
//
//  Created by lzw on 15/4/17.
//  Copyright (c) 2015年 lzwjava QQ: 651142978
//

#import "LZConversationCell.h"
#import <JSBadgeView/JSBadgeView.h>

static CGFloat kLZImageSize = 35;
static CGFloat kLZVerticalSpacing = 8;
static CGFloat kLZHorizontalSpacing = 10;
static CGFloat kLZTimestampeLabelWidth = 100;

static CGFloat kLZNameLabelHeightProportion = 3.0 / 5;
static CGFloat kLZNameLabelHeight;
static CGFloat kLZMessageLabelHeight;


@interface LZConversationCell ()

@property (nonatomic, strong) JSBadgeView *badgeView;

@end

@implementation LZConversationCell

+ (LZConversationCell *)dequeueOrCreateCellByTableView :(UITableView *)tableView {
    LZConversationCell *cell = [tableView dequeueReusableCellWithIdentifier:[LZConversationCell identifier]];
    if (cell == nil) {
        cell = [[LZConversationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[[self class] identifier]];
    }
    return cell;
}

+ (void)registerCellToTableView: (UITableView *)tableView {
    [tableView registerClass:[LZConversationCell class] forCellReuseIdentifier:[[self class] identifier]];
}

+ (NSString *)identifier {
    return NSStringFromClass([LZConversationCell class]);
}

+ (CGFloat)heightOfCell {
    return kLZImageSize + kLZVerticalSpacing * 2;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    kLZNameLabelHeight = kLZImageSize * kLZNameLabelHeightProportion;
    kLZMessageLabelHeight = kLZImageSize - kLZNameLabelHeight;
    
    [self addSubview:self.avatarImageView];
    [self addSubview:self.timestampLabel];
    [self addSubview:self.nameLabel];
    [self addSubview:self.messageLabel];
}

- (UIImageView *)avatarImageView {
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kLZHorizontalSpacing, kLZVerticalSpacing, kLZImageSize, kLZImageSize)];
    }
    return _avatarImageView;
}

- (UILabel *)timestampLabel {
    if (_timestampLabel == nil) {
        _timestampLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - kLZHorizontalSpacing - kLZTimestampeLabelWidth, CGRectGetMinY(_avatarImageView.frame), kLZTimestampeLabelWidth, kLZNameLabelHeight)];
        _timestampLabel.font = [UIFont systemFontOfSize:13];
        _timestampLabel.textAlignment = NSTextAlignmentRight;
        _timestampLabel.textColor = [UIColor grayColor];
    }
    return _timestampLabel;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + kLZHorizontalSpacing, CGRectGetMinY(_avatarImageView.frame), CGRectGetMinX(_timestampLabel.frame) - kLZHorizontalSpacing * 3 - kLZImageSize, kLZNameLabelHeight)];
        _nameLabel.font = [UIFont systemFontOfSize:17];
    }
    return _nameLabel;
}

- (UILabel *)messageLabel {
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(_nameLabel.frame), CGRectGetWidth([UIScreen mainScreen].bounds)- 3 * kLZHorizontalSpacing - kLZImageSize, kLZMessageLabelHeight)];
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.textColor = [UIColor grayColor];
    }
    return _messageLabel;
}

- (JSBadgeView *)badgeView {
    if (_badgeView == nil) {
        _badgeView = [[JSBadgeView alloc] initWithParentView:_avatarImageView alignment:JSBadgeViewAlignmentTopRight];
    }
    return _badgeView;
}

- (void)setUnreadCount:(NSInteger)unreadCount {
    if (unreadCount > 0) {
        self.badgeView.badgeText = [NSString stringWithFormat:@"%ld", (long)unreadCount];
    }
    else {
        self.badgeView.badgeText = nil;
    }
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
