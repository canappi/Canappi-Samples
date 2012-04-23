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



@implementation ImagesViewController 


	@synthesize parentController ;
    @synthesize ImagesViewIds ;
    @synthesize ImagesViewValues ;

	 


	 
	// Layout : imageLayout	 
	@synthesize picture1Image ;
	@synthesize picture1Path ;
	
	@synthesize picture1QueryParameter ;
 
	@synthesize balsamiqLabel ; 
 
	@synthesize roundedPictureLabel ; 
 
	@synthesize picture2Image ;
	@synthesize picture2Path ;
	
	@synthesize picture2QueryParameter ;
 
	@synthesize infoButton ;
	 
	// Layout : imageLayoutIPad	 
 
 
 
 
	@synthesize mdslWebView ;  







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
			 
    if (picture1Path == nil) picture1Path = @"default.png" ;
	[[self values] setValue:picture1Path forKey:@"picture1"];
 
 
 
    if (picture2Path == nil) picture2Path = @"default.png" ;
	[[self values] setValue:picture2Path forKey:@"picture2"];
 
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
	return [ImagesViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [ImagesViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[ImagesViewIds setObject:identity forKey:name] ;
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

	self.ImagesViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.ImagesViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	if (isPad()) {
		 
	picture1Image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"picture1.png"]];
	picture1Path = @"picture1.png" ;
	
	
	picture1Image.frame =  CGRectMake(20, 60, 90, 190);
	

	NSString *picture1filePath = [[NSBundle mainBundle] pathForResource:@"picture1" ofType:@"png"] ;
	//[[self getDocumentDirectory] stringByAppendingPathComponent:@"picture1.png"]; 
	NSData *picture1data = [NSData dataWithContentsOfFile:picture1filePath];; 
    if (picture1data != nil) {
		UIImage *image = [UIImage imageWithData:picture1data];
		picture1Image.image = image;
	}

	[self.view addSubview:picture1Image];
 

	balsamiqLabel = [[UILabel alloc] init];
	balsamiqLabel.textAlignment = UITextAlignmentLeft;
	balsamiqLabel.backgroundColor = [UIColor clearColor];
	UIFont *balsamiqLabelFont = [UIFont fontWithName:@"Helvetica" size:14];
	[balsamiqLabel setFont:balsamiqLabelFont] ;

	balsamiqLabel.text = @"Canappi allows to create mdsl files directly from mockup tools!";
	
	[balsamiqLabel setFrame:CGRectMake(180, 60, 120, 120)];
		
	balsamiqLabel.textColor = 	
	[UIColor whiteColor]
;
	[balsamiqLabel setLineBreakMode:UILineBreakModeWordWrap] ;
	balsamiqLabel.numberOfLines = 6;
	[self.view addSubview:balsamiqLabel];
 

	roundedPictureLabel = [[UILabel alloc] init];
	roundedPictureLabel.textAlignment = UITextAlignmentLeft;
	roundedPictureLabel.backgroundColor = [UIColor clearColor];
	UIFont *roundedPictureLabelFont = [UIFont fontWithName:@"Helvetica" size:14];
	[roundedPictureLabel setFont:roundedPictureLabelFont] ;

	roundedPictureLabel.text = @"A picture with Rounded Corners and a border";
	
	[roundedPictureLabel setFrame:CGRectMake(180, 170, 120, 120)];
		
	roundedPictureLabel.textColor = 	
	[UIColor whiteColor]
;
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
	

	NSString *picture2filePath = [[NSBundle mainBundle] pathForResource:@"picture2" ofType:@"png"] ;
	//[[self getDocumentDirectory] stringByAppendingPathComponent:@"picture2.png"]; 
	NSData *picture2data = [NSData dataWithContentsOfFile:picture2filePath];; 
    if (picture2data != nil) {
		UIImage *image = [UIImage imageWithData:picture2data];
		picture2Image.image = image;
	}

	[self.view addSubview:picture2Image];

  	mdslWebView = [[UIWebView alloc] initWithFrame:CGRectMake(350, 45, 350, 500)];

 	NSString *mdslUrlAddress = @"http://www.canappi.com/ks/images.html";
	NSURL *mdslUrl = [NSURL URLWithString:mdslUrlAddress];
	NSURLRequest *mdslRequestObj = [NSURLRequest requestWithURL:mdslUrl];
	[mdslWebView loadRequest:mdslRequestObj]; 
	[self.view addSubview:mdslWebView];
	} else {
		 
	picture1Image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"picture1.png"]];
	picture1Path = @"picture1.png" ;
	
	
	picture1Image.frame =  CGRectMake(20, 60, 90, 190);
	

	NSString *picture1filePath = [[NSBundle mainBundle] pathForResource:@"picture1" ofType:@"png"] ;
	//[[self getDocumentDirectory] stringByAppendingPathComponent:@"picture1.png"]; 
	NSData *picture1data = [NSData dataWithContentsOfFile:picture1filePath];; 
    if (picture1data != nil) {
		UIImage *image = [UIImage imageWithData:picture1data];
		picture1Image.image = image;
	}

	[self.view addSubview:picture1Image];
 

	balsamiqLabel = [[UILabel alloc] init];
	balsamiqLabel.textAlignment = UITextAlignmentLeft;
	balsamiqLabel.backgroundColor = [UIColor clearColor];
	UIFont *balsamiqLabelFont = [UIFont fontWithName:@"Helvetica" size:14];
	[balsamiqLabel setFont:balsamiqLabelFont] ;

	balsamiqLabel.text = @"Canappi allows to create mdsl files directly from mockup tools!";
	
	[balsamiqLabel setFrame:CGRectMake(180, 60, 120, 120)];
		
	balsamiqLabel.textColor = 	
	[UIColor whiteColor]
;
	[balsamiqLabel setLineBreakMode:UILineBreakModeWordWrap] ;
	balsamiqLabel.numberOfLines = 6;
	[self.view addSubview:balsamiqLabel];
 

	roundedPictureLabel = [[UILabel alloc] init];
	roundedPictureLabel.textAlignment = UITextAlignmentLeft;
	roundedPictureLabel.backgroundColor = [UIColor clearColor];
	UIFont *roundedPictureLabelFont = [UIFont fontWithName:@"Helvetica" size:14];
	[roundedPictureLabel setFont:roundedPictureLabelFont] ;

	roundedPictureLabel.text = @"A picture with Rounded Corners and a border";
	
	[roundedPictureLabel setFrame:CGRectMake(180, 170, 120, 120)];
		
	roundedPictureLabel.textColor = 	
	[UIColor whiteColor]
;
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
	

	NSString *picture2filePath = [[NSBundle mainBundle] pathForResource:@"picture2" ofType:@"png"] ;
	//[[self getDocumentDirectory] stringByAppendingPathComponent:@"picture2.png"]; 
	NSData *picture2data = [NSData dataWithContentsOfFile:picture2filePath];; 
    if (picture2data != nil) {
		UIImage *image = [UIImage imageWithData:picture2data];
		picture2Image.image = image;
	}

	[self.view addSubview:picture2Image];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		

	infoButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[infoButton setFrame:CGRectMake(280, 55, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	}

	[self didSelectViewController];

	[self setTitle:@"Images"];
	

	if (isPad()) {
	 
 
 
 
 
	}
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if (self = [self init]) {
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

 

	
//Action For Image 

 
		
 
		

//Action For Image 

 


-(void) displayInfo:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 


	//This is a navigation action  - test
	imagesMDSLController *imagesMDSLControllerInstance = [[imagesMDSLController alloc] init];


	imagesMDSLControllerInstance.parentController = self ;
	
	self.navigationController.navigationBar.hidden = NO;
	
		
	[self.navigationController pushViewController:imagesMDSLControllerInstance animated:YES];
	[imagesMDSLControllerInstance release];
	
	
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

		 
	[picture1Image release];  picture1Image = nil ;
	[picture1Path release] ; picture1Path = nil ;
	
	
 
	[balsamiqLabel release] ; 
 
	[roundedPictureLabel release] ; 
 
	[picture2Image release];  picture2Image = nil ;
	[picture2Path release] ; picture2Path = nil ;
	
	
 
	[infoButton release]; 


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
