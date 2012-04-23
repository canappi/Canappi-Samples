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
#import "pickersViewController.h"
#import "pickersViewPickerController.h"
 
#import "pickersViewDatePickerController.h"
 
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "Reachability.h"
#import "RootController.h"
#import <EventKit/EventKit.h>




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



@implementation pickersViewController 


	@synthesize parentController ;
    @synthesize pickersViewIds ;
    @synthesize pickersViewValues ;

	 


	 
	// Layout : pickersLayout	 
	@synthesize myPickerPicker ;
	@synthesize myPickerPickerView ; 
	@synthesize myPickerPickerId ;  
	@synthesize myPickerArray ;
	@synthesize myPickerList ;
	@synthesize myPickerPickerActionSheet;
	@synthesize myPickerValuePicker ; 
	@synthesize myPickerQueryParameter ;
 
	@synthesize eventTitleTextField ;
	@synthesize eventTitleTextFieldId ;
	@synthesize eventTitleQueryParameter ;
 
	@synthesize myDatePickerDatePicker ; 
	@synthesize myDatePickerPickerButton ;
	@synthesize myDatePickerPickerDay ;
	@synthesize myDatePickerPickerTime ;
	@synthesize myDatePickerDatePickerActionSheet;	
	@synthesize myDatePickerValueDatePicker ;
	@synthesize myDatePickerQueryParameter ;
 
	@synthesize myCheckboxCheckBoxButton ;
	@synthesize myCheckboxCheckBoxLabel ;
	@synthesize myCheckboxSelected ;
	
	@synthesize myCheckboxQueryParameter ;
 
	@synthesize r1RadioButton ;
	@synthesize r1RadioButtonLabel ;	
	@synthesize r1QueryParameter ;
 
	@synthesize r2RadioButton ;
	@synthesize r2RadioButtonLabel ;	
	@synthesize r2QueryParameter ;
 
	@synthesize r3RadioButton ;
	@synthesize r3RadioButtonLabel ;	
	@synthesize r3QueryParameter ;
 
	@synthesize infoButton ;

	@synthesize radioButtons ;
	@synthesize radioButtonValues ;
	@synthesize radioButtonValue ;
	@synthesize currentPicker ;
	@synthesize pickersViewValuePickerPopover ;

	@synthesize currentDate ;
	@synthesize currentTime ;
	@synthesize pickersViewValueDatePickerPopover ;





-(NSMutableDictionary *) identities {
	return pickersViewIds ;
}

-(NSMutableDictionary *) values {
	return pickersViewValues ;
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
			 
    value = [myPickerPicker currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"myPicker"];	 
 
    value = eventTitleTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"eventTitle"];	 
	
 
    value = [NSString stringWithFormat:@"%@ %@",myDatePickerPickerDay.text,myDatePickerPickerTime.text,nil] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"myDatePicker"];	 
 
	if (myCheckboxSelected) value = @"1" ; else value = @"0" ;
	[[self values] setValue:value forKey:@"myCheckbox"];
 
	if (r1RadioButton.selected) { 
		value = @"1" ; 
		self.radioButtonValue = @"1" ;
	} else { 
		value = @"" ;
	}
	[[self values] setValue:value forKey:@"r1"];
 
	if (r2RadioButton.selected) { 
		value = @"2" ; 
		self.radioButtonValue = @"2" ;
	} else { 
		value = @"" ;
	}
	[[self values] setValue:value forKey:@"r2"];
 
	if (r3RadioButton.selected) { 
		value = @"3" ; 
		self.radioButtonValue = @"3" ;
	} else { 
		value = @"" ;
	}
	[[self values] setValue:value forKey:@"r3"];
 
    value = [infoButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"info"];	 
	[[self values] setValue:[NSString stringWithString:self.radioButtonValue] forKey:@"radioButtonValue"];
}



- (void)valueSelected:(NSString *)value {
    if (self.currentPicker != nil) { 
    	[self.currentPicker setTitle:value forState:UIControlStateNormal ] ;
    	self.currentPicker = nil ;
    }
    [self.pickersViewValuePickerPopover dismissPopoverAnimated:YES];
}

- (void)dateValueSelected:(id)sender {
    if (sender != nil) {
        NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        NSString *usFormatString = [NSDateFormatter dateFormatFromTemplate:@"EdMMM" options:0 locale:usLocale];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:usFormatString];
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setDateFormat:@"hh:mm a"];
        
        NSDate *dpDate = [sender date] ;
        
        [dateFormatter setDateFormat: @"yyyy-MM-dd"];
        [timeFormatter setDateFormat:@"HH:mm"];
        
        [self.currentDate setText:[dateFormatter stringFromDate:dpDate]];
        [self.currentTime setText:[timeFormatter stringFromDate:dpDate]];

        [dateFormatter release];
        [timeFormatter release] ;
        [usLocale release] ;
        
    }
        
    [self.pickersViewValueDatePickerPopover dismissPopoverAnimated:YES];
}

-(void) myCheckboxCheckBoxClicked:(id)sender { 
       
    myCheckboxSelected = !myCheckboxSelected;
    [myCheckboxCheckBoxButton setSelected:myCheckboxSelected] ;
    
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
	return [pickersViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [pickersViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[pickersViewIds setObject:identity forKey:name] ;
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
		
	
    [eventTitleTextField resignFirstResponder];
	
	
	
	
	
	
	
}


// This is where the view is composed programmatically
- (void)viewDidLoad {

	self.pickersViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.pickersViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	radioButtons = [[NSMutableArray alloc] initWithCapacity:5] ;
	radioButtonValues = [[NSMutableArray alloc] initWithCapacity:5] ;
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor whiteColor]
];

	
	
	myPickerPicker = [UIButton buttonWithType:UIButtonTypeCustom];
	[myPickerPicker setFrame:CGRectMake(50, 55, 200, 28)];
	[myPickerPicker setTitle:@"Pick a color" forState:UIControlStateNormal];
	[myPickerPicker setBackgroundImage:[UIImage imageNamed:@"picker.png"] forState:UIControlStateNormal];
	[myPickerPicker addTarget:self action:@selector(selectmyPickerPicker:) forControlEvents:UIControlEventTouchUpInside];	
	self.myPickerList = [[[NSMutableArray alloc] initWithCapacity:50] autorelease];
	[self.myPickerList addObject:@"blue"] ;
	[self.myPickerList addObject:@"white"] ;
	[self.myPickerList addObject:@"red"] ;
	[self.myPickerList addObject:@"green"] ;
	[self.myPickerList addObject:@"yellow"] ;
	
	[self.view addSubview:myPickerPicker];

	
	eventTitleTextField = [[UITextField alloc] init];	
	eventTitleTextField.delegate = self;
	eventTitleTextField.textAlignment = UITextAlignmentLeft;
	eventTitleTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[eventTitleTextField setFrame:CGRectMake(50, 100, 280, 30)];
	[eventTitleTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	eventTitleTextField.textColor = [UIColor blackColor];
	eventTitleTextField.backgroundColor = [UIColor whiteColor];
	eventTitleTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	eventTitleTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//eventTitleTextField.tag = 0;
	eventTitleTextField.placeholder = @"Enter the event title";
	eventTitleTextField.clearButtonMode = false;	
	[eventTitleTextField setBorderStyle:UITextBorderStyleRoundedRect] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(eventTitleTextField)]) { 
			UITextField * tzip = [parentController eventTitleTextField] ;
			eventTitleTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(eventTitleArray)]) { 
			NSString *value = (NSString *)[[parentController eventTitleArray] objectAtIndex:[parentController selectedRow]]  ;
			eventTitleTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"eventTitle"] ;	
		eventTitleTextField.text = value ;
		eventTitleTextFieldId = [self retrieveFromUserDefaultsFor:@"eventTitleId"] ; ;
		
	}
	[self.view addSubview:eventTitleTextField];
	


	myDatePickerPickerButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[myDatePickerPickerButton setFrame:CGRectMake(50, 140, 30, 30)] ;
	[myDatePickerPickerButton addTarget:self action:@selector(pickDateFormyDatePicker:) forControlEvents:UIControlEventTouchUpInside];	
	
	[myDatePickerPickerButton setBackgroundImage:[UIImage imageNamed:@"datepicker.png"] forState:UIControlStateNormal];
	[self.view addSubview:myDatePickerPickerButton];
	
    myDatePickerPickerDay = [[UITextField alloc] init]; myDatePickerPickerDay.placeholder = @"select date" ;
    myDatePickerPickerTime = [[UITextField alloc] init];
    
    [myDatePickerPickerDay setFrame:CGRectMake(50+35, 140, 130, 30)];
    [myDatePickerPickerTime setFrame:CGRectMake(50+170, 140, 90, 30)];
    [myDatePickerPickerDay setTextAlignment: UITextAlignmentCenter]; 
    [myDatePickerPickerTime setTextAlignment: UITextAlignmentCenter]; 
    [myDatePickerPickerDay setEnabled:NO];
    [myDatePickerPickerTime setEnabled:NO];
    myDatePickerPickerTime.delegate = self;
    myDatePickerPickerDay.delegate = self;
    
	[myDatePickerPickerDay setBorderStyle:UITextBorderStyleRoundedRect] ;
	[myDatePickerPickerTime setBorderStyle:UITextBorderStyleRoundedRect] ;
    
    [self.view addSubview:myDatePickerPickerDay];
    [self.view addSubview:myDatePickerPickerTime];
    [self.view addSubview:myDatePickerPickerButton];
 
	myCheckboxCheckBoxLabel = [[UILabel alloc] init];
	myCheckboxCheckBoxLabel.backgroundColor = [UIColor clearColor];
	[myCheckboxCheckBoxLabel setFrame:
	CGRectMake(80, 200, 100, 30)
];
	[myCheckboxCheckBoxLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	myCheckboxCheckBoxLabel.textColor = 	
	[UIColor blackColor]
;
	
	myCheckboxCheckBoxLabel.text = @"    checkbox";
	[self.view addSubview:myCheckboxCheckBoxLabel];
	
	UIImageView *myCheckboxCheckBoxButtonImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkbox.png"]];
	myCheckboxCheckBoxButtonImage.frame =  CGRectMake(0, 0, myCheckboxCheckBoxButtonImage.image.size.width, myCheckboxCheckBoxButtonImage.image.size.height);
	[myCheckboxCheckBoxButton addSubview:myCheckboxCheckBoxButtonImage];
	UIImageView *myCheckboxCheckBoxButtonSelectedImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkboxselected.png"]];
	myCheckboxCheckBoxButtonSelectedImage.frame =  CGRectMake(0, 0, myCheckboxCheckBoxButtonSelectedImage.image.size.width, myCheckboxCheckBoxButtonSelectedImage.image.size.height);
	[myCheckboxCheckBoxButton addSubview:myCheckboxCheckBoxButtonSelectedImage];

    myCheckboxCheckBoxButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myCheckboxCheckBoxButton.enabled = YES;
    myCheckboxSelected = NO ;
	[myCheckboxCheckBoxButton addTarget:self action:@selector(myCheckboxCheckBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
    myCheckboxCheckBoxButton.frame = 
	CGRectMake(50, 200, 32, 32)
;
    [myCheckboxCheckBoxButton setImage:myCheckboxCheckBoxButtonImage.image forState:UIControlStateNormal];
    [myCheckboxCheckBoxButton setImage:myCheckboxCheckBoxButtonSelectedImage.image forState:UIControlStateSelected];
	
	[self.view addSubview:myCheckboxCheckBoxButton];
 
	r1RadioButtonLabel = [[UILabel alloc] init];
	r1RadioButtonLabel.backgroundColor = [UIColor clearColor];
	[r1RadioButtonLabel setFrame:
	CGRectMake(80, 240, 100, 30)
];
	[r1RadioButtonLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	r1RadioButtonLabel.textColor = 	
	[UIColor blackColor]
;	
	r1RadioButtonLabel.text = @"    email";
	[self.view addSubview:r1RadioButtonLabel];
	
    r1RadioButton = [UIButton buttonWithType:UIButtonTypeCustom];

	[r1RadioButton setFrame:
	CGRectMake(50, 240, 32, 32)
];

	
	[r1RadioButton setBackgroundImage:[UIImage imageNamed:@"radiobutton.png"] forState:UIControlStateNormal];
	UIImage * r1ButtonSelectedImage = [UIImage imageNamed:@"radiobuttonselected.png"];
    [r1RadioButton setBackgroundImage:r1ButtonSelectedImage forState:UIControlStateSelected];
    [r1RadioButton setBackgroundImage:r1ButtonSelectedImage forState:UIControlStateHighlighted];

    r1RadioButton.enabled = YES;
    r1RadioButton.selected = YES;
    radioButtonValue = @"1" ;
    
    [radioButtons addObject:r1RadioButton] ;
    [radioButtonValues addObject:@"1"] ;
    
	[r1RadioButton addTarget:self action:@selector(radioButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
 	
	[self.view addSubview:r1RadioButton];
 
	r2RadioButtonLabel = [[UILabel alloc] init];
	r2RadioButtonLabel.backgroundColor = [UIColor clearColor];
	[r2RadioButtonLabel setFrame:
	CGRectMake(80, 280, 100, 30)
];
	[r2RadioButtonLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	r2RadioButtonLabel.textColor = 	
	[UIColor blackColor]
;	
	r2RadioButtonLabel.text = @"    phone";
	[self.view addSubview:r2RadioButtonLabel];
	
    r2RadioButton = [UIButton buttonWithType:UIButtonTypeCustom];

	[r2RadioButton setFrame:
	CGRectMake(50, 280, 32, 32)
];

	
	[r2RadioButton setBackgroundImage:[UIImage imageNamed:@"radiobutton.png"] forState:UIControlStateNormal];
	UIImage * r2ButtonSelectedImage = [UIImage imageNamed:@"radiobuttonselected.png"];
    [r2RadioButton setBackgroundImage:r2ButtonSelectedImage forState:UIControlStateSelected];
    [r2RadioButton setBackgroundImage:r2ButtonSelectedImage forState:UIControlStateHighlighted];

    r2RadioButton.enabled = YES;
    r2RadioButton.selected = NO;
    
    [radioButtons addObject:r2RadioButton] ;
    [radioButtonValues addObject:@"2"] ;
    
	[r2RadioButton addTarget:self action:@selector(radioButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
 	
	[self.view addSubview:r2RadioButton];
 
	r3RadioButtonLabel = [[UILabel alloc] init];
	r3RadioButtonLabel.backgroundColor = [UIColor clearColor];
	[r3RadioButtonLabel setFrame:
	CGRectMake(80, 320, 100, 30)
];
	[r3RadioButtonLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	r3RadioButtonLabel.textColor = 	
	[UIColor blackColor]
;	
	r3RadioButtonLabel.text = @"    sms";
	[self.view addSubview:r3RadioButtonLabel];
	
    r3RadioButton = [UIButton buttonWithType:UIButtonTypeCustom];

	[r3RadioButton setFrame:
	CGRectMake(50, 320, 32, 32)
];

	
	[r3RadioButton setBackgroundImage:[UIImage imageNamed:@"radiobutton.png"] forState:UIControlStateNormal];
	UIImage * r3ButtonSelectedImage = [UIImage imageNamed:@"radiobuttonselected.png"];
    [r3RadioButton setBackgroundImage:r3ButtonSelectedImage forState:UIControlStateSelected];
    [r3RadioButton setBackgroundImage:r3ButtonSelectedImage forState:UIControlStateHighlighted];

    r3RadioButton.enabled = YES;
    r3RadioButton.selected = NO;
    
    [radioButtons addObject:r3RadioButton] ;
    [radioButtonValues addObject:@"3"] ;
    
	[r3RadioButton addTarget:self action:@selector(radioButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
 	
	[self.view addSubview:r3RadioButton];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];		

	infoButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];

	[self didSelectViewController];

	[self setTitle:@"Pick"];
	

	 
 
 
 
 
 
 
 
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if (self = [self init]) {
		self.title = @"Pick";
	
	
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
	

-(void) selectmyPickerPicker:(id)sender { 

    if (isPad()) {
        if (self.myPickerValuePicker != nil) {
        	self.myPickerValuePicker = nil ;
        } 
        self.myPickerValuePicker = [[[pickersViewPickerController alloc] initWithStyle:UITableViewStylePlain] autorelease];
        [self.myPickerValuePicker setWidth:1.0*200 height:250.0] ;
        
        
        [self.myPickerValuePicker addValue:@"blue"]; 
        
        [self.myPickerValuePicker addValue:@"white"]; 
        
        [self.myPickerValuePicker addValue:@"red"]; 
        
        [self.myPickerValuePicker addValue:@"green"]; 
        
        [self.myPickerValuePicker addValue:@"yellow"]; 
        
        
        self.myPickerValuePicker.delegate = self;
        self.pickersViewValuePickerPopover = [[[UIPopoverController alloc] initWithContentViewController:myPickerValuePicker] autorelease];               
	    self.currentPicker = self.myPickerPicker ;
    	[self.pickersViewValuePickerPopover presentPopoverFromRect:CGRectMake(50, 55, 200, 28) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES] ;
    
    } else {
	    myPickerPickerActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	    
	    [myPickerPickerActionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
	    
	    if (! myPickerPickerView) {
		    myPickerPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, 0, 0)];
			myPickerPickerView.delegate = self;
			myPickerPickerView.dataSource = self;
			myPickerPickerView.showsSelectionIndicator = YES;
		}
	    
	    [myPickerPickerActionSheet addSubview:myPickerPickerView];
	    
	    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Close"]];
	    closeButton.momentary = YES; 
	    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
	    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	    closeButton.tintColor = [UIColor blackColor];
	    [closeButton addTarget:self action:@selector(dismissmyPickerPickerActionSheet:) forControlEvents:UIControlEventValueChanged];
	    [myPickerPickerActionSheet addSubview:closeButton];
	    [closeButton release];
	    
	    [myPickerPickerActionSheet showInView:self.view];
	    [myPickerPickerActionSheet setBounds:CGRectMake(0, 0, 320, 485)];
    }
}
	
 
- (void)dismissmyPickerPickerActionSheet:(id)sender {
    
    [myPickerPickerActionSheet dismissWithClickedButtonIndex:0 animated:YES];
    [myPickerPickerActionSheet release];
    myPickerPickerActionSheet = nil ;
   
}
 
 
	 
 



- (void) pickDateFormyDatePicker:(id)sender {

    if (isPad()) {
        if (self.myDatePickerValueDatePicker != nil) {
        	self.myDatePickerValueDatePicker = nil ;
        } 
        self.myDatePickerValueDatePicker = [[[pickersViewDatePickerController alloc] init] autorelease];
        [self.myDatePickerValueDatePicker setMode:0] ;
        
        self.myDatePickerValueDatePicker.delegate = self;
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:myDatePickerValueDatePicker];     
        self.pickersViewValueDatePickerPopover = [[[UIPopoverController alloc] initWithContentViewController:navigationController] autorelease];               
                
 	    self.currentDate = myDatePickerPickerDay ;
	    self.currentTime = myDatePickerPickerTime ;
    	[self.pickersViewValueDatePickerPopover presentPopoverFromRect:CGRectMake(50, 140, 280, 30) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES] ;
        [navigationController release] ;
    
    } else {

       myDatePickerDatePickerActionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                         delegate:nil
                                                cancelButtonTitle:nil
                                           destructiveButtonTitle:nil
                                                otherButtonTitles:nil];

        // Add the picker
        if (myDatePickerDatePicker == nil) {
        myDatePickerDatePicker = [[UIDatePicker alloc] init];
        myDatePickerDatePicker.datePickerMode = 	UIDatePickerModeDateAndTime	;
		}
        [myDatePickerDatePickerActionSheet addSubview:myDatePickerDatePicker];
        
        UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
	    closeButton.momentary = YES; 
	    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
	    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	    closeButton.tintColor = [UIColor blackColor];
	    [closeButton addTarget:self action:@selector(dismissmyDatePickerDatePickerActionSheet:) forControlEvents:UIControlEventValueChanged];
	    [myDatePickerDatePickerActionSheet addSubview:closeButton];
	    [closeButton release];
        
        
        [myDatePickerDatePickerActionSheet showInView:self.navigationController.tabBarController.view];
               
        [myDatePickerDatePickerActionSheet setBounds:CGRectMake(0,0,320, 516)];
        [myDatePickerDatePicker setFrame:CGRectMake(0, 85, 320, 216)];
		
		}
}


- (void)dismissmyDatePickerDatePickerActionSheet:(id)sender {
    
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSString *usFormatString = [NSDateFormatter dateFormatFromTemplate:@"EdMMM" options:0 locale:usLocale];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:usFormatString];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"hh:mm a"];
    
    NSDate *dpDate = [myDatePickerDatePicker date] ;

 	[self addEvent:myDatePickerDatePicker];
    
    myDatePickerPickerDay.text = [dateFormatter stringFromDate:dpDate];
    myDatePickerPickerTime.text = [timeFormatter stringFromDate:dpDate];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    [timeFormatter setDateFormat:@"HH:mm"];
    if (!myDatePickerDateTime){
    	myDatePickerDateTime = [[UITextField alloc] init];
    }
    if (!myDatePickerDateDay) {
    	myDatePickerDateDay = [[UITextField alloc] init];
    }
    myDatePickerDateDay.text = [dateFormatter stringFromDate:dpDate];
    myDatePickerDateTime.text = [timeFormatter stringFromDate:dpDate] ;
    
    NSLog(@"%@ %@",myDatePickerDateTime.text, myDatePickerDateDay.text,nil);    
    [myDatePickerDatePickerActionSheet dismissWithClickedButtonIndex:0 animated:YES];
    [myDatePickerDatePickerActionSheet release];
    [dateFormatter release];
    [timeFormatter release] ;
    
    
}


-(void) addEvent:(id)sender { 
	//TODO implemention myDatePickerDatePicker action
	EKEventStore *personalCalendar = [[EKEventStore alloc] init];
	
	EKEvent *event  = [EKEvent eventWithEventStore:personalCalendar];
	
	event.title     = eventTitleTextField.text;
	event.startDate = [sender date];
	NSTimeInterval seconds = 3600;
	event.endDate = [[sender date] dateByAddingTimeInterval:seconds];
	event.allDay = NO;	
	[event setCalendar:[personalCalendar defaultCalendarForNewEvents]];
	NSError *err;
	[personalCalendar saveEvent:event span:EKSpanThisEvent error:&err];
	
	if (err == noErr) {
		UIAlertView *alert = [[UIAlertView alloc]
		initWithTitle:event.title 
		message:@"has been added to your personal calendar"
		delegate:nil
		cancelButtonTitle:@"OK"
		otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
} 
 
 
-(void) radioButtonClicked:(id)sender { 
	BOOL selected = YES ;
	int v = -1 ;
	int s = 0 ;
    for (UIButton *radiobutton in radioButtons) {
          if ([radiobutton isKindOfClass:[UIButton class]] && ![radiobutton isEqual:sender]) {
               [radiobutton setSelected:NO];     
          }
          if ([radiobutton isEqual:sender]) v = s ;
          s++ ;
     }
     [sender setSelected:YES];
     if (v >= 0) { 
     	if (([radioButtonValues count]>0) && (v<[radioButtonValues count])) { 
     		radioButtonValue = (NSString *)[radioButtonValues objectAtIndex:v] ;
     	}
     }
} 
 
 
 


-(void) displayInfo:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 


	//This is a navigation action  - test
	pickersMDSLController *pickersMDSLControllerInstance = [[pickersMDSLController alloc] init];


	pickersMDSLControllerInstance.parentController = self ;
	
	self.navigationController.navigationBar.hidden = NO;
	
		
	[self.navigationController pushViewController:pickersMDSLControllerInstance animated:YES];
	[pickersMDSLControllerInstance release];
	
	
	//TODO implement displayInfo action
	
	
	
		
}



// No Gallery Here




//Has Picker
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
  {
 		return 1 ; 
        
  }



 -(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	if (pickerView == myPickerPickerView) {
        if (component == 0)
                return [myPickerList count]; 
     }


	return 0;
 
}

 -(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{
	if (pickerView == myPickerPickerView) {
        if (component == 0)
        return [myPickerList objectAtIndex:row] ;
     }

	
	return @"" ;

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
	if (pickerView == myPickerPickerView) {
	    // Handle the selection
	    if (row < [myPickerList count]) {
	        [myPickerPicker setTitle:[myPickerList objectAtIndex:row] forState:UIControlStateNormal];
	    }
	}
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 

}	

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

		 
	[myPickerPicker release]; 
 
	[eventTitleTextField release] ;
	[eventTitleTextFieldId release] ;
 
	[myDatePickerDatePicker release]; 
 
 
 
 
 
	[infoButton release]; 


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
