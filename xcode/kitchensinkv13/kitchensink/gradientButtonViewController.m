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
#import "gradientButtonViewController.h"
 
 
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



@implementation gradientButtonViewController 


	@synthesize parentController ;
    @synthesize gradientButtonViewIds ;
    @synthesize gradientButtonViewValues ;

	 


	 
	// Layout : gradientButtonLayout	 
	@synthesize mybuttonButton ;
 
	@synthesize mybutton1Button ;
 
	@synthesize mybutton2Button ;
 
	@synthesize mybutton3Button ;
 
	@synthesize mybutton4Button ;
 
	@synthesize mybutton5Button ;
 
	@synthesize mybutton6Button ;
 
	@synthesize mybutton7Button ;
 
	@synthesize infoButton ;
	 
	// Layout : gradientButtonLayoutIPad	 
 
 
 
 
 
 
 
	@synthesize mdslWebView ;  







-(NSMutableDictionary *) identities {
	return gradientButtonViewIds ;
}

-(NSMutableDictionary *) values {
	return gradientButtonViewValues ;
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
 
    value = [mybutton4Button currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton4"];	 
 
    value = [mybutton5Button currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton5"];	 
 
    value = [mybutton6Button currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton6"];	 
 
    value = [mybutton7Button currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"mybutton7"];	 
 
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
	return [gradientButtonViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [gradientButtonViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[gradientButtonViewIds setObject:identity forKey:name] ;
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

	self.gradientButtonViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.gradientButtonViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	
	
	
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
	[containerView setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
	containerView.bounces = YES;
	[containerView setContentOffset:CGPointMake(0, 45) animated:YES] ;
	self.view = containerView;
	[containerView release] ;
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	if (isPad()) {
		 
	NSString * const mybuttonButtonText = @"Gradient Alert" ; 
	// Button style Gradient
	mybuttonButton = [[GradientButton alloc] initWithFrame:CGRectMake(20, 50, 250, 30)];
	[mybuttonButton useAlertStyle];

	mybuttonButton.titleLabel.font = [UIFont fontWithName:@"Courier-Oblique" size:16] ;
	
	
	[mybuttonButton setFrame:CGRectMake(20, 50, 250, 30)];
	
	[mybuttonButton setTitle:mybuttonButtonText forState:UIControlStateNormal];
	[mybuttonButton setTitleColor:	
	[UIColor grayColor]
 forState:UIControlStateNormal];
	[self.view addSubview:mybuttonButton];
 
	NSString * const mybutton1ButtonText = @"Gradient Black" ; 
	// Button style Gradient
	mybutton1Button = [[GradientButton alloc] initWithFrame:CGRectMake(20, 100, 250, 40)];
	[mybutton1Button useBlackStyle];

	mybutton1Button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20] ;
	
	
	[mybutton1Button setFrame:CGRectMake(20, 100, 250, 40)];
	
	[mybutton1Button setTitle:mybutton1ButtonText forState:UIControlStateNormal];
	[mybutton1Button setTitleColor:	
	[UIColor whiteColor]
 forState:UIControlStateNormal];
	[self.view addSubview:mybutton1Button];
 
	NSString * const mybutton2ButtonText = @"Gradient WhiteActionSheet" ; 
	// Button style Gradient
	mybutton2Button = [[GradientButton alloc] initWithFrame:CGRectMake(20, 150, 250, 30)];
	[mybutton2Button useWhiteActionSheetStyle];

	mybutton2Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton2Button setFrame:CGRectMake(20, 150, 250, 30)];
	
	[mybutton2Button setTitle:mybutton2ButtonText forState:UIControlStateNormal];
	//[mybutton2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton2Button];
 
	NSString * const mybutton3ButtonText = @"Gradient RedDelete" ; 
	// Button style Gradient
	mybutton3Button = [[GradientButton alloc] initWithFrame:CGRectMake(20, 200, 250, 30)];
	[mybutton3Button useRedDeleteStyle];

	mybutton3Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton3Button setFrame:CGRectMake(20, 200, 250, 30)];
	
	[mybutton3Button setTitle:mybutton3ButtonText forState:UIControlStateNormal];
	//[mybutton3Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton3Button];
 
	NSString * const mybutton4ButtonText = @"Gradient BlackActionSheet" ; 
	// Button style Gradient
	mybutton4Button = [[GradientButton alloc] initWithFrame:CGRectMake(20, 250, 250, 30)];
	[mybutton4Button useBlackActionSheetStyle];

	mybutton4Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton4Button setFrame:CGRectMake(20, 250, 250, 30)];
	
	[mybutton4Button setTitle:mybutton4ButtonText forState:UIControlStateNormal];
	//[mybutton4Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton4Button];
 
	NSString * const mybutton5ButtonText = @"Gradient GreenConfirm" ; 
	// Button style Gradient
	mybutton5Button = [[GradientButton alloc] initWithFrame:CGRectMake(20, 300, 250, 30)];
	[mybutton5Button useGreenConfirmStyle];

	mybutton5Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton5Button setFrame:CGRectMake(20, 300, 250, 30)];
	
	[mybutton5Button setTitle:mybutton5ButtonText forState:UIControlStateNormal];
	//[mybutton5Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton5Button];
 
	NSString * const mybutton6ButtonText = @"Gradient SimpleOrange" ; 
	// Button style Gradient
	mybutton6Button = [[GradientButton alloc] initWithFrame:CGRectMake(20, 350, 250, 30)];
	[mybutton6Button useSimpleOrangeStyle];

	mybutton6Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton6Button setFrame:CGRectMake(20, 350, 250, 30)];
	
	[mybutton6Button setTitle:mybutton6ButtonText forState:UIControlStateNormal];
	//[mybutton6Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton6Button];

  	mdslWebView = [[UIWebView alloc] initWithFrame:CGRectMake(350, 45, 350, 500)];

 	NSString *mdslUrlAddress = @"http://www.canappi.com/ks/gradientButtons.html";
	NSURL *mdslUrl = [NSURL URLWithString:mdslUrlAddress];
	NSURLRequest *mdslRequestObj = [NSURLRequest requestWithURL:mdslUrl];
	[mdslWebView loadRequest:mdslRequestObj]; 
	[self.view addSubview:mdslWebView];
	} else {
		 
	NSString * const mybuttonButtonText = @"Gradient Alert" ; 
	// Button style Gradient
	mybuttonButton = [[GradientButton alloc] initWithFrame:CGRectMake(10, 50, 250, 30)];
	[mybuttonButton useAlertStyle];

	mybuttonButton.titleLabel.font = [UIFont fontWithName:@"Courier-Oblique" size:16] ;
	
	
	[mybuttonButton setFrame:CGRectMake(10, 50, 250, 30)];
	
	[mybuttonButton setTitle:mybuttonButtonText forState:UIControlStateNormal];
	[mybuttonButton setTitleColor:	
	[UIColor grayColor]
 forState:UIControlStateNormal];
	[self.view addSubview:mybuttonButton];
 
	NSString * const mybutton1ButtonText = @"Gradient Black" ; 
	// Button style Gradient
	mybutton1Button = [[GradientButton alloc] initWithFrame:CGRectMake(10, 100, 250, 40)];
	[mybutton1Button useBlackStyle];

	mybutton1Button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20] ;
	
	
	[mybutton1Button setFrame:CGRectMake(10, 100, 250, 40)];
	
	[mybutton1Button setTitle:mybutton1ButtonText forState:UIControlStateNormal];
	[mybutton1Button setTitleColor:	
	[UIColor whiteColor]
 forState:UIControlStateNormal];
	[self.view addSubview:mybutton1Button];
 
	NSString * const mybutton2ButtonText = @"Gradient WhiteActionSheet" ; 
	// Button style Gradient
	mybutton2Button = [[GradientButton alloc] initWithFrame:CGRectMake(10, 150, 250, 30)];
	[mybutton2Button useWhiteActionSheetStyle];

	mybutton2Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton2Button setFrame:CGRectMake(10, 150, 250, 30)];
	
	[mybutton2Button setTitle:mybutton2ButtonText forState:UIControlStateNormal];
	//[mybutton2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton2Button];
 
	NSString * const mybutton3ButtonText = @"Gradient RedDelete" ; 
	// Button style Gradient
	mybutton3Button = [[GradientButton alloc] initWithFrame:CGRectMake(10, 200, 250, 30)];
	[mybutton3Button useRedDeleteStyle];

	mybutton3Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton3Button setFrame:CGRectMake(10, 200, 250, 30)];
	
	[mybutton3Button setTitle:mybutton3ButtonText forState:UIControlStateNormal];
	//[mybutton3Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton3Button];
 
	NSString * const mybutton4ButtonText = @"Gradient BlackActionSheet" ; 
	// Button style Gradient
	mybutton4Button = [[GradientButton alloc] initWithFrame:CGRectMake(10, 250, 250, 30)];
	[mybutton4Button useBlackActionSheetStyle];

	mybutton4Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton4Button setFrame:CGRectMake(10, 250, 250, 30)];
	
	[mybutton4Button setTitle:mybutton4ButtonText forState:UIControlStateNormal];
	//[mybutton4Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton4Button];
 
	NSString * const mybutton5ButtonText = @"Gradient GreenConfirm" ; 
	// Button style Gradient
	mybutton5Button = [[GradientButton alloc] initWithFrame:CGRectMake(10, 300, 250, 30)];
	[mybutton5Button useGreenConfirmStyle];

	mybutton5Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton5Button setFrame:CGRectMake(10, 300, 250, 30)];
	
	[mybutton5Button setTitle:mybutton5ButtonText forState:UIControlStateNormal];
	//[mybutton5Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton5Button];
 
	NSString * const mybutton6ButtonText = @"Gradient SimpleOrange" ; 
	// Button style Gradient
	mybutton6Button = [[GradientButton alloc] initWithFrame:CGRectMake(10, 350, 250, 30)];
	[mybutton6Button useSimpleOrangeStyle];

	mybutton6Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton6Button setFrame:CGRectMake(10, 350, 250, 30)];
	
	[mybutton6Button setTitle:mybutton6ButtonText forState:UIControlStateNormal];
	//[mybutton6Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton6Button];
 
	NSString * const mybutton7ButtonText = @"Gradient White" ; 
	// Button style Gradient
	mybutton7Button = [[GradientButton alloc] initWithFrame:CGRectMake(10, 400, 250, 30)];
	[mybutton7Button useWhiteStyle];

	mybutton7Button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[mybutton7Button setFrame:CGRectMake(10, 400, 250, 30)];
	
	[mybutton7Button setTitle:mybutton7ButtonText forState:UIControlStateNormal];
	//[mybutton7Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.view addSubview:mybutton7Button];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		

	infoButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	}

	[self didSelectViewController];

	[self setTitle:@"Gradient Style Buttons"];
	

	if (isPad()) {
	 
 
 
 
 
 
 
 
	}
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if (self = [self init]) {
		self.title = @"Gradient Style Buttons";
	
	
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



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 


	//This is a navigation action  - test
	gradientButtonsMDSLController *gradientButtonsMDSLControllerInstance = [[gradientButtonsMDSLController alloc] init];


	gradientButtonsMDSLControllerInstance.parentController = self ;
	
	self.navigationController.navigationBar.hidden = NO;
	
		
	[self.navigationController pushViewController:gradientButtonsMDSLControllerInstance animated:YES];
	[gradientButtonsMDSLControllerInstance release];
	
	
	//TODO implement displayInfo action
	
	
	
		
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

		 
	[mybuttonButton release]; 
 
	[mybutton1Button release]; 
 
	[mybutton2Button release]; 
 
	[mybutton3Button release]; 
 
	[mybutton4Button release]; 
 
	[mybutton5Button release]; 
 
	[mybutton6Button release]; 
 
	[mybutton7Button release]; 
 
	[infoButton release]; 


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
