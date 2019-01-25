//
//  PhotoData.m
//  InstaKilo
//
//  Created by Matthew Chan on 2019-01-23.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

#import "PhotoData.h"

@implementation PhotoData

- (instancetype)initWithImageName:(UIImage *)imageName andSubject:(NSString *)subject andLocation:(NSString *)location
{
    self = [super init];
    if (self) {
        _imageName = imageName;
        _subject = subject;
        _location = location;
    }
    return self;
}

@end
