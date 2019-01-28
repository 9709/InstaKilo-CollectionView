//
//  MyCollectionViewCell.m
//  InstaKilo
//
//  Created by Matthew Chan on 2019-01-23.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)addImageFrom: (PhotoData *)images
{
    self.myImage.image = images.imageName;
}

@end
