//
//  BNRColorViewController.h
//  Colorboard
//
//  Created by iStef on 26.01.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BNRColorDescription.h"

//@interface BNRColorViewController : NSObject
@interface BNRColorViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) BOOL existingColor;
@property (nonatomic) BNRColorDescription *colorDescription;



@end
