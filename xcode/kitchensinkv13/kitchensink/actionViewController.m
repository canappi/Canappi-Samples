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
 
 
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "Reachability.h"
#import "RootController.h"




#import <SystemConfiguration/SystemConfiguration.h>
#import "GradientButton.h"

 

 

 

#import "kitchensinkAppDelegate.h"


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
#import "galleryMDSLViewController.h"
#import "textEntryLayoutMDSLViewController.h"
#import "mapMenuViewController.h"
#import "webStringViewController.h"
#import "webURLViewController.h"
#import "standardButtonViewController.h"
#import "fontViewController.h"
#import "labelViewController.h"
#import "sliderViewController.h"
#import "playerViewController.h"
#import "ImagesViewController.h"
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
#import "actionViewController.h"
#import "youTubeViewController.h"
#import "twitterViewController.h"
#import "flickrViewController.h"
#import "flickrPhotoViewController.h"



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
 
	@synthesize showAlertMessageButton ;
 
	@synthesize infoButton ;
	 
	// Layout : actionLayoutIPad	 
 
 
 
 
 
 
	@synthesize mdslWebView ;  







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

- (id)valueForKey:(NSString *)key inRow:(NSDictionary *)row {
		
	NSRange r ;

	NSString *subkey ;
	
	id object = nil ;
	
	if (key != nil) {
		r = [key rangeOfString:@"."] ;
        if (r.location == NSNotFound) {
			object = [row objectForKey:key] ;
            if ([object isKindOfClass:[NSNumber class]]) {
                object = [object stringValue] ;
            }
 		} else {
 			NSMutableString *extractor = [NSMutableString stringWithString: key];	
 			key = [extractor substringWithRange: NSMakeRange (0, r.location)]; 
 			subkey = [extractor substringFromIndex:r.location+1]; 
 			extractor = [NSMutableString stringWithString:(NSString *)[row objectForKey:key]] ;
 			NSMutableString *searchFor = [NSMutableString stringWithString: subkey];
			[searchFor appendString: @"/=/"];
	 			
 			object = @"";
 			r = [extractor rangeOfString:searchFor] ;
 			if (r.location != NSNotFound) {
	 			NSMutableString *value = [NSMutableString stringWithString:[extractor substringFromIndex:r.location+r.length]] ;
	 			NSRange r2 ;
	 			r2 = [value rangeOfString:@"///"];
	 			if (r2.location != NSNotFound) {
	 				object = [value substringWithRange: NSMakeRange (0, r2.location)]; 
	 			}
	 		}	 
	 	}
 	}
 	return object ;
}

- (void)addParsedValue:(id)value toArray:(NSMutableArray *)dataArray {
	if (value) { 
	    if ([value isKindOfClass:[NSString class]]) { 
            [dataArray addObject:value]; 
        } else {
            if ([value isKindOfClass:[NSArray class]]) { 
                NSArray *myArray = (NSArray *)value ;
                [dataArray addObject:[myArray objectAtIndex:0]]; 
            } else {
				[dataArray addObject:@""];
			}
        }
	} else {
		[dataArray addObject:@""];
	}
}



-(void) saveValues
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
 
    value = [showAlertMessageButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"showAlertMessage"];	 
 
    value = [infoButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"info"];	 
}







-(NSString*)retrieveFromUserDefaultsFor:(NSString*)key
{

	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	NSString *val = nil;
	
	if (standardUserDefaults) {
		if (key != nil)
			val = [standardUserDefaults objectForKey:key];
	}
	return val;


	//if (key != nil) return [[[NSUserDefaults standardUserDefaults] objectForKey:key] retain];
	//if (key != nil) return [[NSUserDefaults standardUserDefaults] objectForKey:key];
	//return @"";
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





- (void)selectViewController {
	if (isInitialized) {
		[self didSelectViewController] ;
	} else {
		isInitialized = YES ;
	}
}

- (void)didSelectViewController {

	// Register the observer for the keyboardWillShow event
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];



     
	 
		if (isPad()) {
				
	
	
	
	
	
	
		} else {
				
	
	
	
	
	
	
		}
			
		
	
		
		
		
		
		
		
		

	
	
	
	

	
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


// This is where the view is composed programmatically
- (void)viewDidLoad {

	self.actionViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.actionViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	if (isPad()) {
		 

	descriptionLabel = [[UILabel alloc] init];
	descriptionLabel.textAlignment = UITextAlignmentLeft;
	descriptionLabel.backgroundColor = [UIColor clearColor];
	UIFont *descriptionLabelFont = [UIFont fontWithName:@"Helvetica" size:14];
	[descriptionLabel setFont:descriptionLabelFont] ;

	descriptionLabel.text = @"Please note, some standard actions do not work in the simulator ... ";
	
	[descriptionLabel setFrame:CGRectMake(35, 60, 240, 40)];
		
	descriptionLabel.textColor = 	
	[UIColor whiteColor]
;
	[descriptionLabel setLineBreakMode:UILineBreakModeWordWrap] ;
	descriptionLabel.numberOfLines = 2;
	[self.view addSubview:descriptionLabel];
 
	NSString * const sendUsAnEmailButtonText = @"Send an email..." ; 
	sendUsAnEmailButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	sendUsAnEmailButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	sendUsAnEmailButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	sendUsAnEmailButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[sendUsAnEmailButton setFrame:CGRectMake(50, 120, 220, 40)];
	
	[sendUsAnEmailButton setTitle:sendUsAnEmailButtonText forState:UIControlStateNormal];
	//[sendUsAnEmailButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[sendUsAnEmailButton addTarget:self action:@selector(sendUsAnEmail:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:sendUsAnEmailButton];
 
	NSString * const phoneAFriendButtonText = @"Phone a friend..." ; 
	phoneAFriendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	phoneAFriendButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	phoneAFriendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	phoneAFriendButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[phoneAFriendButton setFrame:CGRectMake(50, 170, 220, 40)];
	
	[phoneAFriendButton setTitle:phoneAFriendButtonText forState:UIControlStateNormal];
	//[phoneAFriendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[phoneAFriendButton addTarget:self action:@selector(phoneAFriend:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:phoneAFriendButton];
 
	NSString * const openCanappiButtonText = @"Open browser..." ; 
	openCanappiButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	openCanappiButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	openCanappiButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	openCanappiButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[openCanappiButton setFrame:CGRectMake(50, 220, 220, 40)];
	
	[openCanappiButton setTitle:openCanappiButtonText forState:UIControlStateNormal];
	//[openCanappiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[openCanappiButton addTarget:self action:@selector(openCanappiHomePage:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:openCanappiButton];
 
	NSString * const navigateHomeButtonText = @"Navigate to a view..." ; 
	navigateHomeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	navigateHomeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	navigateHomeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	navigateHomeButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[navigateHomeButton setFrame:CGRectMake(50, 270, 220, 40)];
	
	[navigateHomeButton setTitle:navigateHomeButtonText forState:UIControlStateNormal];
	//[navigateHomeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[navigateHomeButton addTarget:self action:@selector(navigateHome:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:navigateHomeButton];
 
	NSString * const showAlertMessageButtonText = @"Show a dialog ..." ; 
	showAlertMessageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	showAlertMessageButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	showAlertMessageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	showAlertMessageButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[showAlertMessageButton setFrame:CGRectMake(50, 320, 220, 40)];
	
	[showAlertMessageButton setTitle:showAlertMessageButtonText forState:UIControlStateNormal];
	//[showAlertMessageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[showAlertMessageButton addTarget:self action:@selector(showAlertMessage:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:showAlertMessageButton];

  	mdslWebView = [[UIWebView alloc] initWithFrame:CGRectMake(350, 45, 350, 500)];

 	NSString *mdslUrlAddress = @"http://www.canappi.com/ks/actions.html";
	NSURL *mdslUrl = [NSURL URLWithString:mdslUrlAddress];
	NSURLRequest *mdslRequestObj = [NSURLRequest requestWithURL:mdslUrl];
	[mdslWebView loadRequest:mdslRequestObj]; 
	[self.view addSubview:mdslWebView];
	} else {
		 

	descriptionLabel = [[UILabel alloc] init];
	descriptionLabel.textAlignment = UITextAlignmentLeft;
	descriptionLabel.backgroundColor = [UIColor clearColor];
	UIFont *descriptionLabelFont = [UIFont fontWithName:@"Helvetica" size:14];
	[descriptionLabel setFont:descriptionLabelFont] ;

	descriptionLabel.text = @"Please note, some standard actions do not work in the simulator ... ";
	
	[descriptionLabel setFrame:CGRectMake(35, 60, 240, 40)];
		
	descriptionLabel.textColor = 	
	[UIColor whiteColor]
;
	[descriptionLabel setLineBreakMode:UILineBreakModeWordWrap] ;
	descriptionLabel.numberOfLines = 2;
	[self.view addSubview:descriptionLabel];
 
	NSString * const sendUsAnEmailButtonText = @"Send an email..." ; 
	sendUsAnEmailButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	sendUsAnEmailButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	sendUsAnEmailButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	sendUsAnEmailButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[sendUsAnEmailButton setFrame:CGRectMake(50, 120, 220, 40)];
	
	[sendUsAnEmailButton setTitle:sendUsAnEmailButtonText forState:UIControlStateNormal];
	//[sendUsAnEmailButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[sendUsAnEmailButton addTarget:self action:@selector(sendUsAnEmail:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:sendUsAnEmailButton];
 
	NSString * const phoneAFriendButtonText = @"Phone a friend..." ; 
	phoneAFriendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	phoneAFriendButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	phoneAFriendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	phoneAFriendButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[phoneAFriendButton setFrame:CGRectMake(50, 170, 220, 40)];
	
	[phoneAFriendButton setTitle:phoneAFriendButtonText forState:UIControlStateNormal];
	//[phoneAFriendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[phoneAFriendButton addTarget:self action:@selector(phoneAFriend:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:phoneAFriendButton];
 
	NSString * const openCanappiButtonText = @"Open browser..." ; 
	openCanappiButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	openCanappiButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	openCanappiButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	openCanappiButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[openCanappiButton setFrame:CGRectMake(50, 220, 220, 40)];
	
	[openCanappiButton setTitle:openCanappiButtonText forState:UIControlStateNormal];
	//[openCanappiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[openCanappiButton addTarget:self action:@selector(openCanappiHomePage:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:openCanappiButton];
 
	NSString * const navigateHomeButtonText = @"Navigate to a view..." ; 
	navigateHomeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	navigateHomeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	navigateHomeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	navigateHomeButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[navigateHomeButton setFrame:CGRectMake(50, 270, 220, 40)];
	
	[navigateHomeButton setTitle:navigateHomeButtonText forState:UIControlStateNormal];
	//[navigateHomeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[navigateHomeButton addTarget:self action:@selector(navigateHome:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:navigateHomeButton];
 
	NSString * const showAlertMessageButtonText = @"Show a dialog ..." ; 
	showAlertMessageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	showAlertMessageButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	showAlertMessageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	showAlertMessageButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[showAlertMessageButton setFrame:CGRectMake(50, 320, 220, 40)];
	
	[showAlertMessageButton setTitle:showAlertMessageButtonText forState:UIControlStateNormal];
	//[showAlertMessageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[showAlertMessageButton addTarget:self action:@selector(showAlertMessage:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:showAlertMessageButton];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		

	infoButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayActionLayout:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	}

	[self didSelectViewController];

	[self setTitle:@"Standard Actions"];
	

	if (isPad()) {
	 
 
 
 
 
 
 
	}
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if (self = [self init]) {
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



	BOOL exception = NO ;
	
	 

	 
	 
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
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 



	
	
	//TODO implement sendUsAnEmail action
	
	
	
		
}
 


-(void) phoneAFriend:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
		NSMutableString *phoneAFriendPhone = [NSMutableString stringWithString:@"425-555-1212"] ;
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
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 



	
	
	//TODO implement phoneAFriend action
	
	
	
		
}
 


-(void) openCanappiHomePage:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	NSString *openCanappiHomePageUrl = @"http://www.canappi.com";

	if (openCanappiHomePageUrl != nil) {
NSLog(@"%@",openCanappiHomePageUrl) ;
        NSRange noUrl = [openCanappiHomePageUrl rangeOfString:@"http://"] ;
        if (noUrl.location != NSNotFound) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:openCanappiHomePageUrl]] ;
        } else {
           //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.canappi.com"]] ;        
        }
    }
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 



	
	
	//TODO implement openCanappiHomePage action
	
	
	
		
}
 


-(void) navigateHome:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 


	//This is a navigation action  - test
	homeViewController *homeViewControllerInstance = [[homeViewController alloc] init];


	homeViewControllerInstance.parentController = self ;
	
	self.navigationController.navigationBar.hidden = NO;
	
		
	[self.navigationController pushViewController:homeViewControllerInstance animated:YES];
	[homeViewControllerInstance release];
	
	
	//TODO implement navigateHome action
	
	
	
		
}
 


-(void) showAlertMessage:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
		UIAlertView *alert = [[UIAlertView alloc]
		initWithTitle:@"Alert" 
		message:@"This is a message"
		delegate:nil
		cancelButtonTitle:@"Cancel"
		otherButtonTitles:@"Ok",nil];
		[alert show];
		[alert release];
	 
	 



	
	
	//TODO implement showAlertMessage action
	
	
	
		
}
 

	 
		
 


 


 


 


 


 


-(void) displayActionLayout:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 


	//This is a navigation action  - test
	actionsMDSLController *actionsMDSLControllerInstance = [[actionsMDSLController alloc] init];


	actionsMDSLControllerInstance.parentController = self ;
	
	self.navigationController.navigationBar.hidden = NO;
	
		
	[self.navigationController pushViewController:actionsMDSLControllerInstance animated:YES];
	[actionsMDSLControllerInstance release];
	
	
	//TODO implement displayActionLayout action
	
	
	
		
}



// No Gallery Here





- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	
    


}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];

				
	
	
	
	
	
	

	
    
}	

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.

		 
	[descriptionLabel release] ; 
 
	[sendUsAnEmailButton release]; 
 
	[phoneAFriendButton release]; 
 
	[openCanappiButton release]; 
 
	[navigateHomeButton release]; 
 
	[showAlertMessageButton release]; 
 
	[infoButton release]; 


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
