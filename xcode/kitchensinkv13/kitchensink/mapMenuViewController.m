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
#import "mapMenuViewController.h"
 
 
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



@implementation mapMenuViewController 


	@synthesize parentController ;
    @synthesize mapMenuViewIds ;
    @synthesize mapMenuViewValues ;

	 


	 
	// Layout : mapLayout	 
	@synthesize mapMenuTable ;  
	@synthesize mapMenuTableIdArray ;
	@synthesize mapMenuListOfItems ; 







-(NSMutableDictionary *) identities {
	return mapMenuViewIds ;
}

-(NSMutableDictionary *) values {
	return mapMenuViewValues ;
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
	return [mapMenuViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [mapMenuViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[mapMenuViewIds setObject:identity forKey:name] ;
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



     
	 
			
			
			
		
	
		

	//This code is necessary to refresh the data when a tab is selected	

	
	[self performSelectorOnMainThread:@selector( viewReloadTable ) withObject:nil waitUntilDone:YES];		
	[mapMenuTable performSelectorOnMainThread:@selector( setNeedsLayout ) withObject:nil waitUntilDone:YES];		
	[mapMenuTable performSelectorOnMainThread:@selector( setNeedsDisplay ) withObject:nil waitUntilDone:YES];		
	
	
	
	

	
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

	self.mapMenuViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.mapMenuViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	
	
	
	
	

	 

	self.mapMenuListOfItems = [[[NSMutableArray alloc] initWithCapacity:16] autorelease] ;
	
	[mapMenuListOfItems addObject:@"Standard Map"];
	[mapMenuListOfItems addObject:@"Hybrid Map"];
	[mapMenuListOfItems addObject:@"Satellite Map"];
	
	if (isPad()) {
    	mapMenuTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,768,912) style:UITableViewStylePlain];
    } else {
    	mapMenuTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,320,368) style:UITableViewStylePlain];
	}
	mapMenuTable.delegate = self;
	mapMenuTable.dataSource = self;
	
	mapMenuTable.rowHeight = 40;
	[self.view addSubview:mapMenuTable];
	
	
	
		

	[self didSelectViewController];

	[self setTitle:@"Maps"];
	

	 
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if (self = [self init]) {
		self.title = @"Maps";
	
	
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
	 
	 
	 
	 


- (int)selectedRow {
	return currentTableSelectedRow ;
}

// No Gallery Here



	

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (tableView == mapMenuTable) {
		if (section == 0) {
			return [mapMenuListOfItems count];
		} else {
			NSInteger r = 0 ; 
			return r;
		}	
	}
	return 0 ;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    if (tableView == mapMenuTable) {
	    NSString *cellId=@"customCellID";
		UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
		
		UIColor *linecolor = [UIColor whiteColor];
		
		
		//if (cell == nil) {
			cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		//}	
	
		if(indexPath.section == 0) {
		
		
			NSInteger x = 0 ; 
			NSInteger y = 0 ;
			NSInteger width = 0 ;
			NSInteger height = 0 ;
			
			cell.exclusiveTouch = TRUE;
	    	cell.textLabel.text = [mapMenuListOfItems objectAtIndex:indexPath.row];
				cell.accessoryType =  UITableViewCellAccessoryNone ;
			
			cell.accessoryType = UITableViewCellAccessoryNone ;
		}
		
		return cell;
	}


	
	return nil ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


	if (tableView == mapMenuTable) {
		if(indexPath.section == 0){
			
			switch (indexPath.row) {
				case 0 :{
					belleViewController *belleViewControllerInstance = [[belleViewController alloc] init];
					belleViewControllerInstance.parentController = self ;
					self.navigationController.navigationBar.hidden = NO;
					[self.navigationController pushViewController:belleViewControllerInstance animated:YES];
					[belleViewControllerInstance release];				
				}
				break;
				case 1 :{
					westSamoaViewController *westSamoaViewControllerInstance = [[westSamoaViewController alloc] init];
					westSamoaViewControllerInstance.parentController = self ;
					self.navigationController.navigationBar.hidden = NO;
					[self.navigationController pushViewController:westSamoaViewControllerInstance animated:YES];
					[westSamoaViewControllerInstance release];				
				}
				break;
				case 2 :{
					parisViewController *parisViewControllerInstance = [[parisViewController alloc] init];
					parisViewControllerInstance.parentController = self ;
					self.navigationController.navigationBar.hidden = NO;
					[self.navigationController pushViewController:parisViewControllerInstance animated:YES];
					[parisViewControllerInstance release];				
				}
				break;
				default:
				break;
			}
			
		}
		
	}


}





-(void) viewReloadTable {

	if (mapMenuTable) [mapMenuTable reloadData] ;
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

		 
	[mapMenuTable release] ;  


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
