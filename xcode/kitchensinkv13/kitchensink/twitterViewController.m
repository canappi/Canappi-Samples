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
#import "twitterViewController.h"
 
 
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



@implementation twitterViewController 


	@synthesize parentController ;
    @synthesize twitterViewIds ;
    @synthesize twitterViewValues ;

	 

    	// Connection tweets
         
        	 
	@synthesize getMyTweetsResultSet ;
	@synthesize getMyTweetsRow ;
	@synthesize currentResultSet ; 
	@synthesize currentRow ; 
	@synthesize isRoot ;
	@synthesize isRow ;
	@synthesize isColumn ;
	@synthesize currentProperty;
	@synthesize currentElement;
	@synthesize currentResultSetElement;
	@synthesize currentRowElement;
	
	@synthesize getMyTweetsXMLParser ;  
	
	



	 
	// Layout : twitterLayout	 
	@synthesize twitterTableTable ;  
	@synthesize twitterTableTableIdArray ;
	@synthesize twitterTableListOfItems ; 
	 
	@synthesize tweetArray ; 
	 
	// Layout : twitterLayoutIPad	 
	@synthesize twitterTable2Table ;  
	@synthesize twitterTable2TableIdArray ;
	@synthesize twitterTable2ListOfItems ; 
	 
	@synthesize iconForWordsArray ; 
 






     

         
- (NSDictionary *)getMyTweets:(NSDictionary *)requestParameters parserError:(NSError **)err {

	kitchensinkAppDelegate *appDelegate = (kitchensinkAppDelegate *)[[UIApplication sharedApplication] delegate] ;
    int netStat = [(RootController *)appDelegate.viewController networkStatus] ;
	if (netStat>0) {
	NSURL *url = nil;
	NSMutableString *query = [NSMutableString new] ;

	NSString *connectionPath = [[NSBundle mainBundle] pathForResource:@"connections" ofType:@"plist"];;
	NSDictionary *connections = [NSDictionary dictionaryWithContentsOfFile:connectionPath];
	NSMutableString *endpoint = [[connections objectForKey:@"tweets_getMyTweets_url"] mutableCopy];


	//Protocol::: HTTP GET		
	if (requestParameters != nil) 
	{
		id key;
		NSString *comma = @"" ;
		NSString *amp = @"" ;

    	[query appendString:endpoint];
		[query appendString:@"?"];
 		
        
		url = [NSURL URLWithString:[query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
		NSLog(@"Query: %@\n",query);
    }
    else {
    

		url = [NSURL URLWithString:endpoint];
	}
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	request.requestMethod = @"GET" ; 
	
	

  	
	[request startSynchronous];
	
	NSString *response = [request responseString];

	NSLog(@"Response: %@\n",response);
	

	
	
	
	//XML ResultSet
	NSDictionary *data = nil;
	NSData* xmlResultSet=[response dataUsingEncoding:NSUTF8StringEncoding];
	
	getMyTweetsXMLParser = [[NSXMLParser alloc] initWithData:xmlResultSet];
	
	[getMyTweetsXMLParser setDelegate:self]; 
    [getMyTweetsXMLParser setShouldProcessNamespaces:NO]; // We don't care about namespaces
    [getMyTweetsXMLParser setShouldReportNamespacePrefixes:NO]; 
    [getMyTweetsXMLParser setShouldResolveExternalEntities:NO]; // We just want data, no other stuff
	self.isRoot = NO;
	self.isRow = NO;
	self.isColumn = NO;
	
    [getMyTweetsXMLParser parse]; // Parse that data..

	self.getMyTweetsResultSet = currentResultSet ;

	self.currentResultSet = nil ;
	self.currentRow = nil ; 

    if (err && [getMyTweetsXMLParser parserError]) {
        *err = [getMyTweetsXMLParser parserError];
        //JJ Log error
    }

    [getMyTweetsXMLParser release];


	return data;
	} else return nil ;
}

	
	//XML ResultSet

- (void)parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"Document did start\n");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	NSLog(@"Document did end\n");
}

- (void)parserAddEntry:(id)value forKey:(NSString *)attrName {
    NSMutableString *extendedName ;
    if (attrName) {
        if (self.currentElement) {
            extendedName = [NSMutableString stringWithFormat:@"%@:%@",self.currentElement,attrName,nil] ;
        } else {
            extendedName = [NSMutableString stringWithFormat:@"%@",attrName,nil] ;
        }
    } else {
        extendedName = [NSMutableString stringWithFormat:@"%@",self.currentElement,nil] ;
    }
    NSString *rowElementName ;

    NSEnumerator *rowEnumerator = [self.currentRow keyEnumerator] ;
    while (rowElementName = (NSString *)[rowEnumerator nextObject]) {
        if ([rowElementName isEqualToString:extendedName]) {
            //We need to create an array
            NSNumber *lastIndex = [dups objectForKey:extendedName]  ;
            NSNumber *newIndex ;
            if (lastIndex) {
                newIndex = [NSNumber numberWithInt:1 + [lastIndex intValue]] ;
                [dups setValue:newIndex forKey:extendedName];

            }  else {
                newIndex = [NSNumber numberWithInt:1];
                [dups setValue:newIndex forKey:extendedName];
            }

            [extendedName appendString:[NSString stringWithFormat:@"[%@]",[newIndex stringValue]]];
        }
    }
    [self.currentRow setValue:[NSString stringWithString:value] forKey:extendedName];
}

- (void)parserAddEntriesFromDictionary:(NSDictionary *)attrs {
    if (attrs != nil) {
        if (attrs.count > 0) {
            NSEnumerator *enumerator = [attrs keyEnumerator];

            id attrName;


            while ((attrName = [enumerator nextObject])) {

                NSString *value = [attrs objectForKey:attrName] ; /* code that uses the returned key */
                [self parserAddEntry:value forKey:attrName] ;

            }
        }
    }

}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if (qName) {
        elementName = qName;
    }
    
    NSLog(@"Opening Element : %@",elementName);
    
    if (!isRoot) {
    	isRoot = YES ;
    	if (!self.currentResultSet)
    		self.currentResultSet = [[[NSMutableArray alloc] initWithCapacity:100] autorelease] ;
    	
    } else if (!isRow) {
  		isRow = YES;
    	dups = [[NSMutableDictionary alloc] initWithCapacity:32] ;
        self.currentRow = [[NSMutableDictionary alloc] initWithCapacity:16] ;
        [self parserAddEntriesFromDictionary:attributeDict];
    } else if (! isColumn) {
    	isColumn = YES ;
    	self.currentProperty = [NSMutableString string];
    	self.currentElement = elementName ;
        [self parserAddEntriesFromDictionary:attributeDict];
    } else {
        if (self.currentProperty) {
            [currentProperty appendString:elementName];
            [currentProperty appendString:@"/=/"];
        	[self parserAddEntriesFromDictionary:attributeDict];
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.currentProperty) {
        if (![string isEqualToString:@"\n"]) [currentProperty appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if (qName) {
        elementName = qName;
    }
    
    NSLog(@"Closing Element : %@",elementName);
    
    if (isColumn) {
    	if ([elementName isEqualToString:self.currentElement]) {
	    	isColumn = NO;
	    	if (self.currentProperty != nil) {
		    	if (self.currentProperty.length <= 0) { 
		    		[self parserAddEntry:@"" forKey:nil];
	            } else { 
                    [self parserAddEntry:self.currentProperty forKey:nil];
	            }		    		
	    	}
    	} else {
            if (self.currentProperty) {
                [currentProperty appendString:@"///"];
            }
        }
    } else if (isRow) {
    	isRow = NO ;
        [dups release];
        dups = nil ;
		[self.currentResultSet addObject:self.currentRow];
    	self.currentRow = nil ;
    	
    } else if (isRoot) {
    	isRoot = NO ;
    }
}


- (void)fetchDataFromtweets:(NSArray *)rows forOperation:(NSString *)operation {

	NSArray *fromKeys = [NSArray arrayWithObjects:@"tweet", nil];			
	NSArray *toKeys = [NSArray arrayWithObjects:@"text", nil];			
	NSDictionary *map = [NSDictionary dictionaryWithObjects:toKeys forKeys:fromKeys];


	
	if ([operation isEqualToString:@"getMyTweets"]) {
	if (rows != nil) {
		if ([rows count]>0) {
		NSString *key = @"" ;
		NSString *subkey = @"" ;
		NSRange r ;
		//Init from Web API Data
		// twitterLayout 
		//Initializing twitterTable
		//Processing tweet

		self.tweetArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = [map objectForKey:@"tweet"];
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:tweetArray];				
	


		}
			
		//Initializing twitterTable2
		//Processing iconForWords

		self.iconForWordsArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = [map objectForKey:@"iconForWords"];
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:iconForWordsArray];				
	


		}
			
		//Processing tweet

		self.tweetArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = [map objectForKey:@"tweet"];
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:tweetArray];				
	


		}
			
		
		}
	}
	}
}


-(NSMutableDictionary *) identities {
	return twitterViewIds ;
}

-(NSMutableDictionary *) values {
	return twitterViewValues ;
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
	return [twitterViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [twitterViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[twitterViewIds setObject:identity forKey:name] ;
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



	[self getMyTweets:nil parserError:nil] ;


	[self fetchDataFromtweets:self.getMyTweetsResultSet forOperation:@"getMyTweets"] ;

	

	
	
	
	
     
	 
		if (isPad()) {
				
		} else {
				
		}
			

	NSArray *fromKeystwitterLayoutgetMyTweets = [NSArray arrayWithObjects:@"tweet", nil];			
	NSArray *toKeystwitterLayoutgetMyTweets = [NSArray arrayWithObjects:@"text", nil];			
	NSDictionary *maptwitterLayoutgetMyTweets = [NSDictionary dictionaryWithObjects:toKeystwitterLayoutgetMyTweets forKeys:fromKeystwitterLayoutgetMyTweets];
	
	NSArray *rowstwitterLayoutgetMyTweets = self.getMyTweetsResultSet;

	if (rowstwitterLayoutgetMyTweets != nil) {
		if ([rowstwitterLayoutgetMyTweets count]>0) {
		//Init from Data
			for (int i = 0 ; i < [rowstwitterLayoutgetMyTweets count] ; i++) {
				NSDictionary *row = [rowstwitterLayoutgetMyTweets objectAtIndex:i] ;
				id object = nil;
		
				
			}		
		
		}
	}
		
		
		
	
		

	//This code is necessary to refresh the data when a tab is selected	

	
	[self performSelectorOnMainThread:@selector( viewReloadTable ) withObject:nil waitUntilDone:YES];		
	[twitterTableTable performSelectorOnMainThread:@selector( setNeedsLayout ) withObject:nil waitUntilDone:YES];		
	[twitterTableTable performSelectorOnMainThread:@selector( setNeedsDisplay ) withObject:nil waitUntilDone:YES];		
	
	
	
	

	
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

	self.twitterViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.twitterViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	
	
	
	
	

	if (isPad()) {
		 

	
	if (isPad()) {
    	twitterTable2Table = [[UITableView alloc] initWithFrame:CGRectMake(0,40,768,912) style:UITableViewStylePlain];
    } else {
    	twitterTable2Table = [[UITableView alloc] initWithFrame:CGRectMake(0,40,320,368) style:UITableViewStylePlain];
	}
	twitterTable2Table.delegate = self;
	twitterTable2Table.dataSource = self;
	
	twitterTable2Table.rowHeight = 60;
	[self.view addSubview:twitterTable2Table];
	
	
	
		
	} else {
		 

	
	if (isPad()) {
    	twitterTableTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,768,912) style:UITableViewStylePlain];
    } else {
    	twitterTableTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,320,368) style:UITableViewStylePlain];
	}
	twitterTableTable.delegate = self;
	twitterTableTable.dataSource = self;
	
	twitterTableTable.rowHeight = 60;
	[self.view addSubview:twitterTableTable];
	
	
	
		
	}

	[self didSelectViewController];

	[self setTitle:@"Twitter"];
	

	if (isPad()) {
	 
	}
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if (self = [self init]) {
		self.title = @"Twitter";
	
		self.tabBarItem.image = [UIImage imageNamed:@"twitter.png"];
	
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

 
		
 
	 
	 

	 
	 
	
		 
		
 
	 
	 


- (int)selectedRow {
	return currentTableSelectedRow ;
}

// No Gallery Here



	

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (tableView == twitterTableTable) {
					
		return [tweetArray count];  
							
	}
	if (tableView == twitterTable2Table) {
					
		return [iconForWordsArray count];  
							
					
	}
	return 0 ;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	if (isPad()) {

    if (tableView == twitterTable2Table) {
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
			
		
	    NSString *icon = @"bck1.png" ;
		if (indexPath.row<[tweetArray count]) {
	        
	        
	        
	        NSRange worddroid = [[tweetArray objectAtIndex:indexPath.row] rangeOfString:@"droid"] ;
	        if (worddroid.location != NSNotFound) {
	            icon = @"bck2.png" ;
	        }
			
	        
	        NSRange wordiPhone = [[tweetArray objectAtIndex:indexPath.row] rangeOfString:@"iPhone"] ;
	        if (wordiPhone.location != NSNotFound) {
	            icon = @"bck3.png" ;
	        }
			
	        
	        NSRange wordMDE = [[tweetArray objectAtIndex:indexPath.row] rangeOfString:@"MDE"] ;
	        if (wordMDE.location != NSNotFound) {
	            icon = @"bck4.png" ;
	        }
			
	        
	        NSRange wordlatform = [[tweetArray objectAtIndex:indexPath.row] rangeOfString:@"latform"] ;
	        if (wordlatform.location != NSNotFound) {
	            icon = @"bck5.png" ;
	        }
			
			NSString *fName = [icon stringByDeletingPathExtension] ;
            NSString *fType = [icon pathExtension];
            
	        NSString *iconfilePath = [[NSBundle mainBundle] pathForResource:fName ofType:fType];
 	        NSData *data = [NSData dataWithContentsOfFile:iconfilePath];

			
			x = 0 ; 
			y = 0 ;
			width = 766 ;
			height = 60 ;
			
			//
			UIImageView *cellImage00 = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, width, height)];
			cellImage00.image = [UIImage imageWithData:data];
			
			
			
			[cell.contentView addSubview:cellImage00];
			[cellImage00 release] ;
			
		}
		x = 100 ; 
		y = 10 ;
		width = 600 ;
		height = 50 ;
		
		//
		UILabel *cellLabel01 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel01.backgroundColor = [UIColor clearColor];
		
		
		cellLabel01.textColor = 	
	[UIColor blueColor]
;
		
		[cellLabel01 setLineBreakMode:UILineBreakModeWordWrap] ;
        [cellLabel01 setNumberOfLines:2] ;
		cellLabel01.font = [UIFont fontWithName:@"Helvetica" size:16]; 
		if (indexPath.row<[tweetArray count]) cellLabel01.text = [tweetArray objectAtIndex:indexPath.row];
		
		
		
		[cell.contentView addSubview:cellLabel01];
			
			cell.accessoryType = UITableViewCellAccessoryNone ;
		}
		
		return cell;
	}


	} else { 

    if (tableView == twitterTableTable) {
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
			
		x = 5 ; 
		y = 10 ;
		width = 300 ;
		height = 50 ;
		
		//
		UILabel *cellLabel00 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel00.backgroundColor = [UIColor clearColor];
		
		
		cellLabel00.textColor = 	
	[UIColor blueColor]
;
		
		[cellLabel00 setLineBreakMode:UILineBreakModeWordWrap] ;
        [cellLabel00 setNumberOfLines:2] ;
		cellLabel00.font = [UIFont fontWithName:@"Helvetica" size:16]; 
		if (indexPath.row<[tweetArray count]) cellLabel00.text = [tweetArray objectAtIndex:indexPath.row];
		
		
		
		[cell.contentView addSubview:cellLabel00];
			
			cell.accessoryType = UITableViewCellAccessoryNone ;
		}
		
		return cell;
	}


	}
	
	return nil ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


	if (tableView == twitterTableTable) {
		if(indexPath.section == 0){
			
			
	
			
	            NSString *actionUrl = [tweetArray objectAtIndex:indexPath.row];
	            
	            if (actionUrl != nil) {
	                
	                NSRange aUrl = [actionUrl rangeOfString:@"http://"] ;
	                if (aUrl.location != NSNotFound) {
	                    actionUrl = [actionUrl substringFromIndex:aUrl.location] ;
	                    NSRange endUrl = [actionUrl rangeOfString:@" "] ;
	                    if (endUrl.location != NSNotFound) {
	                        actionUrl = [actionUrl substringToIndex:endUrl.location] ;
	                    }
	                        endUrl = [actionUrl rangeOfString:@"\n"] ;
	                        if (endUrl.location != NSNotFound) {
	                            actionUrl = [actionUrl substringToIndex:endUrl.location] ;
	                        }
	                    
	                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:actionUrl]] ;
	                } 
	            }
			
		}
		
	}


}


-(void)openUrl:(NSInteger)selectedRow {

	BOOL exception = NO ;

	
	 
	 
	  
	
	
	 

	    
	 
	NSString *openUrlUrl = @"tweet";

	if (openUrlUrl != nil) {
NSLog(@"%@",openUrlUrl) ;
        NSRange noUrl = [openUrlUrl rangeOfString:@"http://"] ;
        if (noUrl.location != NSNotFound) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:openUrlUrl]] ;
        } else {
           //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.canappi.com"]] ;        
        }
    }
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 



	
	
	//TODO implement openUrl action
	
	
	
	
		
}




-(void) viewReloadTable {

	if (twitterTableTable) [twitterTableTable reloadData] ;
	if (twitterTable2Table) [twitterTable2Table reloadData] ;
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

		 
	[twitterTableTable release] ;  


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
