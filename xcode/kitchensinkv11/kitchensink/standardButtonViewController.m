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
#import "standardButtonViewController.h"
 
 
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



@implementation standardButtonViewController 

	@synthesize parentController ;
    @synthesize standardButtonViewIds ;
    @synthesize standardButtonViewValues ;

	 


	 
	// Layout : standardButtonLayout	 
	@synthesize mybuttonButton ;
 
	@synthesize mybutton1Button ;
 
	@synthesize mybutton2Button ;
 
	@synthesize mybutton3Button ;
 
	@synthesize mybutton5Button ;
 
	@synthesize mybutton6Button ;
 
	@synthesize infoButton ;





-(NSMutableDictionary *) identities {
	return standardButtonViewIds ;
}

-(NSMutableDictionary *) values {
	return standardButtonViewValues ;
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
			 
    value = [mybuttonButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton"];	 
 
    value = [mybutton1Button currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton1"];	 
 
    value = [mybutton2Button currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton2"];	 
 
    value = [mybutton3Button currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton3"];	 
 
    value = [mybutton5Button currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton5"];	 
 
    value = [mybutton6Button currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton6"];	 
 
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
	return [standardButtonViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [standardButtonViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[standardButtonViewIds setObject:identity forKey:name] ;
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
		
	
	
	
	
	
	
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	self.standardButtonViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.standardButtonViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	 
	NSString * const mybuttonButtonText = @"Custom" ; 
	// Button style Custom
	mybuttonButton = [UIButton buttonWithType:UIButtonTypeCustom];
	
	mybuttonButton.titleLabel.font = [UIFont fontWithName:@"Courier-Oblique" size:14.0] ;

	[mybuttonButton setFrame:CGRectMake(30, 50, 100, 30)];
	
	[mybuttonButton setTitle:mybuttonButtonText forState:UIControlStateNormal];
	[mybuttonButton setTitleColor:	
	[UIColor grayColor]
 forState:UIControlStateNormal];
	[mybuttonButton setBackgroundImage:[UIImage imageNamed:@"custom1.png"] forState:UIControlStateNormal];
	UIImage * mybuttonButtonSelectedImage = [UIImage imageNamed:@"custom2.png"];
    [mybuttonButton setBackgroundImage:mybuttonButtonSelectedImage forState:UIControlStateSelected];
    [mybuttonButton setBackgroundImage:mybuttonButtonSelectedImage forState:UIControlStateHighlighted];
	
	[self.view addSubview:mybuttonButton];
	//[mybuttonButton release];
 
	NSString * const mybutton1ButtonText = @"Bordered" ; 
	mybutton1Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	mybutton1Button.layer.cornerRadius = 8.0 ;
	[[mybutton1Button layer] setMasksToBounds:YES] ;
	

	[mybutton1Button setFrame:CGRectMake(30, 100, 100, 30)];
	
	[mybutton1Button setTitle:mybutton1ButtonText forState:UIControlStateNormal];
	//[mybutton1Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton1Button];
	//[mybutton1Button release];
 
	NSString * const mybutton2ButtonText = @"InfoLight" ; 
	mybutton2Button = [UIButton buttonWithType:UIButtonTypeInfoLight];		
	

	[mybutton2Button setFrame:CGRectMake(30, 150, 200, 30)];
	
	[mybutton2Button setTitle:mybutton2ButtonText forState:UIControlStateNormal];
	//[mybutton2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton2Button];
	//[mybutton2Button release];
 
	NSString * const mybutton3ButtonText = @"InfoDark" ; 
	mybutton3Button = [UIButton buttonWithType:UIButtonTypeInfoDark];		
	

	[mybutton3Button setFrame:CGRectMake(30, 200, 200, 30)];
	
	[mybutton3Button setTitle:mybutton3ButtonText forState:UIControlStateNormal];
	//[mybutton3Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton3Button];
	//[mybutton3Button release];
 
	NSString * const mybutton5ButtonText = @"DetailDisclosure" ; 
	mybutton5Button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];		
	

	[mybutton5Button setFrame:CGRectMake(30, 250, 200, 30)];
	
	[mybutton5Button setTitle:mybutton5ButtonText forState:UIControlStateNormal];
	//[mybutton5Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton5Button];
	//[mybutton5Button release];
 
	NSString * const mybutton6ButtonText = @"ContactAdd" ; 
	mybutton6Button = [UIButton buttonWithType:UIButtonTypeContactAdd];		
	

	[mybutton6Button setFrame:CGRectMake(30, 300, 200, 30)];
	
	[mybutton6Button setTitle:mybutton6ButtonText forState:UIControlStateNormal];
	//[mybutton6Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton6Button];
	//[mybutton6Button release];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		
	

	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	//[infoButton release];

	[self didSelectViewController];

	[self setTitle:@"Standard Buttons"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
		self.title = @"Standard Buttons";
	
	
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
	standardButtonsMDSLController *standardButtonsMDSLControllerInstance = [[standardButtonsMDSLController alloc] init];

	standardButtonsMDSLControllerInstance.parentController = self ;
	self.navigationController.navigationBar.hidden = NO;
	
	[self.navigationController pushViewController:standardButtonsMDSLControllerInstance animated:YES];
	[standardButtonsMDSLControllerInstance release];
	
		

} 





- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
		 
	[mybuttonButton release]; 
 
	[mybutton1Button release]; 
 
	[mybutton2Button release]; 
 
	[mybutton3Button release]; 
 
	[mybutton5Button release]; 
 
	[mybutton6Button release]; 
 
	[infoButton release]; 

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
