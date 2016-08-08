//
//  FlickrCell.m
//  InterviewTest
//
//  Created by Alessandro Pricci on 11/02/16.
//  Copyright © 2016 Shore GmbH. All rights reserved.
//

#import "FlickrCell.h"

@implementation FlickrCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)prepareForReuse {
    self.imageView.image = nil;
}

@end
