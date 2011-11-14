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
#import "homeViewController.h"
 
 
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



@implementation homeViewController 

	@synthesize parentController ;
    @synthesize homeViewIds ;
    @synthesize homeViewValues ;

	 


	 
	// Layout : firstLevelMenu	 
	@synthesize buttonMenuTable ;  
	@synthesize buttonMenuTableIdArray ;
	@synthesize buttonMenuListOfItems ; 





-(NSMutableDictionary *) identities {
	return homeViewIds ;
}

-(NSMutableDictionary *) values {
	return homeViewValues ;
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
			 

}







-(NSString*)retrieveFromUserDefaultsFor:(NSString*)key
{
	if (key != nil) return [[[NSUserDefaults standardUserDefaults] objectForKey:key] retain];
	return @"";
}

-(NSString *) textValueForControl:(NSString *)name {
	return [homeViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [homeViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[homeViewIds setObject:identity forKey:name] ;
}





- (void)didSelectViewController {

	// Register the observer for the keyboardWillShow event
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];


		

	//This code is necessary to refresh the data when a tab is selected	

	
	[buttonMenuTable performSelectorOnMainThread:@selector( reloadData ) withObject:nil waitUntilDone:YES];		
	[buttonMenuTable performSelectorOnMainThread:@selector( setNeedsLayout ) withObject:nil waitUntilDone:YES];		
	[buttonMenuTable performSelectorOnMainThread:@selector( setNeedsDisplay ) withObject:nil waitUntilDone:YES];		
	
	
	
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

	self.homeViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.homeViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	
	
	
	

	 

	buttonMenuListOfItems = [[NSMutableArray alloc] init];
	
	[buttonMenuListOfItems addObject:@"Buttons"];
	[buttonMenuListOfItems addObject:@"Fonts"];
	[buttonMenuListOfItems addObject:@"Images"];
	[buttonMenuListOfItems addObject:@"Labels"];
	[buttonMenuListOfItems addObject:@"Maps"];
	[buttonMenuListOfItems addObject:@"Player"];
	[buttonMenuListOfItems addObject:@"Pickers"];
	[buttonMenuListOfItems addObject:@"Slider"];
	[buttonMenuListOfItems addObject:@"Table"];
	[buttonMenuListOfItems addObject:@"Text"];
	[buttonMenuListOfItems addObject:@"Browser"];
	[buttonMenuListOfItems addObject:@"Standard Actions"];

	if (isPad()) {
    	buttonMenuTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,768,912) style:UITableViewStylePlain];
    } else {
    	buttonMenuTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,320,368) style:UITableViewStylePlain];
	}
	buttonMenuTable.delegate = self;
	buttonMenuTable.dataSource = self;
	
	buttonMenuTable.rowHeight = 40;
	[self.view addSubview:buttonMenuTable];
	
	
	

	[self didSelectViewController];

	[self setTitle:@"Kitchen Sink"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
		self.title = @"Kitchen Sink";
	
		self.tabBarItem.image = [UIImage imageNamed:@"home.png"];
	
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
	 
	 
	 
	 




	
	
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return [buttonMenuListOfItems count];
	} else {
		NSInteger r = 0 ; 
		return r;
	}	
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId=@"customCellID";
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
	
	UIColor *linecolor = [UIColor whiteColor];
	
	if ((indexPath.row % 2) == 0) { 
		
		linecolor = [UIColor colorWithRed:0.3 green:1.0 blue:0.3 alpha:0.8];
		
	}	
	
	
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
    	cell.textLabel.text = [buttonMenuListOfItems objectAtIndex:indexPath.row];
			cell.accessoryType =  UITableViewCellAccessoryDetailDisclosureButton ;
		
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton ;
	}
	
	return cell;
}

-(void) buttonMenuReloadTable {
	[buttonMenuTable reloadData] ;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	if(indexPath.section == 0){
		
		switch (indexPath.row) {
			case 0 :{
				buttonViewController *buttonViewControllerInstance = [[buttonViewController alloc] init];
				buttonViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:buttonViewControllerInstance animated:YES];
				[buttonViewControllerInstance release];				
			}
			break;
			case 1 :{
				fontViewController *fontViewControllerInstance = [[fontViewController alloc] init];
				fontViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:fontViewControllerInstance animated:YES];
				[fontViewControllerInstance release];				
			}
			break;
			case 2 :{
				ImagesViewController *ImagesViewControllerInstance = [[ImagesViewController alloc] init];
				ImagesViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:ImagesViewControllerInstance animated:YES];
				[ImagesViewControllerInstance release];				
			}
			break;
			case 3 :{
				labelViewController *labelViewControllerInstance = [[labelViewController alloc] init];
				labelViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:labelViewControllerInstance animated:YES];
				[labelViewControllerInstance release];				
			}
			break;
			case 4 :{
				mapMenuViewController *mapMenuViewControllerInstance = [[mapMenuViewController alloc] init];
				mapMenuViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:mapMenuViewControllerInstance animated:YES];
				[mapMenuViewControllerInstance release];				
			}
			break;
			case 5 :{
				playerViewController *playerViewControllerInstance = [[playerViewController alloc] init];
				playerViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:playerViewControllerInstance animated:YES];
				[playerViewControllerInstance release];				
			}
			break;
			case 6 :{
				pickersViewController *pickersViewControllerInstance = [[pickersViewController alloc] init];
				pickersViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:pickersViewControllerInstance animated:YES];
				[pickersViewControllerInstance release];				
			}
			break;
			case 7 :{
				sliderViewController *sliderViewControllerInstance = [[sliderViewController alloc] init];
				sliderViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:sliderViewControllerInstance animated:YES];
				[sliderViewControllerInstance release];				
			}
			break;
			case 8 :{
				contactViewController *contactViewControllerInstance = [[contactViewController alloc] init];
				contactViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:contactViewControllerInstance animated:YES];
				[contactViewControllerInstance release];				
			}
			break;
			case 9 :{
				textEntryViewController *textEntryViewControllerInstance = [[textEntryViewController alloc] init];
				textEntryViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:textEntryViewControllerInstance animated:YES];
				[textEntryViewControllerInstance release];				
			}
			break;
			case 10 :{
				webMenuController *webMenuControllerInstance = [[webMenuController alloc] init];
				webMenuControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:webMenuControllerInstance animated:YES];
				[webMenuControllerInstance release];				
			}
			break;
			case 11 :{
				actionViewController *actionViewControllerInstance = [[actionViewController alloc] init];
				actionViewControllerInstance.parentController = self ;
				self.navigationController.navigationBar.hidden = NO;
				[self.navigationController pushViewController:actionViewControllerInstance animated:YES];
				[actionViewControllerInstance release];				
			}
			break;
			default:
			break;
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
		 
	[buttonMenuTable release] ;  

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
