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
#import "flickrViewController.h"
 
 
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



@implementation flickrViewController 


	@synthesize parentController ;
    @synthesize flickrViewIds ;
    @synthesize flickrViewValues ;

	 

    	// Connection flickr
         
        	 
	@synthesize getPhotosResultSet ;
	@synthesize getPhotosRow ;
	@synthesize currentResultSet ; 
	@synthesize currentRow ; 
	@synthesize isRoot ;
	@synthesize isRow ;
	@synthesize isColumn ;
	@synthesize currentProperty;
	@synthesize currentElement;
	@synthesize currentResultSetElement;
	@synthesize currentRowElement;
	
	@synthesize getPhotosXMLParser ;  
	
	
 
	@synthesize getSizesResultSet ;
	@synthesize getSizesRow ;
	
	@synthesize getSizesXMLParser ;  
	
	@synthesize photo_idQueryParameter ;
	



	 
	// Layout : flickrLayout	 
	@synthesize flickrGalleryImageArray ;
	@synthesize flickrGalleryIdArray ;
	@synthesize flickrGalleryListOfItems ; 
	 
	@synthesize sourceArray ; 
 
	@synthesize widthArray ;
 
	@synthesize heightArray ;
 
	@synthesize labelArray ;
 
	@synthesize mediaArray ;
 
	@synthesize ownerArray ;
 
	@synthesize secretArray ;
 
	@synthesize farmArray ;
 
	@synthesize serverArray ;
 
	@synthesize titleArray ;
 
	@synthesize idArray ;
 
	@synthesize infoButton ;
	 
	// Layout : flickrLayoutIPad	 
 
	@synthesize mdslWebView ;  






     

         
- (NSDictionary *)getPhotos:(NSDictionary *)requestParameters parserError:(NSError **)err {

	kitchensinkAppDelegate *appDelegate = (kitchensinkAppDelegate *)[[UIApplication sharedApplication] delegate] ;
    int netStat = [(RootController *)appDelegate.viewController networkStatus] ;
	if (netStat>0) {
	NSURL *url = nil;
	NSMutableString *query = [NSMutableString new] ;

	NSString *connectionPath = [[NSBundle mainBundle] pathForResource:@"connections" ofType:@"plist"];;
	NSDictionary *connections = [NSDictionary dictionaryWithContentsOfFile:connectionPath];
	NSMutableString *endpoint = [[connections objectForKey:@"flickr_getPhotos_url"] mutableCopy];


	//Protocol::: HTTP GET		
	if (requestParameters != nil) 
	{
		id key;
		NSString *comma = @"" ;
		NSString *amp = @"" ;

    	[query appendString:endpoint];
    	amp = @"&" ;
 		
        
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
	
	getPhotosXMLParser = [[NSXMLParser alloc] initWithData:xmlResultSet];
	
	[getPhotosXMLParser setDelegate:self]; 
    [getPhotosXMLParser setShouldProcessNamespaces:NO]; // We don't care about namespaces
    [getPhotosXMLParser setShouldReportNamespacePrefixes:NO]; 
    [getPhotosXMLParser setShouldResolveExternalEntities:NO]; // We just want data, no other stuff
	self.isRoot = NO;
	self.isRow = NO;
	self.isColumn = NO;
	
	self.currentResultSetElement = @"photos" ;
    [getPhotosXMLParser parse]; // Parse that data..

	self.getPhotosResultSet = currentResultSet ;

	self.currentResultSet = nil ;
	self.currentRow = nil ; 

    if (err && [getPhotosXMLParser parserError]) {
        *err = [getPhotosXMLParser parserError];
        //JJ Log error
    }

    [getPhotosXMLParser release];


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
    	if ([elementName isEqualToString:self.currentResultSetElement]) {
    		isRoot = YES ;
    		if (!self.currentResultSet)
    			self.currentResultSet = [[[NSMutableArray alloc] initWithCapacity:100] autorelease] ;
    	}
    	
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
    	if ([elementName isEqualToString:self.currentResultSetElement]) {
    		isRoot = NO;
    	}
    }
}

- (NSDictionary *)getSizes:(NSDictionary *)requestParameters parserError:(NSError **)err {

	kitchensinkAppDelegate *appDelegate = (kitchensinkAppDelegate *)[[UIApplication sharedApplication] delegate] ;
    int netStat = [(RootController *)appDelegate.viewController networkStatus] ;
	if (netStat>0) {
	NSURL *url = nil;
	NSMutableString *query = [NSMutableString new] ;

	NSString *connectionPath = [[NSBundle mainBundle] pathForResource:@"connections" ofType:@"plist"];;
	NSDictionary *connections = [NSDictionary dictionaryWithContentsOfFile:connectionPath];
	NSMutableString *endpoint = [[connections objectForKey:@"flickr_getSizes_url"] mutableCopy];


	//Protocol::: HTTP GET		
	if (requestParameters != nil) 
	{
		id key;
		NSString *comma = @"" ;
		NSString *amp = @"" ;

    	[query appendString:endpoint];
    	amp = @"&" ;
    	
		
		
    	key = @"photo_id" ;
    	NSString * photo_idValue = (NSString *)[requestParameters objectForKey: key];
        NSString *photo_idDefaultValue = [self retrieveFromUserDefaultsFor:key];
    	if ([photo_idValue length]>0) {
          	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

            
          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
            NSRange r2 = [query rangeOfString:var2] ;
            if (r2.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[photo_idValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
                query = [newQuery mutableCopy] ;
			} else { 
            NSRange r = [query rangeOfString:var] ;
            if (r.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:photo_idValue ] ; 
                query = [newQuery mutableCopy] ;
                
            } else { 
    			[query appendFormat:@"%@",amp];	
       			[query appendFormat:@"%s=%s", [key UTF8String], [[requestParameters objectForKey: key] UTF8String] ];
				comma = @"," ;
				amp = @"&" ;
            } 
            }
        } else {
        	//try to find the value in the user defaults
        	if (photo_idDefaultValue != nil) {
	         	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

	          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
	            NSRange r2 = [query rangeOfString:var2] ;
	            if (r2.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[photo_idDefaultValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
	                query = [newQuery mutableCopy] ;
				} else { 
	            NSRange r = [query rangeOfString:var] ;
	            if (r.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:photo_idDefaultValue ] ; 
	                query = [newQuery mutableCopy] ;
	            	} else {
	 
         		[query appendFormat:@"%@",amp];
	        	[query appendFormat:@"%s=%s", [key UTF8String], [[self retrieveFromUserDefaultsFor:key] UTF8String] ];
				comma = @"," ;
				amp = @"&" ;
                }
				}
	        }
        }
 		
        
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
	
	getSizesXMLParser = [[NSXMLParser alloc] initWithData:xmlResultSet];
	
	[getSizesXMLParser setDelegate:self]; 
    [getSizesXMLParser setShouldProcessNamespaces:NO]; // We don't care about namespaces
    [getSizesXMLParser setShouldReportNamespacePrefixes:NO]; 
    [getSizesXMLParser setShouldResolveExternalEntities:NO]; // We just want data, no other stuff
	self.isRoot = NO;
	self.isRow = NO;
	self.isColumn = NO;
	
	self.currentResultSetElement = @"sizes" ;
    [getSizesXMLParser parse]; // Parse that data..

	self.getSizesResultSet = currentResultSet ;

	self.currentResultSet = nil ;
	self.currentRow = nil ; 

    if (err && [getSizesXMLParser parserError]) {
        *err = [getSizesXMLParser parserError];
        //JJ Log error
    }

    [getSizesXMLParser release];


	return data;
	} else return nil ;
}

	


- (void)fetchDataFromflickr:(NSArray *)rows forOperation:(NSString *)operation {



	
	if ([operation isEqualToString:@"getPhotos"]) {
	if (rows != nil) {
		if ([rows count]>0) {
		NSString *key = @"" ;
		NSString *subkey = @"" ;
		NSRange r ;
		//Init from Web API Data
		// flickrLayout 
		//Initializing flickr
		//Processing source

		self.sourceArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"source" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:sourceArray];				
	


		}
			
		//Processing _width

		self.widthArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"width" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:widthArray];				
	


		}
			
		//Processing _height

		self.heightArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"height" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:heightArray];				
	


		}
			
		//Processing _label

		self.labelArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"label" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:labelArray];				
	


		}
			
		//Processing media

		self.mediaArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"media" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:mediaArray];				
	


		}
			
		//Processing owner

		self.ownerArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"owner" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:ownerArray];				
	


		}
			
		//Processing secret

		self.secretArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"secret" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:secretArray];				
	


		}
			
		//Processing farm

		self.farmArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"farm" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:farmArray];				
	


		}
			
		//Processing server

		self.serverArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"server" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:serverArray];				
	


		}
			
		//Processing _title

		self.titleArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"title" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:titleArray];				
	


		}
			
		//Processing _id

		self.idArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"id" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:idArray];				
	


		}
			
		//Initializing flickr
		//Processing source

		self.sourceArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"source" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:sourceArray];				
	


		}
			
		//Processing _width

		self.widthArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"width" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:widthArray];				
	


		}
			
		//Processing _height

		self.heightArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"height" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:heightArray];				
	


		}
			
		//Processing _label

		self.labelArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"label" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:labelArray];				
	


		}
			
		//Processing media

		self.mediaArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"media" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:mediaArray];				
	


		}
			
		//Processing owner

		self.ownerArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"owner" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:ownerArray];				
	


		}
			
		//Processing secret

		self.secretArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"secret" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:secretArray];				
	


		}
			
		//Processing farm

		self.farmArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"farm" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:farmArray];				
	


		}
			
		//Processing server

		self.serverArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"server" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:serverArray];				
	


		}
			
		//Processing _title

		self.titleArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"title" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:titleArray];				
	


		}
			
		//Processing _id

		self.idArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"id" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:idArray];				
	


		}
			
		
		}
	}
	}
	
	if ([operation isEqualToString:@"getSizes"]) {
	if (rows != nil) {
		if ([rows count]>0) {
		NSString *key = @"" ;
		NSString *subkey = @"" ;
		NSRange r ;
		//Init from Web API Data
		// flickrLayout 
		//Initializing flickr
		//Processing source

		self.sourceArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"source" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:sourceArray];				
	


		}
			
		//Processing _width

		self.widthArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"width" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:widthArray];				
	


		}
			
		//Processing _height

		self.heightArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"height" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:heightArray];				
	


		}
			
		//Processing _label

		self.labelArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"label" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:labelArray];				
	


		}
			
		//Processing media

		self.mediaArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"media" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:mediaArray];				
	


		}
			
		//Processing owner

		self.ownerArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"owner" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:ownerArray];				
	


		}
			
		//Processing secret

		self.secretArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"secret" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:secretArray];				
	


		}
			
		//Processing farm

		self.farmArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"farm" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:farmArray];				
	


		}
			
		//Processing server

		self.serverArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"server" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:serverArray];				
	


		}
			
		//Processing _title

		self.titleArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"title" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:titleArray];				
	


		}
			
		//Processing _id

		self.idArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"id" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:idArray];				
	


		}
			
		//Initializing flickr
		//Processing source

		self.sourceArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"source" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:sourceArray];				
	


		}
			
		//Processing _width

		self.widthArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"width" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:widthArray];				
	


		}
			
		//Processing _height

		self.heightArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"height" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:heightArray];				
	


		}
			
		//Processing _label

		self.labelArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"label" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:labelArray];				
	


		}
			
		//Processing media

		self.mediaArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"media" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:mediaArray];				
	


		}
			
		//Processing owner

		self.ownerArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"owner" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:ownerArray];				
	


		}
			
		//Processing secret

		self.secretArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"secret" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:secretArray];				
	


		}
			
		//Processing farm

		self.farmArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"farm" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:farmArray];				
	


		}
			
		//Processing server

		self.serverArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"server" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:serverArray];				
	


		}
			
		//Processing _title

		self.titleArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"title" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:titleArray];				
	


		}
			
		//Processing _id

		self.idArray = [[[NSMutableArray alloc] initWithCapacity:[rows count]] autorelease];

		for (int i = 0 ; i < [rows count] ; i++) {
			NSDictionary *row = [rows objectAtIndex:i] ;
			id object = nil;

				
			key = @"id" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			[self addParsedValue:object toArray:idArray];				
	


		}
			
		
		}
	}
	}
}


-(NSMutableDictionary *) identities {
	return flickrViewIds ;
}

-(NSMutableDictionary *) values {
	return flickrViewValues ;
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
	return [flickrViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [flickrViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[flickrViewIds setObject:identity forKey:name] ;
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



	[self getPhotos:nil parserError:nil] ;


	for (NSMutableDictionary *row in self.getPhotosResultSet) {
        NSString *value = [row objectForKey:@"id"] ;

        NSDictionary *joinedParams = [NSDictionary dictionaryWithObjectsAndKeys:value,@"photo_id",nil];

        [self getSizes:joinedParams parserError:nil] ;
 
        for (NSDictionary *joinedRow in self.getSizesResultSet) {
            NSString *conditionValue = [joinedRow objectForKey:@"label"] ;
            if (conditionValue != nil) {
                if ([conditionValue isEqualToString:@"Square"]) {
                    [row addEntriesFromDictionary:joinedRow] ;
                }
            }
        }

    }
	 

	[self fetchDataFromflickr:self.getPhotosResultSet forOperation:@"getPhotos"] ;

	

	

	
	
	
	
     
	 
		if (isPad()) {
				
	int im = 0 ;
	for (NSString *url in sourceArray) {
        NSLog(@"%@",url) ;
        if (url != nil) {
            NSRange noUrl = [url rangeOfString:@"http://"] ;
            if (noUrl.location != NSNotFound) {
            NSURL *_url = [NSURL URLWithString:url] ;
                
            NSData *data = [NSData dataWithContentsOfURL:_url];
                
            UIImage *thumbnail = [[UIImage alloc] initWithData:data] ;
            int offsetx = (100 - thumbnail.size.width)/2 ;
            int offsety = (100 - thumbnail.size.height)/2 ;
            int u = 1 + (10+300) / 100 ;
            if (isPad()) {
            	u = 1 + 768 / 100 ;
    	    } 
            
            UIButton *image = [[UIButton alloc] initWithFrame:CGRectMake(10 + offsetx + 100*(im%u), 55 + offsety +100*(im / u), thumbnail.size.width, thumbnail.size.height)] ; 
            
            [image setImage:thumbnail forState:UIControlStateNormal] ;
            [flickrGalleryImageArray addObject:image] ;
            [image setTag:1000+im];
            
    		[image addTarget:self action:@selector(displayPicture:) forControlEvents:UIControlEventTouchUpInside];
		            
            [self.view addSubview:image] ;
            [image release] ;
            
            [thumbnail release] ;
            im++ ;
            }
        }
    }
	
		} else {
				
	int im = 0 ;
	for (NSString *url in sourceArray) {
        NSLog(@"%@",url) ;
        if (url != nil) {
            NSRange noUrl = [url rangeOfString:@"http://"] ;
            if (noUrl.location != NSNotFound) {
            NSURL *_url = [NSURL URLWithString:url] ;
                
            NSData *data = [NSData dataWithContentsOfURL:_url];
                
            UIImage *thumbnail = [[UIImage alloc] initWithData:data] ;
            int offsetx = (100 - thumbnail.size.width)/2 ;
            int offsety = (100 - thumbnail.size.height)/2 ;
            int u = 1 + (10+300) / 100 ;
            if (isPad()) {
            	u = 1 + 768 / 100 ;
    	    } 
            
            UIButton *image = [[UIButton alloc] initWithFrame:CGRectMake(10 + offsetx + 100*(im%u), 55 + offsety +100*(im / u), thumbnail.size.width, thumbnail.size.height)] ; 
            
            [image setImage:thumbnail forState:UIControlStateNormal] ;
            [flickrGalleryImageArray addObject:image] ;
            [image setTag:1000+im];
            
    		[image addTarget:self action:@selector(displayPicture:) forControlEvents:UIControlEventTouchUpInside];
		            
            [self.view addSubview:image] ;
            [image release] ;
            
            [thumbnail release] ;
            im++ ;
            }
        }
    }
	
		}
			

	
	NSArray *rowsflickrLayoutgetPhotos = self.getPhotosResultSet;

	if (rowsflickrLayoutgetPhotos != nil) {
		if ([rowsflickrLayoutgetPhotos count]>0) {
		//Init from Data
			for (int i = 0 ; i < [rowsflickrLayoutgetPhotos count] ; i++) {
				NSDictionary *row = [rowsflickrLayoutgetPhotos objectAtIndex:i] ;
				id object = nil;
		
				
			}		
		
		}
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

	self.flickrViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.flickrViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor blackColor]
];

	if (isPad()) {
		 
	self.flickrGalleryImageArray = [[[NSMutableArray alloc] initWithCapacity:16] autorelease] ;

  	mdslWebView = [[UIWebView alloc] initWithFrame:CGRectMake(350, 45, 350, 500)];

 	NSString *mdslUrlAddress = @"http://www.canappi.com/ks/galleryLayout.html";
	NSURL *mdslUrl = [NSURL URLWithString:mdslUrlAddress];
	NSURLRequest *mdslRequestObj = [NSURLRequest requestWithURL:mdslUrl];
	[mdslWebView loadRequest:mdslRequestObj]; 
	[self.view addSubview:mdslWebView];
	} else {
		 
	self.flickrGalleryImageArray = [[[NSMutableArray alloc] initWithCapacity:16] autorelease] ;
 
	NSString * const infoButtonText = @"" ; 
	infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];		

	infoButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14] ;
	
	
	[infoButton setFrame:CGRectMake(280, 370, 20, 20)];
	
	//[infoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[infoButton addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:infoButton];
	}

	[self didSelectViewController];

	[self setTitle:@"Album"];
	

	if (isPad()) {
	 
 
	}
	
    [super viewDidLoad];


	
}

-(id) initWithTabBar {
	if (self = [self init]) {
		self.title = @"Album";
	
	
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
	 

	 

-(void) displayPicture:(id)sender { 

	BOOL exception = NO ;

	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 


	//This is a navigation action  - test
	flickrPhotoViewController *flickrPhotoViewControllerInstance = [[flickrPhotoViewController alloc] init];

	//_id 
	flickrPhotoViewControllerInstance.idQueryParameter = [idArray objectAtIndex:[sender tag]-1000] ;
	//secret 
	flickrPhotoViewControllerInstance.secretQueryParameter = [secretArray objectAtIndex:[sender tag]-1000] ;
	//server 
	flickrPhotoViewControllerInstance.serverQueryParameter = [serverArray objectAtIndex:[sender tag]-1000] ;
	//farm 
	flickrPhotoViewControllerInstance.farmQueryParameter = [farmArray objectAtIndex:[sender tag]-1000] ;
	//_title 
	flickrPhotoViewControllerInstance.titleQueryParameter = [titleArray objectAtIndex:[sender tag]-1000] ;


	flickrPhotoViewControllerInstance.parentController = self ;
	
	self.navigationController.navigationBar.hidden = NO;
	
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"Back";
   	self.navigationItem.backBarButtonItem = backButton;
   	[backButton release];
		
	[self.navigationController pushViewController:flickrPhotoViewControllerInstance animated:YES];
	[flickrPhotoViewControllerInstance release];
	
	
	//TODO implement displayPicture action
	
	
	
}
	
	
	
		
//Action For Image 

 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
	 
 

	 

	 


	
	
		
//Action For Image 

 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
	 
 


-(void) displayInfo:(id)sender { 



	BOOL exception = NO ;
	
	 

	 
	 
	  
	
	
	 

	    
	 
	 
	 
	[self saveValues] ;
	if ([self respondsToSelector:@selector(viewReloadTable)]) {
		[self viewReloadTable] ;
	}
	
	 
	 


	//This is a navigation action  - test
	galleryMDSLViewController *galleryMDSLViewControllerInstance = [[galleryMDSLViewController alloc] init];


	galleryMDSLViewControllerInstance.parentController = self ;
	
	self.navigationController.navigationBar.hidden = NO;
	
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"Back";
   	self.navigationItem.backBarButtonItem = backButton;
   	[backButton release];
		
	[self.navigationController pushViewController:galleryMDSLViewControllerInstance animated:YES];
	[galleryMDSLViewControllerInstance release];
	
	
	//TODO implement displayInfo action
	
	
	
		
}



- (int)selectedRow {
	return currentTableSelectedRow ;
}





- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	kitchensinkAppDelegate *delegate = (kitchensinkAppDelegate *)[[UIApplication sharedApplication] delegate] ;
	[delegate.viewController removeTabBarFromView] ;
	
    


}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];

				
	

	kitchensinkAppDelegate *delegate = (kitchensinkAppDelegate *)[[UIApplication sharedApplication] delegate] ;
	[delegate.viewController addTabBarToView] ;
	
    
}	

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.

		 
 
	[infoButton release]; 


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
