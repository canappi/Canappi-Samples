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
#import "fontViewController.h"
 
 
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



@implementation fontViewController 

	@synthesize parentController ;
    @synthesize fontViewIds ;
    @synthesize fontViewValues ;

	 


	 
	// Layout : fontLayout	 
	@synthesize arialHebrewLabel ; 
 
	@synthesize helveticaLabel ; 
 
	@synthesize italicLabel ; 
 
	@synthesize multiLineLabel ; 
 
	@synthesize clienttxt1TextField ;
	@synthesize clienttxt1TextFieldId ;
 
	@synthesize emailtxt1TextField ;
	@synthesize emailtxt1TextFieldId ;
 
	@synthesize clienttxt2TextField ;
	@synthesize clienttxt2TextFieldId ;
 
	@synthesize emailtxt2TextField ;
	@synthesize emailtxt2TextFieldId ;
 
	@synthesize infoButton ;





-(NSMutableDictionary *) identities {
	return fontViewIds ;
}

-(NSMutableDictionary *) values {
	return fontViewValues ;
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
			 
 
 
 
 
    value = clienttxt1TextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"clienttxt1"];	 
 
    value = emailtxt1TextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"emailtxt1"];	 
 
    value = clienttxt2TextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"clienttxt2"];	 
 
    value = emailtxt2TextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"emailtxt2"];	 
 
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
	return [fontViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [fontViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[fontViewIds setObject:identity forKey:name] ;
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
		
	
	
	
	
    [clienttxt1TextField resignFirstResponder];
	
    [emailtxt1TextField resignFirstResponder];
	
    [clienttxt2TextField resignFirstResponder];
	
    [emailtxt2TextField resignFirstResponder];
	
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	self.fontViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.fontViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

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
		[containerView setContentSize:CGSizeMake(320,700)]; 
	}
	[containerView setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
	containerView.bounces = YES;
	
	self.view = containerView;
	[containerView release] ;
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	 

	arialHebrewLabel = [[UILabel alloc] init];
	arialHebrewLabel.textAlignment = UITextAlignmentLeft;
	arialHebrewLabel.backgroundColor = [UIColor clearColor];
	[arialHebrewLabel setFrame:CGRectMake(10, 55, 180, 28)];
	[arialHebrewLabel setFont:[UIFont fontWithName:@"ArialHebrew" size:16]];
		
	arialHebrewLabel.textColor = 	
	[UIColor whiteColor]
;
	arialHebrewLabel.text = @"Arial Hebrew 16";
	[self.view addSubview:arialHebrewLabel];
 

	helveticaLabel = [[UILabel alloc] init];
	helveticaLabel.textAlignment = UITextAlignmentCenter;
	helveticaLabel.backgroundColor = [UIColor clearColor];
	[helveticaLabel setFrame:CGRectMake(10, 85, 180, 28)];
	[helveticaLabel setFont:[UIFont fontWithName:@"helvetica" size:16]];
		
	helveticaLabel.textColor = 	
	[UIColor greenColor]
;
	helveticaLabel.text = @"Helvetica 16";
	[self.view addSubview:helveticaLabel];
 

	italicLabel = [[UILabel alloc] init];
	italicLabel.textAlignment = UITextAlignmentLeft;
	italicLabel.backgroundColor = [UIColor clearColor];
	[italicLabel setFrame:CGRectMake(10, 115, 180, 28)];
	[italicLabel setFont:[UIFont fontWithName:@"Courier-Oblique" size:16]];
		
	italicLabel.textColor = 	
	[UIColor purpleColor]
;
	italicLabel.text = @"Courier-Oblique 16";
	[self.view addSubview:italicLabel];
 

	multiLineLabel = [[UILabel alloc] init];
	multiLineLabel.textAlignment = UITextAlignmentRight;
	multiLineLabel.backgroundColor = [UIColor clearColor];
	[multiLineLabel setFrame:CGRectMake(10, 150, 180, 50)];
	[multiLineLabel setFont:[UIFont fontWithName:@"helvetica" size:10]];
		
	multiLineLabel.textColor = 	
	[UIColor cyanColor]
;
	multiLineLabel.text = @"This is a multiline lavel with helvetica 8. It allows you to display entire paragraphs. (Helvetica 10)";
	[multiLineLabel setLineBreakMode:UILineBreakModeWordWrap] ;
	multiLineLabel.numberOfLines = 3;
	[self.view addSubview:multiLineLabel];

	
	clienttxt1TextField = [[UITextField alloc] init];	
	clienttxt1TextField.delegate = self;
	clienttxt1TextField.textAlignment = UITextAlignmentLeft;
	clienttxt1TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[clienttxt1TextField setFrame:CGRectMake(10, 200, 200, 28)];
	[clienttxt1TextField setFont:[UIFont fontWithName:@"ArialHebrew" size:12]];
	clienttxt1TextField.textColor = [UIColor greenColor];
	clienttxt1TextField.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	clienttxt1TextField.autocorrectionType = UITextAutocorrectionTypeNo;
	clienttxt1TextField.keyboardType =  UIKeyboardTypeAlphabet;
	//clienttxt1TextField.tag = 0;
	clienttxt1TextField.clearButtonMode = false;	
	[clienttxt1TextField setBorderStyle:UITextBorderStyleRoundedRect] ;
	

	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(clienttxt1TextField)]) { 
			UITextField * tzip = [parentController clienttxt1TextField] ;
			clienttxt1TextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"clienttxt1"] ;	
		clienttxt1TextField.text = value ;
		clienttxt1TextFieldId = [self retrieveFromUserDefaultsFor:@"clienttxt1Id"] ; ;
		
	}
	[self.view addSubview:clienttxt1TextField];
	

	
	emailtxt1TextField = [[UITextField alloc] init];	
	emailtxt1TextField.delegate = self;
	emailtxt1TextField.textAlignment = UITextAlignmentCenter;
	emailtxt1TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[emailtxt1TextField setFrame:CGRectMake(10, 240, 200, 28)];
	[emailtxt1TextField setFont:[UIFont fontWithName:@"helvetica" size:12]];
	emailtxt1TextField.textColor = [UIColor cyanColor];
	emailtxt1TextField.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	emailtxt1TextField.autocorrectionType = UITextAutocorrectionTypeNo;
	emailtxt1TextField.keyboardType =  UIKeyboardTypeAlphabet;
	//emailtxt1TextField.tag = 0;
	emailtxt1TextField.clearButtonMode = false;	
	[emailtxt1TextField setBorderStyle:UITextBorderStyleRoundedRect] ;
	

	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(emailtxt1TextField)]) { 
			UITextField * tzip = [parentController emailtxt1TextField] ;
			emailtxt1TextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"emailtxt1"] ;	
		emailtxt1TextField.text = value ;
		emailtxt1TextFieldId = [self retrieveFromUserDefaultsFor:@"emailtxt1Id"] ; ;
		
	}
	[self.view addSubview:emailtxt1TextField];
	

	
	clienttxt2TextField = [[UITextField alloc] init];	
	clienttxt2TextField.delegate = self;
	clienttxt2TextField.textAlignment = UITextAlignmentRight;
	clienttxt2TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[clienttxt2TextField setFrame:CGRectMake(10, 280, 200, 28)];
	[clienttxt2TextField setFont:[UIFont fontWithName:@"helvetica" size:8]];
	clienttxt2TextField.textColor = [UIColor brownColor];
	clienttxt2TextField.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	clienttxt2TextField.autocorrectionType = UITextAutocorrectionTypeNo;
	clienttxt2TextField.keyboardType =  UIKeyboardTypeAlphabet;
	//clienttxt2TextField.tag = 0;
	clienttxt2TextField.clearButtonMode = false;	
	[clienttxt2TextField setBorderStyle:UITextBorderStyleRoundedRect] ;
	

	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(clienttxt2TextField)]) { 
			UITextField * tzip = [parentController clienttxt2TextField] ;
			clienttxt2TextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"clienttxt2"] ;	
		clienttxt2TextField.text = value ;
		clienttxt2TextFieldId = [self retrieveFromUserDefaultsFor:@"clienttxt2Id"] ; ;
		
	}
	[self.view addSubview:clienttxt2TextField];
	

	emailtxt2TextField = [[UITextView alloc] init];	
	emailtxt2TextField.delegate = self;
	emailtxt2TextField.textAlignment = UITextAlignmentLeft;
	[emailtxt2TextField setFrame:CGRectMake(10, 320, 200, 80)];
	[emailtxt2TextField setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
	emailtxt2TextField.textColor = [UIColor orangeColor];
	emailtxt2TextField.enabled = YES;	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(emailtxt2TextField)]) { 
			UITextField * tzip = [parentController emailtxt2TextField] ;
			emailtxt2TextField.text = tzip.text ; 
		}}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"emailtxt2"] ;	
		emailtxt2TextField.text = value ;
		emailtxt2TextFieldId = [self retrieveFromUserDefaultsFor:@"emailtxt2Id"] ; ;
		
	}
	[self.view addSubview:emailtxt2TextField];
	
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		
	

	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	//[infoButton release];

	[self didSelectViewController];

	[self setTitle:@"Fonts"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
		self.title = @"Fonts";
	
	
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
	fontsMDSLController *fontsMDSLControllerInstance = [[fontsMDSLController alloc] init];

	fontsMDSLControllerInstance.parentController = self ;
	self.navigationController.navigationBar.hidden = NO;
	
	[self.navigationController pushViewController:fontsMDSLControllerInstance animated:YES];
	[fontsMDSLControllerInstance release];
	
		

} 





- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
		 
	[arialHebrewLabel release] ; 
 
	[helveticaLabel release] ; 
 
	[italicLabel release] ; 
 
	[multiLineLabel release] ; 
 
	[clienttxt1TextField release] ;
	[clienttxt1TextFieldId release] ;
 
	[emailtxt1TextField release] ;
	[emailtxt1TextFieldId release] ;
 
	[clienttxt2TextField release] ;
	[clienttxt2TextFieldId release] ;
 
	[emailtxt2TextField release] ;
	[emailtxt2TextFieldId release] ;
 
	[infoButton release]; 

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
