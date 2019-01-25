//
//  MyHeaderView.m
//  InstaKilo
//
//  Created by Matthew Chan on 2019-01-23.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

#import "MyHeaderView.h"

@implementation MyHeaderView

- (void) addHeaderTitleFrom: (NSString *)subject
{
    self.label.text = subject;
}


@end
