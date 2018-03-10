//
//  MainScreenControllerView.m
//  Template-iOS-project
//
//  Created by Jovan Samardziski on 3/10/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import "MainScreenControllerView.h"
#import "Masonry.h"

@implementation MainScreenControllerView

// MARK: Init

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUIViews];
        [self initUIImageViews];
        [self initUILabels];
        [self initUIButtons];
        
        [self addSubviews];
        [self createConstraints];
    }
    
    return self;
}

- (void)initUIViews {
    self.backgroundColor = [Colors templateColor];
}

- (void)initUIImageViews {
    
}

- (void)initUILabels {
    self.labelTitle = [UILabel new];
    [self.labelTitle setFont:[Fonts fontOpenSansRegularWithSize:28]];
    [self.labelTitle setTextColor:[UIColor whiteColor]];
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    self.labelTitle.numberOfLines = 0;
}

- (void)initUIButtons {
    
}

- (void)addSubviews {
    [self addSubview:self.labelTitle];
}

- (void)createConstraints {
    [self.labelTitle makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset([Utilities getWidthFromTheWidth:10]);
        make.right.equalTo(self.right).offset(-[Utilities getWidthFromTheWidth:10]);
        make.centerY.equalTo(self.centerY);
    }];
}

@end
