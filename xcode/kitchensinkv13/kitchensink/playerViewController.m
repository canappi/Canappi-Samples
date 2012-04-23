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
#import "playerViewController.h"
 
 
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "Reachability.h"
#import "RootController.h"


#import <MediaPlayer/MediaPlayer.h>  


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



@implementation playerViewController 


	@synthesize parentController ;
    @synthesize playerViewIds ;
    @synthesize playerViewValues ;

	 


	 
	// Layout : playerLayout	 
	@synthesize playTutorialButton ;
 
 
	@synthesize infoButton ;
	 
	// Layout : playerLayoutIPad	 
 
 
	@synthesize mdslWebView ;  







-(NSMutableDictionary *) identities {
	return playerViewIds ;
}

-(NSMutableDictionary *) values {
	return playerViewValues ;
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
			 
    value = [playTutorialButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"playTutorial"];	 
 
 
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
	return [playerViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [playerViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[playerViewIds setObject:identity forKey:name] ;
}




- (void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                          name:MPMoviePlayerPlaybackDidFinishNotification
                                          object:moviePlayerController];

    [moviePlayerController.view removeFromSuperview];
    [moviePlayerController release];
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

	self.playerViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.playerViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	if (isPad()) {
		 
	NSString * const playTutorialButtonText = @"Play" ; 
	playTutorialButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	playTutorialButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	playTutorialButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	playTutorialButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[playTutorialButton setFrame:CGRectMake(30, 50, 80, 30)];
	
	[playTutorialButton setTitle:playTutorialButtonText forState:UIControlStateNormal];
	//[playTutorialButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[playTutorialButton addTarget:self action:@selector(playTutorial:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:playTutorialButton];
 
	

  	mdslWebView = [[UIWebView alloc] initWithFrame:CGRectMake(30, 650, 500, 200)];

 	NSString *mdslUrlAddress = @"http://www.canappi.com/ks/images.html";
	NSURL *mdslUrl = [NSURL URLWithString:mdslUrlAddress];
	NSURLRequest *mdslRequestObj = [NSURLRequest requestWithURL:mdslUrl];
	[mdslWebView loadRequest:mdslRequestObj]; 
	[self.view addSubview:mdslWebView];
	} else {
		 
	NSString * const playTutorialButtonText = @"Play" ; 
	playTutorialButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	playTutorialButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	playTutorialButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	playTutorialButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[playTutorialButton setFrame:CGRectMake(10, 50, 80, 30)];
	
	[playTutorialButton setTitle:playTutorialButtonText forState:UIControlStateNormal];
	//[playTutorialButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[playTutorialButton addTarget:self action:@selector(playTutorial:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:playTutorialButton];
 
	
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		

	infoButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	}

	[self didSelectViewController];

	[self setTitle:@"Player"];
	

	if (isPad()) {
	 
 
 
	}
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if (self = [self init]) {
		self.title = @"Player";
	
	
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
	 


-(void) playTutorial:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	NSString *list = @"mdsl.m4v";
	NSArray *listItems = [list componentsSeparatedByString:@"."];
	NSString *filepath   =   [[NSBundle mainBundle] pathForResource:[listItems objectAtIndex:0] ofType:[listItems lastObject]];  
    if (filepath) {
	    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];  
	    MPMoviePlayerController *myPlayerMoviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];  
		[myPlayerMoviePlayerController.view setFrame:CGRectMake(30, 120, 650, 370)]; 
		[[NSNotificationCenter defaultCenter] addObserver:self  
                                         selector:@selector(moviePlaybackComplete:)  
                                         name:MPMoviePlayerPlaybackDidFinishNotification  
                                         object:myPlayerMoviePlayerController];  
	    [self.view addSubview:myPlayerMoviePlayerController.view];  
	    [myPlayerMoviePlayerController play]; 
    }
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 



	
	
	//TODO implement playTutorial action
	
	
	
		
}
 
 

	 


 
 


-(void) displayInfo:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 


	//This is a navigation action  - test
	playerMDSLController *playerMDSLControllerInstance = [[playerMDSLController alloc] init];


	playerMDSLControllerInstance.parentController = self ;
	
	self.navigationController.navigationBar.hidden = NO;
	
		
	[self.navigationController pushViewController:playerMDSLControllerInstance animated:YES];
	[playerMDSLControllerInstance release];
	
	
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

		 
	[playTutorialButton release]; 
 
 
	[infoButton release]; 


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
