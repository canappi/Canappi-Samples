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
#import "detailViewController.h"
 
 
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



@implementation detailViewController 

	@synthesize parentController ;
    @synthesize detailViewIds ;
    @synthesize detailViewValues ;

	 

    	// Connection contacts
         
        	


	 
	// Layout : contactRow	 
	@synthesize countryLabel ; 
 
	@synthesize nameLabel ; 
 
	@synthesize positionLabel ; 
 
	@synthesize emailLabel ; 
 
	@synthesize mobileLabel ; 
 
	@synthesize pictureImage ;
	@synthesize picturePath ;
	




     
         
- (void)fetchDataFromcontacts {

	NSString *docDirectory = [self getDocumentDirectory];
	NSString *filePath = [docDirectory stringByAppendingString:@"contacts.json"];
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
	
	if (fileExists) {
		//Init from file
		NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	} else {
		//Init from embedded data source
			//Processing country
				

			//Processing name
				

			//Processing position
				

			//Processing email
				

			//Processing mobile
				

			//Processing picture
				

	}
}


        


-(NSMutableDictionary *) identities {
	return detailViewIds ;
}

-(NSMutableDictionary *) values {
	return detailViewValues ;
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
			 
 
 
 
 
 
    if (picturePath == nil) picturePath = @"student.png" ;
	[[self values] setValue:picturePath forKey:@"picture"];

}







-(NSString*)retrieveFromUserDefaultsFor:(NSString*)key
{
	if (key != nil) return [[[NSUserDefaults standardUserDefaults] objectForKey:key] retain];
	return @"";
}

-(NSString *) textValueForControl:(NSString *)name {
	return [detailViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [detailViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[detailViewIds setObject:identity forKey:name] ;
}





- (void)didSelectViewController {

	// Register the observer for the keyboardWillShow event
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];


	[self fetchDataFromcontacts] ;
	
	
		
		

	
	
	
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

	self.detailViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.detailViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor groupTableViewBackgroundColor]
];

	 

	countryLabel = [[UILabel alloc] init];
	countryLabel.textAlignment = UITextAlignmentLeft;
	countryLabel.backgroundColor = [UIColor clearColor];
	[countryLabel setFrame:CGRectMake(5, 5, 80, 30)];
	[countryLabel setFont:[UIFont fontWithName:@"Helvetica" size:8]];
		
	countryLabel.textColor = [UIColor blackColor];
	countryLabel.text = @"country";
	[self.view addSubview:countryLabel];
 

	nameLabel = [[UILabel alloc] init];
	nameLabel.textAlignment = UITextAlignmentLeft;
	nameLabel.backgroundColor = [UIColor clearColor];
	[nameLabel setFrame:CGRectMake(5, 30, 280, 30)];
	[nameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
		
	nameLabel.textColor = [UIColor blackColor];
	nameLabel.text = @"name";
	[self.view addSubview:nameLabel];
 

	positionLabel = [[UILabel alloc] init];
	positionLabel.textAlignment = UITextAlignmentLeft;
	positionLabel.backgroundColor = [UIColor clearColor];
	[positionLabel setFrame:CGRectMake(5, 60, 280, 30)];
	[positionLabel setFont:[UIFont fontWithName:@"Helvetica" size:8]];
		
	positionLabel.textColor = [UIColor blackColor];
	positionLabel.text = @"position";
	[self.view addSubview:positionLabel];
 

	emailLabel = [[UILabel alloc] init];
	emailLabel.textAlignment = UITextAlignmentLeft;
	emailLabel.backgroundColor = [UIColor clearColor];
	[emailLabel setFrame:CGRectMake(5, 90, 280, 30)];
	[emailLabel setFont:[UIFont fontWithName:@"Helvetica" size:8]];
		
	emailLabel.textColor = [UIColor blackColor];
	emailLabel.text = @"email";
	[self.view addSubview:emailLabel];
 

	mobileLabel = [[UILabel alloc] init];
	mobileLabel.textAlignment = UITextAlignmentLeft;
	mobileLabel.backgroundColor = [UIColor clearColor];
	[mobileLabel setFrame:CGRectMake(5, 120, 280, 30)];
	[mobileLabel setFont:[UIFont fontWithName:@"Helvetica" size:8]];
		
	mobileLabel.textColor = [UIColor blackColor];
	mobileLabel.text = @"mobile";
	[self.view addSubview:mobileLabel];
 
	pictureImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arno.png"]];
	picturePath = @"arno.png" ;
	
	CALayer * pictureImageLayer = [pictureImage layer];
	[pictureImageLayer setMasksToBounds:YES];
	[pictureImageLayer setCornerRadius:8.0];
	
	pictureImage.frame =  CGRectMake(200, 15, 80, 100);
	

	NSString *picturefilePath = [[self getDocumentDirectory] stringByAppendingPathComponent:@"arno.png"]; 
	NSData *picturedata = [NSData dataWithContentsOfFile:picturefilePath];; 
    if (picturedata != nil) {
		UIImage *image = [UIImage imageWithData:picturedata];
		pictureImage.image = image;
	}

	[self.view addSubview:pictureImage];

	[self didSelectViewController];

	[self setTitle:@"Contact"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
		self.title = @"Contact";
	
	
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






- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
		 
	[countryLabel release] ; 
 
	[nameLabel release] ; 
 
	[positionLabel release] ; 
 
	[emailLabel release] ; 
 
	[mobileLabel release] ; 
 
	[pictureImage release]; 
	[picturePath release] ;

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
