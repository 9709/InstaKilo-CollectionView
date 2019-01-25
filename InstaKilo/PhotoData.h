//
//  PhotoData.h
//  InstaKilo
//
//  Created by Matthew Chan on 2019-01-23.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoData : NSObject

@property (nonatomic, strong) UIImage *imageName;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *location;

- (instancetype)initWithImageName:(UIImage *)imageName andSubject:(NSString *)subject andLocation:(NSString *)location;


@end

NS_ASSUME_NONNULL_END
