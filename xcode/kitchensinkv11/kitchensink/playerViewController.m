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
 
 
#import "JSON.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"


#import <MediaPlayer/MediaPlayer.h>  


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



@implementation playerViewController 

	@synthesize parentController ;
    @synthesize playerViewIds ;
    @synthesize playerViewValues ;

	 


	 
	// Layout : playerLayout	 
	@synthesize playTutorialButton ;
 
 
	@synthesize infoButton ;





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



-(void)saveValues
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
	if (key != nil) return [[[NSUserDefaults standardUserDefaults] objectForKey:key] retain];
	return @"";
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

	self.playerViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.playerViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	 
	NSString * const playTutorialButtonText = @"Play" ; 
	playTutorialButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	playTutorialButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	playTutorialButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	

	[playTutorialButton setFrame:CGRectMake(10, 50, 80, 30)];
	
	[playTutorialButton setTitle:playTutorialButtonText forState:UIControlStateNormal];
	//[playTutorialButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[playTutorialButton addTarget:self action:@selector(playTutorial:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:playTutorialButton];
	//[playTutorialButton release];
 
	
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		
	

	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	//[infoButton release];

	[self didSelectViewController];

	[self setTitle:@"Player"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
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



	 

	 
	NSString *list = @"mdsl.m4v";
	NSArray *listItems = [list componentsSeparatedByString:@"."];
	NSString *filepath   =   [[NSBundle mainBundle] pathForResource:[listItems objectAtIndex:0] ofType:[listItems lastObject]];  
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];  
    MPMoviePlayerController *myPlayerMoviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];  
	[myPlayerMoviePlayerController.view setFrame:CGRectMake(10, 90, 300, 300)]; 
	[[NSNotificationCenter defaultCenter] addObserver:self  
                                         selector:@selector(moviePlaybackComplete:)  
                                         name:MPMoviePlayerPlaybackDidFinishNotification  
                                         object:myPlayerMoviePlayerController];  
    [self.view addSubview:myPlayerMoviePlayerController.view];  
    [myPlayerMoviePlayerController play]; 
	 
	  
	 
	 
	 

	[self saveValues] ;
	 

	//TODO implement playTutorial action
	
	
		

} 
 
 


-(void) displayInfo:(id)sender { 



	 

	 
	 
	  
	 
	 
	 

	[self saveValues] ;
	 

	//This is a navigation action  - test
	playerMDSLController *playerMDSLControllerInstance = [[playerMDSLController alloc] init];

	playerMDSLControllerInstance.parentController = self ;
	self.navigationController.navigationBar.hidden = NO;
	
	[self.navigationController pushViewController:playerMDSLControllerInstance animated:YES];
	[playerMDSLControllerInstance release];
	
		

} 





- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
		 
	[playTutorialButton release]; 
 
 
	[infoButton release]; 

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
