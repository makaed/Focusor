//
//  OMIFocusorScreenViewController.m
//  Focusor
//
//  Created by Oleg Makaed on 2/18/2014.
//  Copyright (c) 2014 Oleg Makaed. All rights reserved.
//

#import "OMIFocusorScreenViewController.h"
#import "OMIFieldsModel.h"

@interface OMIFocusorScreenViewController ()
@property (weak, nonatomic) IBOutlet UITextField *focusTextField;
@property (weak, nonatomic) IBOutlet UITextField *goalTextField;
@property (weak, nonatomic) IBOutlet UITextField *learnTextField;
@property (weak, nonatomic) IBOutlet UITextField *habitTextField;
@end

@implementation OMIFocusorScreenViewController

//keys for retrieving data form the .plist file
NSString *focus = @"focus";
NSString *goal = @"goal";
NSString *learn = @"learn";
NSString *habit = @"habit";

id isText = 0;

//idetifiers for the text fields
enum {
    focustag = 0,
    goaltag,
    learntag,
    habittag
};

OMIFieldsModel *myModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.focusTextField.delegate = self;
    self.goalTextField.delegate = self;
    self.learnTextField.delegate = self;
    self.habitTextField.delegate = self;
    myModel = [[OMIFieldsModel alloc] init];
    [myModel loadDataFromFile];
    [self populateTheFields];
}

-(void)populateTheFields
{
    if (myModel.fieldsList) {
        self.focusTextField.text = [myModel.fieldsList objectForKey:focus];
        self.goalTextField.text = [myModel.fieldsList objectForKey:goal];
        self.learnTextField.text = [myModel.fieldsList objectForKey:learn];
        self.habitTextField.text = [myModel.fieldsList objectForKey:habit];
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField setReturnKeyType:UIReturnKeyDone];
    textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //code
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""]) {
        isText = textField.text; //[NSNull null];
    } else {
        isText = textField.text;
    }
    
    switch (textField.tag) {
        case focustag:
            [myModel.fieldsList setObject:isText forKey:focus];
            break;
        case goaltag:
            [myModel.fieldsList setObject:isText forKey:goal];
            break;
        case learntag:
            [myModel.fieldsList setObject:isText forKey:learn];
            break;
        case habittag:
            [myModel.fieldsList setObject:isText forKey:habit];
            break;
    }
    
    [myModel saveDataFromTextField:textField];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
