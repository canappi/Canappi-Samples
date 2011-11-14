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
 
#import "JSON.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import <EventKit/EventKit.h>




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



@implementation pickersViewController 

	@synthesize parentController ;
    @synthesize pickersViewIds ;
    @synthesize pickersViewValues ;

	 


	 
	// Layout : pickersLayout	 
	@synthesize myPickerPicker ;
	@synthesize myPickerPickerView ; 
	@synthesize myPickerPickerId ;  
	@synthesize myPickerList ;
	@synthesize myPickerPickerActionSheet;
	@synthesize myPickerValuePicker ; 
 
	@synthesize eventTitleTextField ;
	@synthesize eventTitleTextFieldId ;
 
	@synthesize myDatePickerDatePicker ; 
	@synthesize myDatePickerPickerButton ;
	@synthesize myDatePickerPickerDay ;
	@synthesize myDatePickerPickerTime ;
	@synthesize myDatePickerDatePickerActionSheet;	
	@synthesize myDatePickerValueDatePicker ;
 
	@synthesize myCheckboxCheckBoxButton ;
	@synthesize myCheckboxCheckBoxLabel ;
	@synthesize myCheckboxSelected ;
	
 
	@synthesize r1RadioButton ;
	@synthesize r1RadioButtonLabel ;	
 
	@synthesize r2RadioButton ;
	@synthesize r2RadioButtonLabel ;	
 
	@synthesize r3RadioButton ;
	@synthesize r3RadioButtonLabel ;	
 
	@synthesize infoButton ;

	@synthesize radioButtons ;
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



-(void)saveValues
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
 
	if (r1RadioButton.selected) value = @"1" ; else value = @"0" ;
	[[self values] setValue:value forKey:@"r1"];
 
	if (r2RadioButton.selected) value = @"1" ; else value = @"0" ;
	[[self values] setValue:value forKey:@"r2"];
 
	if (r3RadioButton.selected) value = @"1" ; else value = @"0" ;
	[[self values] setValue:value forKey:@"r3"];
 
    value = [infoButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"info"];	 

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
        
    }
        
    [self.pickersViewValueDatePickerPopover dismissPopoverAnimated:YES];
}

-(void) myCheckboxCheckBoxClicked:(id)sender { 
       
    myCheckboxSelected = !myCheckboxSelected;
    [myCheckboxCheckBoxButton setSelected:myCheckboxSelected] ;
    
} 


-(NSString*)retrieveFromUserDefaultsFor:(NSString*)key
{
	if (key != nil) return [[[NSUserDefaults standardUserDefaults] objectForKey:key] retain];
	return @"";
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	self.pickersViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.pickersViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	radioButtons = [[NSMutableArray alloc] initWithCapacity:50] ;
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor whiteColor]
];

	
	
	myPickerPicker = [UIButton buttonWithType:UIButtonTypeCustom];
	[myPickerPicker setFrame:CGRectMake(50, 55, 200, 28)];
	[myPickerPicker setTitle:@"Pick a color" forState:UIControlStateNormal];
	[myPickerPicker setBackgroundImage:[UIImage imageNamed:@"picker.png"] forState:UIControlStateNormal];
	[myPickerPicker addTarget:self action:@selector(selectmyPickerPicker:) forControlEvents:UIControlEventTouchUpInside];	
	self.myPickerList = [[NSMutableArray alloc] initWithCapacity:50] ;
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
		}}
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
    
    [radioButtons addObject:r1RadioButton] ;
    
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
    
	[r3RadioButton addTarget:self action:@selector(radioButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
 	
	[self.view addSubview:r3RadioButton];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		
	

	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	//[infoButton release];

	[self didSelectViewController];

	[self setTitle:@"Pick"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
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
        if (myPickerValuePicker == nil) {
        	[myPickerValuePicker release] ;
        	myPickerValuePicker = nil ;
        } 
        self.myPickerValuePicker = [[[pickersViewPickerController alloc] initWithStyle:UITableViewStylePlain] autorelease];
        [myPickerValuePicker setWidth:1.0*200 height:250.0] ;
        
        
        [myPickerValuePicker addValue:@"blue"]; 
        
        [myPickerValuePicker addValue:@"white"]; 
        
        [myPickerValuePicker addValue:@"red"]; 
        
        [myPickerValuePicker addValue:@"green"]; 
        
        [myPickerValuePicker addValue:@"yellow"]; 
        
        
        myPickerValuePicker.delegate = self;
        self.pickersViewValuePickerPopover = [[[UIPopoverController alloc] initWithContentViewController:myPickerValuePicker] autorelease];               
	    self.currentPicker = myPickerPicker ;
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
   
}
 
 
	 
 



- (void) pickDateFormyDatePicker:(id)sender {

    if (isPad()) {
        if (myDatePickerValueDatePicker == nil) {
        	[myDatePickerValueDatePicker release] ;
        	myDatePickerValueDatePicker = nil ;
        } 
        self.myDatePickerValueDatePicker = [[[pickersViewDatePickerController alloc] init] autorelease];
        [myDatePickerValueDatePicker setMode:0] ;
        
        myDatePickerValueDatePicker.delegate = self;
        
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
    for (UIButton *Radiobutton in radioButtons) {
          if ([Radiobutton isKindOfClass:[UIButton class]] && ![Radiobutton isEqual:sender]) {
               [Radiobutton setSelected:NO];
          }
     }
     [sender setSelected:YES];
} 
 
 
 


-(void) displayInfo:(id)sender { 



	 

	 
	 
	  
	 
	 
	 

	[self saveValues] ;
	 

	//This is a navigation action  - test
	pickersMDSLController *pickersMDSLControllerInstance = [[pickersMDSLController alloc] init];

	pickersMDSLControllerInstance.parentController = self ;
	self.navigationController.navigationBar.hidden = NO;
	
	[self.navigationController pushViewController:pickersMDSLControllerInstance animated:YES];
	[pickersMDSLControllerInstance release];
	
		

} 




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

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
		 
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
