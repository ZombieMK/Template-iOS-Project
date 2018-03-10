//
//  MainScreenController.m
//  Template-iOS-project
//
//  Created by Jovan Samardziski on 3/10/18.
//  Copyright © 2018 Jovan Samardziski. All rights reserved.
//

#import "MainScreenController.h"
#import "MainScreenControllerView.h"

@interface MainScreenController () {
    MainScreenControllerView *mainView;
}

@end

@implementation MainScreenController

// MARK: Lifecycle

- (void)loadView {
    mainView = [[MainScreenControllerView alloc] initWithFrame:screenBounds];
    self.view = mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Delegates
    
    // Set up text
    
    // Register class
    
    // Inital values
    
    // Button Actions
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// MARK: Custom Functions

- (void)loadData {
    mainView.labelTitle.text = localizedString(@"This is an iOS MVC template project written in Objective-C.");
}

@end
