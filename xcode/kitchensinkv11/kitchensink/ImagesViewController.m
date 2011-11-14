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
#import "ImagesViewController.h"
 
 
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



@implementation ImagesViewController 

	@synthesize parentController ;
    @synthesize ImagesViewIds ;
    @synthesize ImagesViewValues ;

	 


	 
	// Layout : imageLayout	 
	@synthesize picture1Image ;
	@synthesize picture1Path ;
	
 
	@synthesize balsamiqLabel ; 
 
	@synthesize roundedPictureLabel ; 
 
	@synthesize picture2Image ;
	@synthesize picture2Path ;
	
 
	@synthesize infoButton ;





-(NSMutableDictionary *) identities {
	return ImagesViewIds ;
}

-(NSMutableDictionary *) values {
	return ImagesViewValues ;
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
			 
    if (picture1Path == nil) picture1Path = @"student.png" ;
	[[self values] setValue:picture1Path forKey:@"picture1"];
 
 
 
    if (picture2Path == nil) picture2Path = @"student.png" ;
	[[self values] setValue:picture2Path forKey:@"picture2"];
 
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
	return [ImagesViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [ImagesViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[ImagesViewIds setObject:identity forKey:name] ;
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

	self.ImagesViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.ImagesViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	 
	picture1Image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"picture1.png"]];
	picture1Path = @"picture1.png" ;
	
	
	picture1Image.frame =  CGRectMake(20, 60, 90, 190);
	

	NSString *picture1filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"picture1.png"]; 
	NSData *picture1data = [NSData dataWithContentsOfFile:picture1filePath];; 
    if (picture1data != nil) {
		UIImage *image = [UIImage imageWithData:picture1data];
		picture1Image.image = image;
	}

	[self.view addSubview:picture1Image];
 

	balsamiqLabel = [[UILabel alloc] init];
	balsamiqLabel.textAlignment = UITextAlignmentLeft;
	balsamiqLabel.backgroundColor = [UIColor clearColor];
	[balsamiqLabel setFrame:CGRectMake(180, 60, 120, 120)];
	[balsamiqLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
		
	balsamiqLabel.textColor = 	
	[UIColor whiteColor]
;
	balsamiqLabel.text = @"Canappi allows to create mdsl files directly from mockup tools!";
	[balsamiqLabel setLineBreakMode:UILineBreakModeWordWrap] ;
	balsamiqLabel.numberOfLines = 6;
	[self.view addSubview:balsamiqLabel];
 

	roundedPictureLabel = [[UILabel alloc] init];
	roundedPictureLabel.textAlignment = UITextAlignmentLeft;
	roundedPictureLabel.backgroundColor = [UIColor clearColor];
	[roundedPictureLabel setFrame:CGRectMake(180, 170, 120, 120)];
	[roundedPictureLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
		
	roundedPictureLabel.textColor = 	
	[UIColor whiteColor]
;
	roundedPictureLabel.text = @"A picture with Rounded Corners and a border";
	[roundedPictureLabel setLineBreakMode:UILineBreakModeWordWrap] ;
	roundedPictureLabel.numberOfLines = 6;
	[self.view addSubview:roundedPictureLabel];
 
	picture2Image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"picture2.png"]];
	picture2Path = @"picture2.png" ;
	
	CALayer * picture2ImageLayer = [picture2Image layer];
	[picture2ImageLayer setMasksToBounds:YES];
	[picture2ImageLayer setCornerRadius:8];
	[picture2Image.layer setBorderColor: [	
	[UIColor lightGrayColor]
 CGColor]];
	[picture2Image.layer setBorderWidth: 3];
	
	picture2Image.frame =  CGRectMake(20, 260, 280, 140);
	

	NSString *picture2filePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"picture2.png"]; 
	NSData *picture2data = [NSData dataWithContentsOfFile:picture2filePath];; 
    if (picture2data != nil) {
		UIImage *image = [UIImage imageWithData:picture2data];
		picture2Image.image = image;
	}

	[self.view addSubview:picture2Image];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		
	

	[infoButton setFrame:CGRectMake(280, 55, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	//[infoButton release];

	[self didSelectViewController];

	[self setTitle:@"Images"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
		self.title = @"Images";
	
	
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
	
//Action For Image 

 
		
 
		

//Action For Image 

 


-(void) displayInfo:(id)sender { 



	 

	 
	 
	  
	 
	 
	 

	[self saveValues] ;
	 

	//This is a navigation action  - test
	imagesMDSLController *imagesMDSLControllerInstance = [[imagesMDSLController alloc] init];

	imagesMDSLControllerInstance.parentController = self ;
	self.navigationController.navigationBar.hidden = NO;
	
	[self.navigationController pushViewController:imagesMDSLControllerInstance animated:YES];
	[imagesMDSLControllerInstance release];
	
		

} 





- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
		 
	[picture1Image release]; 
	[picture1Path release] ;
 
	[balsamiqLabel release] ; 
 
	[roundedPictureLabel release] ; 
 
	[picture2Image release]; 
	[picture2Path release] ;
 
	[infoButton release]; 

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
