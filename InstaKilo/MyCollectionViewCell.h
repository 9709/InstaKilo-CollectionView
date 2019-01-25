//
//  MyCollectionViewCell.h
//  InstaKilo
//
//  Created by Matthew Chan on 2019-01-23.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myImage;

- (void)addImageFrom: (PhotoData *)images;

@end

NS_ASSUME_NONNULL_END
