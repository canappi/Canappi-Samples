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
#import "youTubeViewController.h"
 
 
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



@implementation youTubeViewController 

	@synthesize parentController ;
    @synthesize youTubeViewIds ;
    @synthesize youTubeViewValues ;

	 

    	// Connection canappiTutorials
         
        	 
	@synthesize getmyTubesResultSet ;
	@synthesize getmyTubesRow ;
	@synthesize isRoot ;
	@synthesize isRow ;
	@synthesize isColumn ;
	@synthesize currentProperty;
	@synthesize currentElement;
	



	 
	// Layout : youTubeLayout	 
	@synthesize tutorialTable ;  
	@synthesize tutorialTableIdArray ;
	@synthesize tutorialListOfItems ; 
	 
	@synthesize videoTitleArray ; 
 
	@synthesize descriptionArray ; 
 
	@synthesize urlArray ; 




     

         
- (NSDictionary *)getmyTubes:(NSDictionary *)requestParameters parserError:(NSError **)err {

	NSURL *url = nil;
	NSMutableString *query = [[NSMutableString new] autorelease];

	NSString *connectionPath = [[NSBundle mainBundle] pathForResource:@"connections" ofType:@"plist"];;
	NSDictionary *connections = [[NSDictionary alloc] initWithContentsOfFile:connectionPath];
	NSString *endpoint = [connections objectForKey:@"canappiTutorials_getmyTubes_url"];


	//Protocol::: ATOM GET		
	if (requestParameters != nil) 
	{
		id key;

    	[query appendString:endpoint];
		[query appendString:@"?"];
        
		url = [NSURL URLWithString:[query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
		
    }
    else {
    

		url = [NSURL URLWithString:endpoint];
	}
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	request.requestMethod = @"GET" ; 

  	
	[request startSynchronous];
	
	NSString *response = [request responseString];
NSLog(@"Response: %@\n",response);	NSDictionary *data = nil;
	
	//XML ResultSet
	NSData* xmlResultSet=[response dataUsingEncoding:NSUTF8StringEncoding];
	
	getmyTubesXMLParser = [[NSXMLParser alloc] initWithData:xmlResultSet];
	
	[getmyTubesXMLParser setDelegate:self]; 
    [getmyTubesXMLParser setShouldProcessNamespaces:NO]; // We don't care about namespaces
    [getmyTubesXMLParser setShouldReportNamespacePrefixes:NO]; 
    [getmyTubesXMLParser setShouldResolveExternalEntities:NO]; // We just want data, no other stuff
	self.isRoot = NO;
	self.isRow = NO;
	self.isColumn = NO;
	
    [getmyTubesXMLParser parse]; // Parse that data..

    if (err && [getmyTubesXMLParser parserError]) {
        *err = [getmyTubesXMLParser parserError];
        //JJ Log error
    }

    [getmyTubesXMLParser release];


	return data;
	
}

	
	//XML ResultSet


- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
    NSLog(@"Error %i, Description: %@, Line: %i, Column: %i", [parseError code],
									 [[parser parserError] localizedDescription], [parser lineNumber],
									 [parser columnNumber]);
}


- (void)parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"Document did start\n");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	NSLog(@"Document did end\n");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if (qName) {
        elementName = qName;
    }
    
    NSLog(@"Opening Element : %@",elementName);
    
    if (!isRoot) {
    	if ([elementName isEqualToString:@"feed"]) {
    		isRoot = YES ;
    		self.getmyTubesResultSet = [[NSMutableArray alloc] initWithCapacity:100] ;
    	}
    	
    } else if (!isRow) {
    	if ([elementName isEqualToString:@"entry"]) {
	  		isRow = YES;
	    	if (attributeDict != nil) { 
				if (attributeDict.count > 0) {
					self.getmyTubesRow = [[NSMutableDictionary dictionaryWithDictionary:attributeDict ] retain] ;
				}
				else {
					self.getmyTubesRow = [[NSMutableDictionary alloc] initWithCapacity:16] ;
				}} else {
	    		self.getmyTubesRow = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	    	}
    	}
    } else if (! isColumn) {
    	isColumn = YES ;
    	self.currentProperty = [NSMutableString string];
    	self.currentElement = elementName ;
    } else {
        if (self.currentProperty) {
            [currentProperty appendString:elementName];
            [currentProperty appendString:@"/=/"];
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
	                [self.getmyTubesRow setValue:@"" forKey:self.currentElement];
	            } else { 
		    		[self.getmyTubesRow setValue:self.currentProperty forKey:self.currentElement];
		    		[self.currentProperty release];
	            }
		    		
	    	}
    	} else {
            if (self.currentProperty) {
                [currentProperty appendString:@"///"];
            }
        }
    } else if (isRow) {
    	isRow = NO ;
		[self.getmyTubesResultSet addObject:self.getmyTubesRow];
    	[self.getmyTubesRow release];
    	
    } else if (isRoot) {
    	if ([elementName isEqualToString:@"feed"]) {
    		isRoot = NO;
    	}
    }
}


- (void)fetchDataFromcanappiTutorials:(NSArray *)rows {

	NSArray *fromKeys = [NSArray arrayWithObjects:@"videoTitle",@"description",@"url", nil];			
	NSArray *toKeys = [NSArray arrayWithObjects:@"title",@"content",@"link.href", nil];			
	NSDictionary *map = [NSDictionary dictionaryWithObjects:toKeys forKeys:fromKeys];


	
	if (rows != nil) {
		if ([rows count]>0) {
		NSString *key = @"" ;
		NSString *subkey = @"" ;
		NSRange r ;
		//Init from Web API Data
		// youTubeLayout 
		//Initializing tutorial
		//Processing videoTitle
		videoTitleArray = [[NSMutableArray alloc] initWithCapacity:[rows count]];	
		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = [map objectForKey:@"videoTitle"];
			if (key != nil) {
				r = [key rangeOfString:@"."] ;
		        if (r.location == NSNotFound) {
					object = [row objectForKey:key] ;
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
			if (object != nil) { 
			    if ([object isKindOfClass:[NSString class]]) { 
                    [videoTitleArray addObject:object]; 
                } else {
                    if ([object isKindOfClass:[NSArray class]]) { 
                        NSArray *myArray = (NSArray *)object ;
                        [videoTitleArray addObject:[myArray objectAtIndex:0]]; 
                    } else {
						[videoTitleArray addObject:@""];
					}
                }
			} else {
				[videoTitleArray addObject:@""];
			}
			

		}			
		//Processing description
		descriptionArray = [[NSMutableArray alloc] initWithCapacity:[rows count]];	
		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = [map objectForKey:@"description"];
			if (key != nil) {
				r = [key rangeOfString:@"."] ;
		        if (r.location == NSNotFound) {
					object = [row objectForKey:key] ;
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
			if (object != nil) { 
			    if ([object isKindOfClass:[NSString class]]) { 
                    [descriptionArray addObject:object]; 
                } else {
                    if ([object isKindOfClass:[NSArray class]]) { 
                        NSArray *myArray = (NSArray *)object ;
                        [descriptionArray addObject:[myArray objectAtIndex:0]]; 
                    } else {
						[descriptionArray addObject:@""];
					}
                }
			} else {
				[descriptionArray addObject:@""];
			}
			

		}			
		//Processing url
		urlArray = [[NSMutableArray alloc] initWithCapacity:[rows count]];	
		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = [map objectForKey:@"url"];
			if (key != nil) {
				r = [key rangeOfString:@"."] ;
		        if (r.location == NSNotFound) {
					object = [row objectForKey:key] ;
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
			if (object != nil) { 
			    if ([object isKindOfClass:[NSString class]]) { 
                    [urlArray addObject:object]; 
                } else {
                    if ([object isKindOfClass:[NSArray class]]) { 
                        NSArray *myArray = (NSArray *)object ;
                        [urlArray addObject:[myArray objectAtIndex:0]]; 
                    } else {
						[urlArray addObject:@""];
					}
                }
			} else {
				[urlArray addObject:@""];
			}
			

		}			
		}
	}
	
}

        


-(NSMutableDictionary *) identities {
	return youTubeViewIds ;
}

-(NSMutableDictionary *) values {
	return youTubeViewValues ;
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
	return [youTubeViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [youTubeViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[youTubeViewIds setObject:identity forKey:name] ;
}





- (void)didSelectViewController {

	// Register the observer for the keyboardWillShow event
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];


	[self getmyTubes:nil parserError:nil] ;
	[self fetchDataFromcanappiTutorials:self.getmyTubesResultSet] ;
	
	
	

	NSArray *fromKeysyouTubeLayout = [NSArray arrayWithObjects:@"videoTitle",@"description",@"url", nil];			
	NSArray *toKeysyouTubeLayout = [NSArray arrayWithObjects:@"title",@"content",@"link.href", nil];			
	NSDictionary *mapyouTubeLayout = [NSDictionary dictionaryWithObjects:toKeysyouTubeLayout forKeys:fromKeysyouTubeLayout];
	
	NSArray *rowsyouTubeLayout = self.getmyTubesResultSet;

	if (rowsyouTubeLayout != nil) {
		if ([rowsyouTubeLayout count]>0) {
		//Init from Data
			for (int i = 0 ; i < [rowsyouTubeLayout count] ; i++) {
				NSDictionary *row = [rowsyouTubeLayout objectAtIndex:i] ;
				id object = nil;
		
		
			}		
		
		}
	}
		
		
		

	//This code is necessary to refresh the data when a tab is selected	

	
	[tutorialTable performSelectorOnMainThread:@selector( reloadData ) withObject:nil waitUntilDone:YES];		
	[tutorialTable performSelectorOnMainThread:@selector( setNeedsLayout ) withObject:nil waitUntilDone:YES];		
	[tutorialTable performSelectorOnMainThread:@selector( setNeedsDisplay ) withObject:nil waitUntilDone:YES];		
	
	
	
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

	self.youTubeViewIds = [[NSMutableDictionary alloc] initWithCapacity:16] ;
	self.youTubeViewValues = [[NSMutableDictionary alloc] initWithCapacity:16] ;

	BOOL isUserDefault = NO;
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor groupTableViewBackgroundColor]
];

	 


	if (isPad()) {
    	tutorialTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,768,912) style:UITableViewStylePlain];
    } else {
    	tutorialTable = [[UITableView alloc] initWithFrame:CGRectMake(0,40,320,368) style:UITableViewStylePlain];
	}
	tutorialTable.delegate = self;
	tutorialTable.dataSource = self;
	
	tutorialTable.rowHeight = 130;
	[self.view addSubview:tutorialTable];
	
	
	

	[self didSelectViewController];

	[self setTitle:@"Tutorials"];
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if ([self init]) {
		self.title = @"Tutorials";
	
		self.tabBarItem.image = [UIImage imageNamed:@"tv.png"];
	
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
	 
	 
	
		 
		
 
		
 
		
 
	 
	 




-(void)openTutorial:(NSInteger)selectedRow {

	 
	 
	  
	 
	NSString *openTutorialUrl = @"url";

	if (openTutorialUrl != nil) {
NSLog(@"%@",openTutorialUrl) ;
        NSRange noUrl = [openTutorialUrl rangeOfString:@"http://"] ;
        if (noUrl.location != NSNotFound) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:openTutorialUrl]] ;
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.canappi.com"]] ;        
        }
    }
	 
	 
	 

	[self saveValues] ;
	 

	//TODO implement openTutorial action
	

	
		
}
	
	
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
				
	return [videoTitleArray count];  
						
				
				
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
		y = 3 ;
		width = 280 ;
		height = 25 ;
		
		//
		UILabel *cellLabel00 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel00.backgroundColor = [UIColor clearColor];
		
		cellLabel00.textColor = [UIColor blackColor]; 
		
		cellLabel00.font = [UIFont fontWithName:@"Helvetica-Bold" size:16]; 
		if (indexPath.row<[videoTitleArray count]) cellLabel00.text = [videoTitleArray objectAtIndex:indexPath.row];
		[cell.contentView addSubview:cellLabel00];
		x = 5 ; 
		y = 30 ;
		width = 300 ;
		height = 70 ;
		
		//
		UILabel *cellLabel01 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel01.backgroundColor = [UIColor clearColor];
		
		cellLabel01.textColor = [UIColor blackColor]; 
		
		[cellLabel01 setLineBreakMode:UILineBreakModeWordWrap] ;
        [cellLabel01 setNumberOfLines:3] ;
		
		cellLabel01.font = [UIFont fontWithName:@"Helvetica-Oblique" size:16]; 
		if (indexPath.row<[descriptionArray count]) cellLabel01.text = [descriptionArray objectAtIndex:indexPath.row];
		[cell.contentView addSubview:cellLabel01];
		x = 5 ; 
		y = 105 ;
		width = 260 ;
		height = 20 ;
		
		//
		UILabel *cellLabel02 = [[[UILabel alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease]; 	 
		
		cellLabel02.backgroundColor = [UIColor clearColor];
		
		
		cellLabel02.textColor = 	
	[UIColor blueColor]
;
		cellLabel02.font = [UIFont fontWithName:@"Helvetica" size:16]; 
		if (indexPath.row<[urlArray count]) cellLabel02.text = [urlArray objectAtIndex:indexPath.row];
		[cell.contentView addSubview:cellLabel02];
		
		cell.accessoryType = UITableViewCellAccessoryNone ;
	}
	
	return cell;
}

-(void) tutorialReloadTable {
	[tutorialTable reloadData] ;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	if(indexPath.section == 0){
		
		
		
		
            NSString *actionUrl = [urlArray objectAtIndex:indexPath.row];
            
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




- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
		 
	[tutorialTable release] ;  

	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
