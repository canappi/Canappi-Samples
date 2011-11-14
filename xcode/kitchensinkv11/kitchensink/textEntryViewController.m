/****************************************************************************************************

 Disclaimer: IMPORTANT:  This artifact is supplied to you by Convergence Modeling LLC.
 in consideration of your agreement to the following terms, and your use, installation, 
 modification or redistribution of this acceptance constitutes acceptance of these terms.  
 If you do not agree with these terms, please do not use, install, modify or redistribute 
 this Convergence Modeling LLC artifact.
 
 In consideration of your agreement to abide by the following terms, and subject
 to these terms, Convergence Modeling LLC grants you a personal, non-exclusive license, 
 to use, reproduce, modify and redistribute this artifact, with or without
 modifications, in source and/or binary forms. 
 
 Except as expressly stated in this notice, no other rights or licenses, express or implied, 
 are granted by Convergence Modeling LLC herein, including but not limited to any patent rights 
 that may be infringed by your derivative works or by other works in which the Convergence Modeling 
 artifact may be incorporated.
 
 This artifact is provided by Convergence Modeling LLC on an "AS IS" basis. CONVERGENCE MODELING LLC 
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF 
 NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE CONVERGENCE 
 MODELING LLC artifact OR ITS USE AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL CONVERGENCE MODELING LLC BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL 
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
 OR PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR
 DISTRIBUTION OF CONVERGENCE MODELING LLC artifact, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT 
 (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF CONVERGENCE MODELING LLC HAS BEEN ADVISED OF 
 THE POSSIBILITY OF SUCH DAMAGE.

 
****************************************************************************************************/


#import <UIKit/UIKit.h>
#import "textEntryViewController.h"
 
 
#import "JSON.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"




#import <SystemConfiguration/SystemConfiguration.h>
#import "GradientButton.h"

 




#import "mapMenuViewController.h"
#import "webStringViewController.h"
#import "webURLViewController.h"
#import "standardButtonViewController.h"
#import "fontViewController.h"
#import "labelViewController.h"
#import "sliderViewController.h"
#import "playerViewController.h"
#import "ImagesViewController.h"
#import "textEntryLayoutMDSLViewController.h"
#import "textEntryViewController.h"
#import "gradientButtonViewController.h"
#import "standardButtonView2Controller.h"
#import "pickersViewController.h"
#import "detailViewController.h"
#import "contactViewController.h"
#import "buttonViewController.h"
#import "parisViewController.h"
#import "westSamoaViewController.h"
#import "belleViewController.h"
#import "webMenuController.h"
#import "homeViewController.h"
#import "aboutViewController.h"
#import "gradientButtonsMDSLController.h"
#import "standardButtonsMDSLController.h"
#import "fontsMDSLController.h"
#import "labelsMDSLController.h"
#import "imagesMDSLController.h"
#import "standardMapMDSLController.h"
#import "hybridMapMDSLController.h"
#import "satelliteMapMDSLController.h"
#import "playerMDSLController.h"
#import "pickersMDSLController.h"
#import "slidersMDSLController.h"
#import "browserStringMDSLController.h"
#import "actionsMDSLController.h"
#import "browserURLMDSLController.h"
#import "actionViewController.h"
#import "youTubeViewController.h"



@implementation textEntryViewController 

	@synthesize parentController ;
    @synthesize textEntryViewIds ;
    @synthesize textEntryViewValues ;

	 


	 
	// Layout : textEntryLayout	 
	@synthesize decimaltxtTextField ;
	@synthesize decimaltxtTextFieldId ;
 
	@synthesize emailtxtTextField ;
	@synthesize emailtxtTextFieldId ;
 
	@synthesize numbertxtTextField ;
	@synthesize numbertxtTextFieldId ;
 
	@synthesize phonetxtTextField ;
	@synthesize phonetxtTextFieldId ;
 
	@synthesize txttxtTextField ;
	@synthesize txttxtTextFieldId ;
 
	@synthesize urltxtTextField ;
	@synthesize urltxtTextFieldId ;
 
	@synthesize decimalLabel ; 
 
	@synthesize emailLabel ; 
 
	@synthesize numberLabel ; 
 
	@synthesize phoneLabel ; 
 
	@synthesize txtLabel ; 
 
	@synthesize urlLabel ; 
 
	@synthesize infoButton ;





-(NSMutableDictionary *) identities {
	return textEntryViewIds ;
}

-(NSMutableDictionary *) values {
	return textEntryViewValues ;
}

- (NSString *)getDocumentDirectory {
	NSArray *arrayPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

 	return [arrayPaths objectAtIndex:0];
}

- (void)willShowViewController:(BOOL)animtated {
	
	
}

- (void)didShowViewController:(BOOL)animtated {
}


+ (NSString*) stringWithUUID {
    CFUUIDRef uuidObj = CFUUIDCreate(nil);//create a new UUID
    //get the string representation of the UUID
    NSString *uuidString = (NSString*)CFUUIDCreateString(nil, uuidObj) ;
    CFRelease(uuidObj);
    return [uuidString autorelease] ;
}



-(void)saveValues
{
	NSString *value = @"" ;
			 
    value = decimaltxtTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"decimaltxt"];	 
 
    value = emailtxtTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"emailtxt"];	 
 
    value = numbertxtTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"numbertxt"];	 
 
    value = phonetxtTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"phonetxt"];	 
 
    value = txttxtTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"txttxt"];	 
 
    value = urltxtTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"urltxt"];	 
 
 
 
 
 
 
 
    value = [infoButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"info"];	 

}







-(NSString*)retrieveFromUserDefaultsFor:(NSString*)key
{
	if (key != nil) return [[[NSUserDefaults standardUserDefaults] objectForKey:key] retain];
	return @"";
}

-(NSString *) textValueForControl:(NSString *)name {
	return [textEntryViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [textEntryViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[textEntryViewIds setObject:identity forKey:name] ;
}





- (void)didSelectViewController {

	// Register the observer for the keyboardWillShow event
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];


		

	
	
	
}

- (void)keyboardWillShow:(NSNotification *)note {  
    // create custom done button that will clear the keyboard
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                            style:UIBarButtonSystemItemDone 
                                                            target:self 
                                                            action:@selector(doneButton:)];
    for (UIView *subView in self.view.subviews) {
        if ([subView isFirstResponder]) {
            UITextField *t = (UITextField *)subView;
            if (t.keyboardType == UIKeyboardTypeNamePhonePad)  self.navigationItem.rightBarButtonItem = doneButton;
            if (t.keyboardType == UIKeyboardTypeNumberPad)  self.navigationItem.rightBarButtonItem = doneButton;
            if (t.keyboardType == UIKeyboardTypeDecimalPad)  self.navigationItem.rightBarButtonItem = doneButton;
            if (t.keyboardType == UIKeyboardTypeNumbersAndPunctuation)  self.navigationItem.rightBarButtonItem = doneButton;
            if (t.keyboardType == UIKeyboardTypePhonePad)  self.navigationItem.rightBarButtonItem = doneButton;
        }
            
    }
    
    [doneButton release];
}

- (void)keyboardWillHide:(NSNotification *)note { 
	//
}

-(void)doneButton:(id) sender {
    self.navigationItem.rightBarButtonItem = nil ; 
		
    [decimaltxtTextField resignFirstResponder];
	
    [emailtxtTextField resignFirstResponder];
	
    [numbertxtTextField resignFirstResponder];
	
    [phonetxtTextField resignFirstResponder];
	
    [txttxtTextField resignFirstResponder];
	
    [urltxtTextField resignFirstResponder];
	
	
	
	
	
	
	
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	self.textEntryViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.textEntryViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	
	
	UIScrollView* containerView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame]; 
	containerView.backgroundColor = [UIColor blackColor]; 
	containerView.scrollEnabled = YES; 
	containerView.pagingEnabled = YES; 
	containerView.directionalLockEnabled = YES;
	containerView.clipsToBounds = YES;
	[containerView setCanCancelContentTouches:NO];
	if (isPad()) {
    } else {	
		[containerView setContentSize:CGSizeMake(320,600)]; 
	}
	[containerView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
	containerView.bounces = YES;
	
	self.view = containerView;
	[containerView release] ;
	
	
	[self.view setBackgroundColor:	
	[UIColor groupTableViewBackgroundColor]
];

	
	
	decimaltxtTextField = [[UITextField alloc] init];	
	decimaltxtTextField.delegate = self;
	decimaltxtTextField.textAlignment = UITextAlignmentLeft;
	decimaltxtTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[decimaltxtTextField setFrame:CGRectMake(100, 50, 160, 30)];
	[decimaltxtTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	decimaltxtTextField.textColor = [UIColor redColor];
	decimaltxtTextField.backgroundColor = [UIColor whiteColor];
	decimaltxtTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	decimaltxtTextField.keyboardType =  UIKeyboardTypeDecimalPad;
	//decimaltxtTextField.tag = 0;
	decimaltxtTextField.clearButtonMode = false;	
	[decimaltxtTextField setBorderStyle:UITextBorderStyleBezel] ;
	

	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(decimaltxtTextField)]) { 
			UITextField * tzip = [parentController decimaltxtTextField] ;
			decimaltxtTextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"decimaltxt"] ;	
		decimaltxtTextField.text = value ;
		decimaltxtTextFieldId = [self retrieveFromUserDefaultsFor:@"decimaltxtId"] ; ;
		
	}
	[self.view addSubview:decimaltxtTextField];
	

	
	emailtxtTextField = [[UITextField alloc] init];	
	emailtxtTextField.delegate = self;
	emailtxtTextField.textAlignment = UITextAlignmentLeft;
	emailtxtTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[emailtxtTextField setFrame:CGRectMake(100, 100, 160, 30)];
	[emailtxtTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	emailtxtTextField.textColor = [UIColor blueColor];
	emailtxtTextField.backgroundColor = [UIColor whiteColor];
	emailtxtTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	emailtxtTextField.keyboardType =  UIKeyboardTypeEmailAddress;
	//emailtxtTextField.tag = 0;
	emailtxtTextField.clearButtonMode = false;	
	[emailtxtTextField setBorderStyle:UITextBorderStyleLine] ;
	

	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(emailtxtTextField)]) { 
			UITextField * tzip = [parentController emailtxtTextField] ;
			emailtxtTextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"emailtxt"] ;	
		emailtxtTextField.text = value ;
		emailtxtTextFieldId = [self retrieveFromUserDefaultsFor:@"emailtxtId"] ; ;
		
	}
	[self.view addSubview:emailtxtTextField];
	

	
	numbertxtTextField = [[UITextField alloc] init];	
	numbertxtTextField.delegate = self;
	numbertxtTextField.textAlignment = UITextAlignmentLeft;
	numbertxtTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[numbertxtTextField setFrame:CGRectMake(100, 150, 160, 30)];
	[numbertxtTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	numbertxtTextField.textColor = [UIColor magentaColor];
	numbertxtTextField.backgroundColor = [UIColor magentaColor];
	numbertxtTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	numbertxtTextField.keyboardType =  UIKeyboardTypeNumberPad;
	//numbertxtTextField.tag = 0;
	numbertxtTextField.clearButtonMode = false;	
	[numbertxtTextField setBorderStyle:UITextBorderStyleRoundedRect] ;
	

	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(numbertxtTextField)]) { 
			UITextField * tzip = [parentController numbertxtTextField] ;
			numbertxtTextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"numbertxt"] ;	
		numbertxtTextField.text = value ;
		numbertxtTextFieldId = [self retrieveFromUserDefaultsFor:@"numbertxtId"] ; ;
		
	}
	[self.view addSubview:numbertxtTextField];
	

	
	phonetxtTextField = [[UITextField alloc] init];	
	phonetxtTextField.delegate = self;
	phonetxtTextField.textAlignment = UITextAlignmentLeft;
	phonetxtTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[phonetxtTextField setFrame:CGRectMake(100, 200, 160, 30)];
	[phonetxtTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	phonetxtTextField.textColor = [UIColor blackColor];
	phonetxtTextField.backgroundColor = [UIColor whiteColor];
	phonetxtTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	phonetxtTextField.keyboardType =  UIKeyboardTypePhonePad;
	//phonetxtTextField.tag = 0;
	phonetxtTextField.clearButtonMode = false;	
	[phonetxtTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(phonetxtTextField)]) { 
			UITextField * tzip = [parentController phonetxtTextField] ;
			phonetxtTextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"phonetxt"] ;	
		phonetxtTextField.text = value ;
		phonetxtTextFieldId = [self retrieveFromUserDefaultsFor:@"phonetxtId"] ; ;
		
	}
	[self.view addSubview:phonetxtTextField];
	

	
	txttxtTextField = [[UITextField alloc] init];	
	txttxtTextField.delegate = self;
	txttxtTextField.textAlignment = UITextAlignmentLeft;
	txttxtTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[txttxtTextField setFrame:CGRectMake(100, 250, 160, 30)];
	[txttxtTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	txttxtTextField.textColor = [UIColor blackColor];
	txttxtTextField.backgroundColor = [UIColor whiteColor];
	txttxtTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	txttxtTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//txttxtTextField.tag = 0;
	txttxtTextField.clearButtonMode = false;	
	[txttxtTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(txttxtTextField)]) { 
			UITextField * tzip = [parentController txttxtTextField] ;
			txttxtTextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"txttxt"] ;	
		txttxtTextField.text = value ;
		txttxtTextFieldId = [self retrieveFromUserDefaultsFor:@"txttxtId"] ; ;
		
	}
	[self.view addSubview:txttxtTextField];
	

	
	urltxtTextField = [[UITextField alloc] init];	
	urltxtTextField.delegate = self;
	urltxtTextField.textAlignment = UITextAlignmentLeft;
	urltxtTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[urltxtTextField setFrame:CGRectMake(100, 300, 160, 30)];
	[urltxtTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	urltxtTextField.textColor = [UIColor blackColor];
	urltxtTextField.backgroundColor = [UIColor whiteColor];
	urltxtTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	urltxtTextField.keyboardType =  UIKeyboardTypeURL;
	//urltxtTextField.tag = 0;
	urltxtTextField.clearButtonMode = false;	
	[urltxtTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(urltxtTextField)]) { 
			UITextField * tzip = [parentController urltxtTextField] ;
			urltxtTextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"urltxt"] ;	
		urltxtTextField.text = value ;
		urltxtTextFieldId = [self retrieveFromUserDefaultsFor:@"urltxtId"] ; ;
		
	}
	[self.view addSubview:urltxtTextField];
	
 

	decimalLabel = [[UILabel alloc] init];
	decimalLabel.textAlignment = UITextAlignmentLeft;
	decimalLabel.backgroundColor = [UIColor clearColor];
	[decimalLabel setFrame:CGRectMake(10, 50, 70, 30)];
	[decimalLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
		
	decimalLabel.textColor = [UIColor blackColor];
	decimalLabel.text = @"decimal";
	[self.view addSubview:decimalLabel];
 

	emailLabel = [[UILabel alloc] init];
	emailLabel.textAlignment = UITextAlignmentLeft;
	emailLabel.backgroundColor = [UIColor clearColor];
	[emailLabel setFrame:CGRectMake(10, 100, 70, 30)];
	[emailLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
		
	emailLabel.textColor = [UIColor blackColor];
	emailLabel.text = @"email";
	[self.view addSubview:emailLabel];
 

	numberLabel = [[UILabel alloc] init];
	numberLabel.textAlignment = UITextAlignmentLeft;
	numberLabel.backgroundColor = [UIColor clearColor];
	[numberLabel setFrame:CGRectMake(10, 150, 70, 30)];
	[numberLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
		
	numberLabel.textColor = [UIColor blackColor];
	numberLabel.text = @"number";
	[self.view addSubview:numberLabel];
 

	phoneLabel = [[UILabel alloc] init];
	phoneLabel.textAlignment = UITextAlignmentLeft;
	phoneLabel.backgroundColor = [UIColor clearColor];
	[phoneLabel setFrame:CGRectMake(10, 200, 70, 30)];
	[phoneLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
		
	phoneLabel.textColor = [UIColor blackColor];
	phoneLabel.text = @"phone";
	[self.view addSubview:phoneLabel];
 

	txtLabel = [[UILabel alloc] init];
	txtLabel.textAlignment = UITextAlignmentLeft;
	txtLabel.backgroundColor = [UIColor clearColor];
	[txtLabel setFrame:CGRectMake(10, 250, 70, 30)];
	[txtLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
		
	txtLabel.textColor = [UIColor blackColor];
	txtLabel.text = @"text";
	[self.view addSubview:txtLabel];
 

	urlLabel = [[UILabel alloc] init];
	urlLabel.textAlignment = UITextAlignmentLeft;
	urlLabel.backgroundColor = [UIColor clearColor];
	[urlLabel setFrame:CGRectMake(10, 300, 70, 30)];
	[urlLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
		
	urlLabel.textColor = [UIColor blackColor];
	urlLabel.text = @"url";
	[self.view addSubview:urlLabel];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		
	

	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	//[infoButton release];

	[self didSelectViewController];

	[self setTitle:@"Text Entry Keyboard"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
		self.title = @"Text Entry Keyboard";
	
	
	}
	return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	return [textField resignFirstResponder];
		
}	 

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range  replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];

        return FALSE;
    }
    return TRUE;
}
 


// Control Actions
#pragma mark Control Actions
	 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
		
 
		
 
		
 
		
 
		
 
		
 


-(void) displayInfo:(id)sender { 



	 

	 
	 
	  
	 
	 
	 

	[self saveValues] ;
	 

	//This is a navigation action  - test
	textEntryLayoutMDSLViewController *textEntryLayoutMDSLViewControllerInstance = [[textEntryLayoutMDSLViewController alloc] init];

	textEntryLayoutMDSLViewControllerInstance.parentController = self ;
	self.navigationController.navigationBar.hidden = NO;
	
	[self.navigationController pushViewController:textEntryLayoutMDSLViewControllerInstance animated:YES];
	[textEntryLayoutMDSLViewControllerInstance release];
	
		

} 





- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
		 
	[decimaltxtTextField release] ;
	[decimaltxtTextFieldId release] ;
 
	[emailtxtTextField release] ;
	[emailtxtTextFieldId release] ;
 
	[numbertxtTextField release] ;
	[numbertxtTextFieldId release] ;
 
	[phonetxtTextField release] ;
	[phonetxtTextFieldId release] ;
 
	[txttxtTextField release] ;
	[txttxtTextFieldId release] ;
 
	[urltxtTextField release] ;
	[urltxtTextFieldId release] ;
 
	[decimalLabel release] ; 
 
	[emailLabel release] ; 
 
	[numberLabel release] ; 
 
	[phoneLabel release] ; 
 
	[txtLabel release] ; 
 
	[urlLabel release] ; 
 
	[infoButton release]; 

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
