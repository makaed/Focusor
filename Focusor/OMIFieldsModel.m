//
//  OMIFieldsModel.m
//  Focusor
//
//  Created by Oleg Makaed on 2/20/2014.
//  Copyright (c) 2014 Oleg Makaed. All rights reserved.
//

#import "OMIFieldsModel.h"

/*@interface OMIFieldsModel ()
@property (strong, nonatomic) NSMutableDictionary *fieldsList;
@end*/

@implementation OMIFieldsModel

NSString *docsPath;

-(void)saveDataFromTextField:(UITextField *)textfield
{
    docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    docsPath = [docsPath stringByAppendingPathComponent:@"FocusorData.plist"];
    
    if (!self.fieldsList) {
        self.fieldsList = [[NSMutableDictionary alloc] init];
    }

        //was taken from here to View Controller
        
    //check if we saved data
    BOOL didWriteToFile = [self.fieldsList writeToFile:docsPath atomically:YES];
    if (didWriteToFile)
        NSLog(@"Successly saved data.");
    else
        NSLog(@"Didn't save data.");

    //double check that file exists
    if (![[NSFileManager defaultManager] fileExistsAtPath:docsPath]) {
        NSLog(@"Houston, we have a problem!");
    }

    //show the contents of the file
    //NSLog(@"Content of my saved data: %@", [[NSFileManager defaultManager] contentsAtPath:self.myPath]);
}

-(NSMutableDictionary *)loadDataFromFile
{
    docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    docsPath = [docsPath stringByAppendingPathComponent:@"FocusorData.plist"];

    //load the data
    if ([[NSFileManager defaultManager] fileExistsAtPath:docsPath]) {
        self.fieldsList = [NSMutableDictionary dictionaryWithContentsOfFile:docsPath];
        NSLog(@"We got the data loaded.");
    } else {
        self.fieldsList = [[NSMutableDictionary alloc] init];
        NSLog(@"No saved data was found in documents directory for this app.");
    }
    return self.fieldsList;
}

@end
