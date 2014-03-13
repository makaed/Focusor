//
//  OMIFieldsModel.h
//  Focusor
//
//  Created by Oleg Makaed on 2/20/2014.
//  Copyright (c) 2014 Oleg Makaed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMIFieldsModel : NSObject
@property (strong, nonatomic) NSMutableDictionary *fieldsList;
-(void)saveDataFromTextField:(UITextField *)textfield;
-(NSMutableDictionary *)loadDataFromFile;
@end
