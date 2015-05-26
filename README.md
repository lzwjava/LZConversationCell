# LZConversationCell
LZConversationCell 用来展示最近会话列表。形如，

![cell](https://cloud.githubusercontent.com/assets/5022872/7811918/59fdf45c-03e0-11e5-9f1c-1ddcfde61d05.png)

# Install
```
pod 'LZConversationCell'
```

#Usage
```objc
@interface LZConversationCell : UITableViewCell

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, assign) NSInteger unreadCount;
@property (nonatomic, strong) UILabel *timestampLabel;

@end
```

[More](https://github.com/leancloud/leanchat-ios/blob/master/LeanChatLib/LeanChatLib/Classes/controllers/CDChatListVC.m#L168-L190)