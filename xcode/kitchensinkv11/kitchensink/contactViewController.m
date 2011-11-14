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
#import "contactViewController.h"
 
 
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



@implementation contactViewController 

	@synthesize parentController ;
    @synthesize contactViewIds ;
    @synthesize contactViewValues ;

	 

    	// Connection contacts
         
        	


	 
	// Layout : contactLayout	 
	@synthesize contactsTable ;  
	@synthesize contactsTableIdArray ;
	@synthesize contactsListOfItems ; 
	 
	@synthesize countryArray ; 
 
	@synthesize nameArray ; 
 
	@synthesize positionArray ; 
 
	@synthesize emailArray ; 
 
	@synthesize mobileArray ; 
 
	@synthesize pictureArray ; 




     
         
- (void)fetchDataFromcontacts {

	NSString *docDirectory = [self getDocumentDirectory];
	NSString *filePath = [docDirectory stringByAppendingString:@"contacts.json"];
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
	
	if (fileExists) {
		//Init from file
		NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	} else {
		//Init from embedded data source
				//Initializing contacts
				//Processing country
					
		countryArray = [[NSMutableArray alloc] initWithCapacity:10];
				    //country :: country
					[countryArray addObject:@"Germany"];

				//Processing name
					
		nameArray = [[NSMutableArray alloc] initWithCapacity:10];
				    //name :: name
					[nameArray addObject:@"Arno RŸbel"];

				//Processing position
					
		positionArray = [[NSMutableArray alloc] initWithCapacity:10];
				    //position :: position
					[positionArray addObject:@"Director of Quality"];

				//Processing email
					
		emailArray = [[NSMutableArray alloc] initWithCapacity:10];
				    //email :: email
					[emailArray addObject:@"arno@canappi.com"];

				//Processing mobile
					
		mobileArray = [[NSMutableArray alloc] initWithCapacity:10];
				    //mobile :: mobile
					[mobileArray addObject:@"+49 1234-5678"];

				//Processing picture
					
		pictureArray = [[NSMutableArray alloc] initWithCapacity:10];
				    //picture :: picture
					[pictureArray addObject:@"http://www.canappi.com/arno.png"];

	}
}


        


-(NSMutableDictionary *) identities {
	return contactViewIds ;
}

-(NSMutableDictionary *) values {
	return contactViewValues ;
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
	return [contactViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [contactViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[contactViewIds setObject:identity forKey:name] ;
}





- (void)didSelectViewController {

	// Register the observer for the keyboardWillShow event
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];


	[self fetchDataFromcontacts] ;
	
	
		
		

	//This code is necessary to refresh the data when a tab is selected	

	
	[contactsTable performSelectorOnMainThread:@selector( reloadData ) withObject:nil waitUntilDone:YES];		
	[contactsTable performSelectorOnMainThread:@selector( setNeedsLayout ) withObject:nil waitUntilDone:YES];		
	[contactsTable performSelectorOnMainThread:@selector( setNeedsDisplay ) withObject:nil waitUntilDone:YES];		
	
	
	
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

	self.contactViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.contactViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor scrollViewTexturedBackgroundColor]
];

	 


	if (isPad()) {
    	contactsTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,768,912) style:UITableViewStylePlain];
    } else {
    	contactsTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,320,368) style:UITableViewStylePlain];
	}
	contactsTable.delegate = self;
	contactsTable.dataSource = self;
	
	contactsTable.rowHeight = 205;
	[self.view addSubview:contactsTable];
	
	
	

	[self didSelectViewController];

	[self setTitle:@"Contacts"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
		self.title = @"Contacts";
	
	
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

 
	 
	 




	
	
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
				
	return [countryArray count];  
						
				
				
				
				
				
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId=@"customCellID";
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
	
	UIColor *linecolor = [UIColor whiteColor];
	
	
	//if (cell == nil) {
		cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	//}	

	if(indexPath.section == 0) {
	
	
		
		NSInteger x = 0 ; 
		NSInteger y = 0 ;
		NSInteger width = 0 ;
		NSInteger height = 0 ;
		
		x = 5 ; 
		y = 5 ;
		width = 80 ;
		height = 30 ;
		
		//
		UILabel *cellLabel00 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel00.backgroundColor = [UIColor clearColor];
		
		cellLabel00.textColor = [UIColor blackColor]; 
		
		
		cellLabel00.font = [UIFont fontWithName:@"Helvetica" size:8]; 
		if (indexPath.row<[countryArray count]) cellLabel00.text = [countryArray objectAtIndex:indexPath.row];
		[cell.contentView addSubview:cellLabel00];
		x = 5 ; 
		y = 30 ;
		width = 280 ;
		height = 30 ;
		
		//
		UILabel *cellLabel01 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel01.backgroundColor = [UIColor clearColor];
		
		cellLabel01.textColor = [UIColor blackColor]; 
		
		
		cellLabel01.font = [UIFont fontWithName:@"Helvetica-Bold" size:12]; 
		if (indexPath.row<[nameArray count]) cellLabel01.text = [nameArray objectAtIndex:indexPath.row];
		[cell.contentView addSubview:cellLabel01];
		x = 5 ; 
		y = 60 ;
		width = 280 ;
		height = 30 ;
		
		//
		UILabel *cellLabel02 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel02.backgroundColor = [UIColor clearColor];
		
		cellLabel02.textColor = [UIColor blackColor]; 
		
		
		cellLabel02.font = [UIFont fontWithName:@"Helvetica" size:8]; 
		if (indexPath.row<[positionArray count]) cellLabel02.text = [positionArray objectAtIndex:indexPath.row];
		[cell.contentView addSubview:cellLabel02];
		x = 5 ; 
		y = 90 ;
		width = 280 ;
		height = 30 ;
		
		//
		UILabel *cellLabel03 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel03.backgroundColor = [UIColor clearColor];
		
		cellLabel03.textColor = [UIColor blackColor]; 
		
		
		cellLabel03.font = [UIFont fontWithName:@"Helvetica" size:8]; 
		if (indexPath.row<[emailArray count]) cellLabel03.text = [emailArray objectAtIndex:indexPath.row];
		[cell.contentView addSubview:cellLabel03];
		x = 5 ; 
		y = 120 ;
		width = 280 ;
		height = 30 ;
		
		//
		UILabel *cellLabel04 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel04.backgroundColor = [UIColor clearColor];
		
		cellLabel04.textColor = [UIColor blackColor]; 
		
		
		cellLabel04.font = [UIFont fontWithName:@"Helvetica" size:8]; 
		if (indexPath.row<[mobileArray count]) cellLabel04.text = [mobileArray objectAtIndex:indexPath.row];
		[cell.contentView addSubview:cellLabel04];
		
		if (indexPath.row<[pictureArray count]) {
			NSString *urlString = [pictureArray objectAtIndex:indexPath.row];
			NSURL *aURL = [[[NSURL alloc] initWithString:urlString] autorelease];
			NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
			
			x = 200 ; 
			y = 15 ;
			width = 80 ;
			height = 100 ;
			
			//
			UIImageView *cellImage05 = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, width, height)];
			cellImage05.image = [UIImage imageWithData:data];
			CALayer * il05ImageLayer = [cellImage05 layer];
			[il05ImageLayer setMasksToBounds:YES];
			[il05ImageLayer setCornerRadius:8.0];
			
			
			
			[cell.contentView addSubview:cellImage05];
			[data release];
		}
		
		cell.accessoryType = UITableViewCellAccessoryNone ;
	}
	
	return cell;
}

-(void) contactsReloadTable {
	[contactsTable reloadData] ;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	if(indexPath.section == 0){
		
		
		
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
		 
	[contactsTable release] ;  

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
