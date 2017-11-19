//
//  PDItemInfo.h
//  PDStrategy
//
//  Created by Pavel Deminov on 19/11/2017.
//  Copyright © 2017 Pavel Deminov. All rights reserved.
//

@import UIKit;

@protocol PDItemInfo <NSObject>

@property (nullable, nonatomic, readwrite) NSString *title;
@property (nullable, nonatomic, readwrite) NSString *itemHash;
@property (nullable, nonatomic, readwrite) id value;
@property (nullable, nonatomic, readwrite) NSDate *date;
@property (nullable, nonatomic, readwrite) NSString *apiKey;
@property (nullable, nonatomic, readwrite) NSString *placeholder;
@property (nullable, nonatomic, readwrite) id type;
@property (nullable, nonatomic, readwrite) UIImage *image;
@property (nullable, nonatomic, readwrite) NSURL *imageUrl;

@end