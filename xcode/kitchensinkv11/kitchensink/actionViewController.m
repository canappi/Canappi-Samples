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
#import "actionViewController.h"
 
 
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



@implementation actionViewController 

	@synthesize parentController ;
    @synthesize actionViewIds ;
    @synthesize actionViewValues ;

	 


	 
	// Layout : actionLayout	 
	@synthesize descriptionLabel ; 
 
	@synthesize sendUsAnEmailButton ;
 
	@synthesize phoneAFriendButton ;
 
	@synthesize openCanappiButton ;
 
	@synthesize navigateHomeButton ;
 
	@synthesize feedbackButton ;
 
	@synthesize infoButton ;





-(NSMutableDictionary *) identities {
	return actionViewIds ;
}

-(NSMutableDictionary *) values {
	return actionViewValues ;
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
			 
 
    value = [sendUsAnEmailButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"sendUsAnEmail"];	 
 
    value = [phoneAFriendButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"phoneAFriend"];	 
 
    value = [openCanappiButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"openCanappi"];	 
 
    value = [navigateHomeButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"navigateHome"];	 
 
    value = [feedbackButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"feedback"];	 
 
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
	return [actionViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [actionViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[actionViewIds setObject:identity forKey:name] ;
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

	self.actionViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.actionViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	 

	descriptionLabel = [[UILabel alloc] init];
	descriptionLabel.textAlignment = UITextAlignmentLeft;
	descriptionLabel.backgroundColor = [UIColor clearColor];
	[descriptionLabel setFrame:CGRectMake(35, 60, 240, 40)];
	[descriptionLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
		
	descriptionLabel.textColor = 	
	[UIColor whiteColor]
;
	descriptionLabel.text = @"Standard actions do not work in the simulator ... ";
	[descriptionLabel setLineBreakMode:UILineBreakModeWordWrap] ;
	descriptionLabel.numberOfLines = 2;
	[self.view addSubview:descriptionLabel];
 
	NSString * const sendUsAnEmailButtonText = @"Send an email..." ; 
	sendUsAnEmailButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	sendUsAnEmailButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	sendUsAnEmailButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	

	[sendUsAnEmailButton setFrame:CGRectMake(50, 120, 220, 40)];
	
	[sendUsAnEmailButton setTitle:sendUsAnEmailButtonText forState:UIControlStateNormal];
	//[sendUsAnEmailButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[sendUsAnEmailButton addTarget:self action:@selector(sendUsAnEmail:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:sendUsAnEmailButton];
	//[sendUsAnEmailButton release];
 
	NSString * const phoneAFriendButtonText = @"Phone a friend..." ; 
	phoneAFriendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	phoneAFriendButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	phoneAFriendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	

	[phoneAFriendButton setFrame:CGRectMake(50, 170, 220, 40)];
	
	[phoneAFriendButton setTitle:phoneAFriendButtonText forState:UIControlStateNormal];
	//[phoneAFriendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[phoneAFriendButton addTarget:self action:@selector(phoneAFriend:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:phoneAFriendButton];
	//[phoneAFriendButton release];
 
	NSString * const openCanappiButtonText = @"Open browser..." ; 
	openCanappiButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	openCanappiButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	openCanappiButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	

	[openCanappiButton setFrame:CGRectMake(50, 220, 220, 40)];
	
	[openCanappiButton setTitle:openCanappiButtonText forState:UIControlStateNormal];
	//[openCanappiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[openCanappiButton addTarget:self action:@selector(openCanappiHomePage:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:openCanappiButton];
	//[openCanappiButton release];
 
	NSString * const navigateHomeButtonText = @"Navigate to a view..." ; 
	navigateHomeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	navigateHomeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	navigateHomeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	

	[navigateHomeButton setFrame:CGRectMake(50, 270, 220, 40)];
	
	[navigateHomeButton setTitle:navigateHomeButtonText forState:UIControlStateNormal];
	//[navigateHomeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[navigateHomeButton addTarget:self action:@selector(navigateHome:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:navigateHomeButton];
	//[navigateHomeButton release];
 
	NSString * const feedbackButtonText = @"Give us feedback !!" ; 
	feedbackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	feedbackButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	feedbackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	

	[feedbackButton setFrame:CGRectMake(50, 320, 220, 40)];
	
	[feedbackButton setTitle:feedbackButtonText forState:UIControlStateNormal];
	//[feedbackButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:feedbackButton];
	//[feedbackButton release];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		
	

	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayActionLayout:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	//[infoButton release];

	[self didSelectViewController];

	[self setTitle:@"Standard Actions"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
		self.title = @"Standard Actions";
	
	
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
	 
		
 


-(void) sendUsAnEmail:(id)sender { 



	 

	 
	 
	NSString *sendUsAnEmailEmail = @"info@canappi.com";

	if (sendUsAnEmailEmail != nil) {
NSLog(@"%@",sendUsAnEmailEmail) ;        NSRange noEmail = [sendUsAnEmailEmail rangeOfString:@"@"] ;
        if (noEmail.location != NSNotFound) {
            NSString *email = [NSString stringWithFormat:@"mailto:%@",sendUsAnEmailEmail,nil] ;
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]] ;
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:email@address.com"]] ;        
        }
    }
	 
	  
	 
	 
	 

	[self saveValues] ;
	 

	//TODO implement sendUsAnEmail action
	
	
		

} 
 


-(void) phoneAFriend:(id)sender { 



	 

	 
	 
	  
	 
	 
		NSMutableString *phoneAFriendPhone = @"425-555-1212" ;
		if (isPad()) {
	    } else {
			if (phoneAFriendPhone != nil) {
		        [phoneAFriendPhone replaceOccurrencesOfString:@"(" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [phoneAFriendPhone length])];
		        [phoneAFriendPhone replaceOccurrencesOfString:@")" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [phoneAFriendPhone length])];
		        [phoneAFriendPhone replaceOccurrencesOfString:@"-" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [phoneAFriendPhone length])];
		        [phoneAFriendPhone replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [phoneAFriendPhone length])];        
		        [phoneAFriendPhone replaceOccurrencesOfString:@"+" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [phoneAFriendPhone length])];	
		
NSLog(@"%@",phoneAFriendPhone) ;	
		        NSString *phone = [NSString stringWithFormat:@"tel:%@",phoneAFriendPhone,nil] ;
		        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone]] ;
		    }
	 	}   
	 

	[self saveValues] ;
	 

	//TODO implement phoneAFriend action
	
	
		

} 
 


-(void) openCanappiHomePage:(id)sender { 



	 

	 
	 
	  
	 
	 
		NSMutableString *openCanappiHomePagePhone = @"http://www.canappi.com" ;
		if (isPad()) {
	    } else {
			if (openCanappiHomePagePhone != nil) {
		        [openCanappiHomePagePhone replaceOccurrencesOfString:@"(" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [openCanappiHomePagePhone length])];
		        [openCanappiHomePagePhone replaceOccurrencesOfString:@")" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [openCanappiHomePagePhone length])];
		        [openCanappiHomePagePhone replaceOccurrencesOfString:@"-" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [openCanappiHomePagePhone length])];
		        [openCanappiHomePagePhone replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [openCanappiHomePagePhone length])];        
		        [openCanappiHomePagePhone replaceOccurrencesOfString:@"+" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [openCanappiHomePagePhone length])];	
		
NSLog(@"%@",openCanappiHomePagePhone) ;	
		        NSString *phone = [NSString stringWithFormat:@"tel:%@",openCanappiHomePagePhone,nil] ;
		        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone]] ;
		    }
	 	}   
	 

	[self saveValues] ;
	 

	//TODO implement openCanappiHomePage action
	
	
		

} 
 


-(void) navigateHome:(id)sender { 



	 

	 
	 
	  
	 
	 
	 

	[self saveValues] ;
	 

	//This is a navigation action  - test
	homeViewController *homeViewControllerInstance = [[homeViewController alloc] init];

	homeViewControllerInstance.parentController = self ;
	self.navigationController.navigationBar.hidden = NO;
	
	[self.navigationController pushViewController:homeViewControllerInstance animated:YES];
	[homeViewControllerInstance release];
	
		

} 
 


 


-(void) displayActionLayout:(id)sender { 



	 

	 
	 
	  
	 
	 
	 

	[self saveValues] ;
	 

	//This is a navigation action  - test
	actionsMDSLController *actionsMDSLControllerInstance = [[actionsMDSLController alloc] init];

	actionsMDSLControllerInstance.parentController = self ;
	self.navigationController.navigationBar.hidden = NO;
	
	[self.navigationController pushViewController:actionsMDSLControllerInstance animated:YES];
	[actionsMDSLControllerInstance release];
	
		

} 





- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
		 
	[descriptionLabel release] ; 
 
	[sendUsAnEmailButton release]; 
 
	[phoneAFriendButton release]; 
 
	[openCanappiButton release]; 
 
	[navigateHomeButton release]; 
 
	[feedbackButton release]; 
 
	[infoButton release]; 

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
