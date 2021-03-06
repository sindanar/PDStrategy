//
//  PDDataModel.h
//  Commerce
//
//  Created by Pavel Deminov on 29/09/2017.
//  Copyright © 2017 Minimal Cafe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PDValidationRule.h"
#import "PDItemInfo.h"

@class NSManagedObject;

typedef NS_ENUM(NSUInteger, ValidState) {
    ValidStateNone,
    ValidStateTrue,
    ValidStateFalse,
};

@interface PDItemModel : NSObject <PDItemInfo>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSString *apiKey;
@property (nonatomic) BOOL apiRequred;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSURL *iconUrl;
@property (nonatomic, strong) id object;
@property (nonatomic, strong) id modelType;
@property (nonatomic, strong) NSManagedObject *coreDataObject;

@property (nonatomic) ValidState state;
@property (nonatomic, strong) PDValidationRule *errorRule;
@property (nonatomic, strong) NSArray <PDValidationRule *> *rules;

- (void)setup;
- (void)validate;
- (void)invalidate;

@end
