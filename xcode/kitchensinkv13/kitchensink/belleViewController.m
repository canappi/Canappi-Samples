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
#import "belleViewController.h"
 
 
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "Reachability.h"
#import "RootController.h"

#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import "PushPinAnnotation.h"
//#import <MapKit/MKReverseGeocoder.h>



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



@implementation belleViewController 


	@synthesize parentController ;
    @synthesize belleViewIds ;
    @synthesize belleViewValues ;

	 


	 
	// Layout : bellevueLayout	 
	@synthesize myMapMapView ;  
	@synthesize latitudeQueryParameter ;
	@synthesize longitudeQueryParameter ;
	@synthesize titleQueryParameter ;
	@synthesize subtitleQueryParameter ;
 
	@synthesize toAddressTextField ;
	@synthesize toAddressTextFieldId ;
	@synthesize toAddressQueryParameter ;
 
	@synthesize directionsButton ;
 
	@synthesize infoButton ;







-(NSMutableDictionary *) identities {
	return belleViewIds ;
}

-(NSMutableDictionary *) values {
	return belleViewValues ;
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
			 
 
    value = toAddressTextField.text ;
    if (value == nil) value = @"451+University+Avenue+Palo+Alto+CA" ;
	[[self values] setValue:value forKey:@"toAddress"];	 
	
 
    value = [directionsButton currentTitle] ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"directions"];	 
 
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
	return [belleViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [belleViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[belleViewIds setObject:identity forKey:name] ;
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
		
	
    [toAddressTextField resignFirstResponder];
	
	
	
}


// This is where the view is composed programmatically
- (void)viewDidLoad {

	self.belleViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.belleViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	
	
	
	
	

	 
  	
  	myMapMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
  	
myMapMapView.showsUserLocation = YES;
  	
myMapMapView.mapType = MKMapTypeStandard;
  	
  	myMapMapView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);	
  	myMapMapView.delegate=self;
  	  	
  	[self.view addSubview:myMapMapView];

	
	toAddressTextField = [[UITextField alloc] init];	
	toAddressTextField.delegate = self;
	NSString * const toAddressDefaultText = @"451+University+Avenue+Palo+Alto+CA";
	toAddressTextField.text = toAddressDefaultText;
	toAddressTextField.textAlignment = UITextAlignmentLeft;
	toAddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[toAddressTextField setFrame:CGRectMake(-100, -100, 10, 10)];
	[toAddressTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	toAddressTextField.textColor = [UIColor blackColor];
	toAddressTextField.backgroundColor = [UIColor whiteColor];
	toAddressTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	toAddressTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//toAddressTextField.tag = 0;
	toAddressTextField.clearButtonMode = false;	
	[toAddressTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(toAddressTextField)]) { 
			UITextField * tzip = [parentController toAddressTextField] ;
			toAddressTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(toAddressArray)]) { 
			NSString *value = (NSString *)[[parentController toAddressArray] objectAtIndex:[parentController selectedRow]]  ;
			toAddressTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"toAddress"] ;	
		toAddressTextField.text = value ;
		toAddressTextFieldId = [self retrieveFromUserDefaultsFor:@"toAddressId"] ; ;
		
	}
	[self.view addSubview:toAddressTextField];
	
 
	NSString * const directionsButtonText = @"Directions" ; 
	directionsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	directionsButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
	// Button style Bordered
	directionsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	directionsButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[directionsButton setFrame:CGRectMake(20, 360, 100, 30)];
	
	[directionsButton setTitle:directionsButtonText forState:UIControlStateNormal];
	//[directionsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[directionsButton addTarget:self action:@selector(displayDrivingDirections:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:directionsButton];
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		

	infoButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];

	[self didSelectViewController];

	[self setTitle:@"Bellevue"];
	

	 
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=1.0;
	span.longitudeDelta=1.0;
	CLLocationCoordinate2D location = myMapMapView.userLocation.coordinate;
 
	location.latitude=47.6105556;
	location.longitude=-122.1994444;
	if (location.longitude>180.0) location.longitude = 180.0;
	if (location.longitude<-180.0) location.longitude = -180.0;
	if (location.latitude>90.0) location.latitude = 90.0;
	if (location.latitude<-90.0) location.latitude = -90.0;
	region.center=location;

	region.span=span; 
 
	[myMapMapView setRegion:region animated:TRUE];
	[myMapMapView regionThatFits:region];  	
	
  	
  	[self.view sendSubviewToBack:myMapMapView];
 
 
 
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if (self = [self init]) {
		self.title = @"Bellevue";
	
	
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
	 
 
	 
 


-(void) displayDrivingDirections:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	NSMutableString *displayDrivingDirectionsToAddress = [toAddressTextField.text mutableCopy] ;

	if (displayDrivingDirectionsToAddress == nil) { 
		if ([self respondsToSelector:@selector(toAddressQueryParameter)]) {
			displayDrivingDirectionsToAddress = [NSString stringWithString:(NSString *)self.toAddressQueryParameter] ;
		}
	}

	if (displayDrivingDirectionsToAddress != nil) {
NSLog(@"%@",displayDrivingDirectionsToAddress) ;    	    	double lat = myMapMapView.userLocation.location.coordinate.latitude;
    	double longi = myMapMapView.userLocation.location.coordinate.longitude;
    	NSString *slat = [NSString stringWithFormat:@"%f",lat] ;
    	NSString *slong = [NSString stringWithFormat:@"%f",longi] ;
        NSMutableString *mapUrl = [NSMutableString stringWithFormat:@"http://maps.google.com/maps?daddr=%@&saddr=%@,%@",[displayDrivingDirectionsToAddress stringByReplacingOccurrencesOfString:@" " withString:@"+"],slat,slong,nil] ;
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mapUrl]] ;
    }	 
	 



	
	
	//TODO implement displayDrivingDirections action
	
	
	
		
}
 


-(void) displayInfo:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 


	//This is a navigation action  - test
	standardMapMDSLController *standardMapMDSLControllerInstance = [[standardMapMDSLController alloc] init];


	standardMapMDSLControllerInstance.parentController = self ;
	
	self.navigationController.navigationBar.hidden = NO;
	
		
	[self.navigationController pushViewController:standardMapMDSLControllerInstance animated:YES];
	[standardMapMDSLControllerInstance release];
	
	
	//TODO implement displayInfo action
	
	
	
		
}



// No Gallery Here



/*
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error{
	NSLog(@"Reverse Geocoder Errored");
 
}
 
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark{
	NSLog(@"Reverse Geocoder completed");
	//mPlacemark=placemark;
	//TODO [mapView addAnnotation:placemark];
}
 
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
	MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
	annView.animatesDrop=TRUE;
	return annView;
}
*/


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	
    


}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];

				
    [self.myMapMapView setDelegate:nil];
	
	
	

	
    
}	

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.

		 
 
	[toAddressTextField release] ;
	[toAddressTextFieldId release] ;
 
	[directionsButton release]; 
 
	[infoButton release]; 


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
