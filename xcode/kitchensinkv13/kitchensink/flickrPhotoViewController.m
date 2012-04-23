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
#import "flickrPhotoViewController.h"
 
 
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



@implementation flickrPhotoViewController 


	@synthesize parentController ;
    @synthesize flickrPhotoViewIds ;
    @synthesize flickrPhotoViewValues ;

	 

    	// Connection flickr2
         
        	 
	@synthesize getPictureResultSet ;
	@synthesize getPictureRow ;
	@synthesize currentResultSet ; 
	@synthesize currentRow ; 
	@synthesize isRoot ;
	@synthesize isRow ;
	@synthesize isColumn ;
	@synthesize currentProperty;
	@synthesize currentElement;
	@synthesize currentResultSetElement;
	@synthesize currentRowElement;
	
	@synthesize getPictureXMLParser ;  
	
	@synthesize farmQueryParameter ;
	@synthesize serverQueryParameter ;
	@synthesize idQueryParameter ;
	@synthesize secretQueryParameter ;
	



	 
	// Layout : flickrPhotoLayout	 
	@synthesize titleTextField ;
	@synthesize titleTextFieldId ;
	@synthesize titleQueryParameter ;
 
	@synthesize sourceImage ;
	@synthesize sourcePath ;
	
	@synthesize sourceQueryParameter ;
 
	@synthesize widthTextField ;
	@synthesize widthTextFieldId ;
	@synthesize widthQueryParameter ;
 
	@synthesize heightTextField ;
	@synthesize heightTextFieldId ;
	@synthesize heightQueryParameter ;
 
	@synthesize labelTextField ;
	@synthesize labelTextFieldId ;
	@synthesize labelQueryParameter ;
 
	@synthesize mediaTextField ;
	@synthesize mediaTextFieldId ;
	@synthesize mediaQueryParameter ;
 
	@synthesize ownerTextField ;
	@synthesize ownerTextFieldId ;
	@synthesize ownerQueryParameter ;
 
	@synthesize secretTextField ;
	@synthesize secretTextFieldId ;
 
	@synthesize farmTextField ;
	@synthesize farmTextFieldId ;
 
	@synthesize serverTextField ;
	@synthesize serverTextFieldId ;
 
	@synthesize idTextField ;
	@synthesize idTextFieldId ;






     

         
- (NSDictionary *)getPicture:(NSDictionary *)requestParameters parserError:(NSError **)err {

	kitchensinkAppDelegate *appDelegate = (kitchensinkAppDelegate *)[[UIApplication sharedApplication] delegate] ;
    int netStat = [(RootController *)appDelegate.viewController networkStatus] ;
	if (netStat>0) {
	NSURL *url = nil;
	NSMutableString *query = [NSMutableString new] ;

	NSString *connectionPath = [[NSBundle mainBundle] pathForResource:@"connections" ofType:@"plist"];;
	NSDictionary *connections = [NSDictionary dictionaryWithContentsOfFile:connectionPath];
	NSMutableString *endpoint = [[connections objectForKey:@"flickr2_getPicture_url"] mutableCopy];


	//Protocol::: HTTP GET		
	if (requestParameters != nil) 
	{
		id key;
		NSString *comma = @"" ;
		NSString *amp = @"" ;

    	[query appendString:endpoint];
		[query appendString:@"?"];
    	
		
		
    	key = @"farm" ;
    	NSString * farmValue = (NSString *)[requestParameters objectForKey: key];
        NSString *farmDefaultValue = [self retrieveFromUserDefaultsFor:key];
    	if ([farmValue length]>0) {
          	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

            
          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
            NSRange r2 = [query rangeOfString:var2] ;
            if (r2.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[farmValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
                query = [newQuery mutableCopy] ;
			} else { 
            NSRange r = [query rangeOfString:var] ;
            if (r.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:farmValue ] ; 
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
        	if (farmDefaultValue != nil) {
	         	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

	          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
	            NSRange r2 = [query rangeOfString:var2] ;
	            if (r2.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[farmDefaultValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
	                query = [newQuery mutableCopy] ;
				} else { 
	            NSRange r = [query rangeOfString:var] ;
	            if (r.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:farmDefaultValue ] ; 
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
    	key = @"server" ;
    	NSString * serverValue = (NSString *)[requestParameters objectForKey: key];
        NSString *serverDefaultValue = [self retrieveFromUserDefaultsFor:key];
    	if ([serverValue length]>0) {
          	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

            
          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
            NSRange r2 = [query rangeOfString:var2] ;
            if (r2.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[serverValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
                query = [newQuery mutableCopy] ;
			} else { 
            NSRange r = [query rangeOfString:var] ;
            if (r.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:serverValue ] ; 
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
        	if (serverDefaultValue != nil) {
	         	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

	          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
	            NSRange r2 = [query rangeOfString:var2] ;
	            if (r2.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[serverDefaultValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
	                query = [newQuery mutableCopy] ;
				} else { 
	            NSRange r = [query rangeOfString:var] ;
	            if (r.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:serverDefaultValue ] ; 
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
    	key = @"id" ;
    	NSString * idValue = (NSString *)[requestParameters objectForKey: key];
        NSString *idDefaultValue = [self retrieveFromUserDefaultsFor:key];
    	if ([idValue length]>0) {
          	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

            
          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
            NSRange r2 = [query rangeOfString:var2] ;
            if (r2.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[idValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
                query = [newQuery mutableCopy] ;
			} else { 
            NSRange r = [query rangeOfString:var] ;
            if (r.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:idValue ] ; 
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
        	if (idDefaultValue != nil) {
	         	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

	          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
	            NSRange r2 = [query rangeOfString:var2] ;
	            if (r2.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[idDefaultValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
	                query = [newQuery mutableCopy] ;
				} else { 
	            NSRange r = [query rangeOfString:var] ;
	            if (r.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:idDefaultValue ] ; 
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
    	key = @"secret" ;
    	NSString * secretValue = (NSString *)[requestParameters objectForKey: key];
        NSString *secretDefaultValue = [self retrieveFromUserDefaultsFor:key];
    	if ([secretValue length]>0) {
          	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

            
          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
            NSRange r2 = [query rangeOfString:var2] ;
            if (r2.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[secretValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
                query = [newQuery mutableCopy] ;
			} else { 
            NSRange r = [query rangeOfString:var] ;
            if (r.location != NSNotFound) {
                
                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:secretValue ] ; 
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
        	if (secretDefaultValue != nil) {
	         	NSString *var = [NSString stringWithFormat:@"${%@}",key] ;

	          	NSString *var2 = [NSString stringWithFormat:@"+{%@}",key] ;
	            NSRange r2 = [query rangeOfString:var2] ;
	            if (r2.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var2 withString:[secretDefaultValue stringByReplacingOccurrencesOfString:@" " withString:@"+"]] ; 
	                query = [newQuery mutableCopy] ;
				} else { 
	            NSRange r = [query rangeOfString:var] ;
	            if (r.location != NSNotFound) {
	                
	                NSString *newQuery = [query stringByReplacingOccurrencesOfString:var withString:secretDefaultValue ] ; 
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
	self.getPictureResultSet = [[[NSMutableArray  alloc] initWithCapacity:1] autorelease] ;
	NSDictionary *imageRow = [[NSMutableDictionary  alloc] initWithCapacity:1] ;
	[imageRow setObject:[query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forKey:@"source"];
	[self.getPictureResultSet addObject:imageRow] ;
	[imageRow release] ;
	
	NSDictionary *data = nil;
	

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
    	if ([elementName isEqualToString:self.currentRowElement]) {
	  		isRow = YES;
	    	dups = [[NSMutableDictionary alloc] initWithCapacity:32] ;
            self.currentRow = [[NSMutableDictionary alloc] initWithCapacity:16] ;
            [self parserAddEntriesFromDictionary:attributeDict];
    	}
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


- (void)fetchDataFromflickr2:(NSArray *)rows forOperation:(NSString *)operation {



	
	if ([operation isEqualToString:@"getPicture"]) {
	if (rows != nil) {
		if ([rows count]>0) {
		NSString *key = @"" ;
		NSString *subkey = @"" ;
		NSRange r ;
		//Init from Web API Data
		// flickrPhotoLayout 
		//Initializing title	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"title" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
				//titleTextField is declared without data bindings
	 		}

		}			
		//Initializing source
		if ([rows count]>0) {
			
			for (int i = 0 ; i < [rows count] ; i++) {	
				NSDictionary *row = [rows objectAtIndex:i] ;
				id object = nil;
				if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:[[NSNumber numberWithInt:i] stringValue]];
	
					
			key = @"source" ;
			object = [self valueForKey:key inRow:row] ;
	 			
	 		if (object) {
				NSURL *sourceaURL = [NSURL URLWithString:object] ;
				NSData* sourcedata = [NSData dataWithContentsOfURL:sourceaURL];
				sourceImage.image = [UIImage imageWithData:sourcedata];
				[sourceImage setFrame:CGRectMake(sourceImage.frame.origin.x, sourceImage.frame.origin.y, sourceImage.image.size.width ,sourceImage.image.size.height)];
			}

			}
		}			
		//Initializing width	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"width" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
	 			widthTextField.text = object ;
	 		}

		}			
		//Initializing height	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"height" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
	 			heightTextField.text = object ;
	 		}

		}			
		//Initializing label	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"label" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
	 			labelTextField.text = object ;
	 		}

		}			
		//Initializing media	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"media" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
	 			mediaTextField.text = object ;
	 		}

		}			
		//Initializing owner	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"owner" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
	 			ownerTextField.text = object ;
	 		}

		}			
		//Initializing secret	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"secret" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
	 			secretTextField.text = object ;
	 		}

		}			
		//Initializing farm	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"farm" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
	 			farmTextField.text = object ;
	 		}

		}			
		//Initializing server	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"server" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
	 			serverTextField.text = object ;
	 		}

		}			
		//Initializing id	
		if ([rows count]>0) {
			NSDictionary *row = [rows objectAtIndex:0] ;
			id object = nil;
			if ([row objectForKey:@"id"]) [[self identities] setObject:[row objectForKey:@"id"] forKey:@"0"];			

				
			key = @"id" ;
			object = [self valueForKey:key inRow:row] ;
	 			
			if (object) {
	 			idTextField.text = object ;
	 		}

		}			
		
		}
	}
	}
}


-(NSMutableDictionary *) identities {
	return flickrPhotoViewIds ;
}

-(NSMutableDictionary *) values {
	return flickrPhotoViewValues ;
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
			 
    value = titleTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"title"];	 
	
 
    if (sourcePath == nil) sourcePath = @"default.png" ;
	[[self values] setValue:sourcePath forKey:@"source"];
 
    value = widthTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"width"];	 
	
 
    value = heightTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"height"];	 
	
 
    value = labelTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"label"];	 
	
 
    value = mediaTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"media"];	 
	
 
    value = ownerTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"owner"];	 
	
 
    value = secretTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"secret"];	 
	
 
    value = farmTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"farm"];	 
	
 
    value = serverTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"server"];	 
	
 
    value = idTextField.text ;
    if (value == nil) value = @"" ;
	[[self values] setValue:value forKey:@"id"];	 
	
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
	return [flickrPhotoViewValues objectForKey:name];
}

-(NSString *) idForControl:(NSString *)name {
	return [flickrPhotoViewIds objectForKey:name];
}

-(void) setId:(NSString *)identity forControl:(NSString *)name {
	[flickrPhotoViewIds setObject:identity forKey:name] ;
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



	
	if (self.farmQueryParameter == nil) self.farmQueryParameter = @"";
	if (self.serverQueryParameter == nil) self.serverQueryParameter = @"";
	if (self.idQueryParameter == nil) self.idQueryParameter = @"";
	if (self.secretQueryParameter == nil) self.secretQueryParameter = @"";
	NSDictionary *requestParams = [NSDictionary dictionaryWithObjectsAndKeys:self.farmQueryParameter,@"farm",self.serverQueryParameter,@"server",self.idQueryParameter,@"id",self.secretQueryParameter,@"secret",nil];
	[self getPicture:requestParams parserError:nil] ;


	[self fetchDataFromflickr2:self.getPictureResultSet forOperation:@"getPicture"] ;

	if (self.farmQueryParameter == nil) { 
		self.farmQueryParameter = @"";
	} else {
		farmTextField.text = self.farmQueryParameter ;
	}
	if (self.serverQueryParameter == nil) { 
		self.serverQueryParameter = @"";
	} else {
		serverTextField.text = self.serverQueryParameter ;
	}
	if (self.secretQueryParameter == nil) { 
		self.secretQueryParameter = @"";
	} else {
		secretTextField.text = self.secretQueryParameter ;
	}
	

	
	
	
	
     
	 
			
			
	
	
	
	
	
	
	
	
	
	
			

	
	NSArray *rowsflickrPhotoLayoutgetPicture = self.getPictureResultSet;

	if (rowsflickrPhotoLayoutgetPicture != nil) {
		if ([rowsflickrPhotoLayoutgetPicture count]>0) {
		//Init from Data
			for (int i = 0 ; i < [rowsflickrPhotoLayoutgetPicture count] ; i++) {
				NSDictionary *row = [rowsflickrPhotoLayoutgetPicture objectAtIndex:i] ;
				id object = nil;
				object = [row objectForKey:@"title"] ;
				if (object != nil) { 
					self.titleTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"title"];
					[[self values] setValue:(NSString *)object forKey:@"title"];
				}
				object = [row objectForKey:@"width"] ;
				if (object != nil) { 
					self.widthTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"width"];
					[[self values] setValue:(NSString *)object forKey:@"width"];
				}
				object = [row objectForKey:@"height"] ;
				if (object != nil) { 
					self.heightTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"height"];
					[[self values] setValue:(NSString *)object forKey:@"height"];
				}
				object = [row objectForKey:@"label"] ;
				if (object != nil) { 
					self.labelTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"label"];
					[[self values] setValue:(NSString *)object forKey:@"label"];
				}
				object = [row objectForKey:@"media"] ;
				if (object != nil) { 
					self.mediaTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"media"];
					[[self values] setValue:(NSString *)object forKey:@"media"];
				}
				object = [row objectForKey:@"owner"] ;
				if (object != nil) { 
					self.ownerTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"owner"];
					[[self values] setValue:(NSString *)object forKey:@"owner"];
				}
				object = [row objectForKey:@"secret"] ;
				if (object != nil) { 
					self.secretTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"secret"];
					[[self values] setValue:(NSString *)object forKey:@"secret"];
				}
				object = [row objectForKey:@"farm"] ;
				if (object != nil) { 
					self.farmTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"farm"];
					[[self values] setValue:(NSString *)object forKey:@"farm"];
				}
				object = [row objectForKey:@"server"] ;
				if (object != nil) { 
					self.serverTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"server"];
					[[self values] setValue:(NSString *)object forKey:@"server"];
				}
				object = [row objectForKey:@"id"] ;
				if (object != nil) { 
					self.idTextField.text = (NSString *)object; 
					[[self identities] setValue:[row objectForKey:@"id"] forKey:@"id"];
					[[self values] setValue:(NSString *)object forKey:@"id"];
				}
		
				
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
		
    [titleTextField resignFirstResponder];
	
	
    [widthTextField resignFirstResponder];
	
    [heightTextField resignFirstResponder];
	
    [labelTextField resignFirstResponder];
	
    [mediaTextField resignFirstResponder];
	
    [ownerTextField resignFirstResponder];
	
    [secretTextField resignFirstResponder];
	
    [farmTextField resignFirstResponder];
	
    [serverTextField resignFirstResponder];
	
    [idTextField resignFirstResponder];
	
}


// This is where the view is composed programmatically
- (void)viewDidLoad {

	self.flickrPhotoViewIds = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;
	self.flickrPhotoViewValues = [[[NSMutableDictionary  alloc] initWithCapacity:16] autorelease] ;

	BOOL isUserDefault = NO;
	isInitialized = NO ;
	
	
	
	
	
	
	[self.view setBackgroundColor:	
	[UIColor blackColor]
];

	
	
	titleTextField = [[UITextField alloc] init];	
	titleTextField.delegate = self;
	NSString * const titleDefaultText = @"";
	titleTextField.text = titleDefaultText;
	titleTextField.textAlignment = UITextAlignmentRight;
	titleTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[titleTextField setFrame:CGRectMake(10, 50, 300, 30)];
	[titleTextField setFont:[UIFont fontWithName:@"Helvetica-Bold" size:22]];
	titleTextField.textColor = 	
	[UIColor whiteColor]
;
	titleTextField.backgroundColor = 	
	[UIColor blackColor]
;
	titleTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	titleTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//titleTextField.tag = 0;
	titleTextField.clearButtonMode = false;	
	[titleTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(titleTextField)]) { 
			UITextField * tzip = [parentController titleTextField] ;
			titleTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(titleArray)]) { 
			NSString *value = (NSString *)[[parentController titleArray] objectAtIndex:[parentController selectedRow]]  ;
			titleTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"title"] ;	
		titleTextField.text = value ;
		titleTextFieldId = [self retrieveFromUserDefaultsFor:@"titleId"] ; ;
		
	}
	[self.view addSubview:titleTextField];
	
 
	sourceImage = [[UIImageView alloc] init];
	
	
	sourceImage.frame =  CGRectMake(10, 80, sourceImage.image.size.width, sourceImage.image.size.height);
	


	[self.view addSubview:sourceImage];

	
	widthTextField = [[UITextField alloc] init];	
	widthTextField.delegate = self;
	NSString * const widthDefaultText = @"";
	widthTextField.text = widthDefaultText;
	widthTextField.textAlignment = UITextAlignmentRight;
	widthTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[widthTextField setFrame:CGRectMake(-100, -100, 20, 20)];
	[widthTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	widthTextField.textColor = [UIColor blackColor];
	widthTextField.backgroundColor = [UIColor whiteColor];
	widthTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	widthTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//widthTextField.tag = 0;
	widthTextField.clearButtonMode = false;	
	[widthTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(widthTextField)]) { 
			UITextField * tzip = [parentController widthTextField] ;
			widthTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(widthArray)]) { 
			NSString *value = (NSString *)[[parentController widthArray] objectAtIndex:[parentController selectedRow]]  ;
			widthTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"width"] ;	
		widthTextField.text = value ;
		widthTextFieldId = [self retrieveFromUserDefaultsFor:@"widthId"] ; ;
		
	}
	[self.view addSubview:widthTextField];
	

	
	heightTextField = [[UITextField alloc] init];	
	heightTextField.delegate = self;
	NSString * const heightDefaultText = @"";
	heightTextField.text = heightDefaultText;
	heightTextField.textAlignment = UITextAlignmentRight;
	heightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[heightTextField setFrame:CGRectMake(-100, -100, 20, 20)];
	[heightTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	heightTextField.textColor = [UIColor blackColor];
	heightTextField.backgroundColor = [UIColor whiteColor];
	heightTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	heightTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//heightTextField.tag = 0;
	heightTextField.clearButtonMode = false;	
	[heightTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(heightTextField)]) { 
			UITextField * tzip = [parentController heightTextField] ;
			heightTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(heightArray)]) { 
			NSString *value = (NSString *)[[parentController heightArray] objectAtIndex:[parentController selectedRow]]  ;
			heightTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"height"] ;	
		heightTextField.text = value ;
		heightTextFieldId = [self retrieveFromUserDefaultsFor:@"heightId"] ; ;
		
	}
	[self.view addSubview:heightTextField];
	

	
	labelTextField = [[UITextField alloc] init];	
	labelTextField.delegate = self;
	NSString * const labelDefaultText = @"";
	labelTextField.text = labelDefaultText;
	labelTextField.textAlignment = UITextAlignmentRight;
	labelTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[labelTextField setFrame:CGRectMake(-100, -100, 20, 20)];
	[labelTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	labelTextField.textColor = [UIColor blackColor];
	labelTextField.backgroundColor = [UIColor whiteColor];
	labelTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	labelTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//labelTextField.tag = 0;
	labelTextField.clearButtonMode = false;	
	[labelTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(labelTextField)]) { 
			UITextField * tzip = [parentController labelTextField] ;
			labelTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(labelArray)]) { 
			NSString *value = (NSString *)[[parentController labelArray] objectAtIndex:[parentController selectedRow]]  ;
			labelTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"label"] ;	
		labelTextField.text = value ;
		labelTextFieldId = [self retrieveFromUserDefaultsFor:@"labelId"] ; ;
		
	}
	[self.view addSubview:labelTextField];
	

	
	mediaTextField = [[UITextField alloc] init];	
	mediaTextField.delegate = self;
	NSString * const mediaDefaultText = @"";
	mediaTextField.text = mediaDefaultText;
	mediaTextField.textAlignment = UITextAlignmentRight;
	mediaTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[mediaTextField setFrame:CGRectMake(-100, -100, 20, 20)];
	[mediaTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	mediaTextField.textColor = [UIColor blackColor];
	mediaTextField.backgroundColor = [UIColor whiteColor];
	mediaTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	mediaTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//mediaTextField.tag = 0;
	mediaTextField.clearButtonMode = false;	
	[mediaTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(mediaTextField)]) { 
			UITextField * tzip = [parentController mediaTextField] ;
			mediaTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(mediaArray)]) { 
			NSString *value = (NSString *)[[parentController mediaArray] objectAtIndex:[parentController selectedRow]]  ;
			mediaTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"media"] ;	
		mediaTextField.text = value ;
		mediaTextFieldId = [self retrieveFromUserDefaultsFor:@"mediaId"] ; ;
		
	}
	[self.view addSubview:mediaTextField];
	

	
	ownerTextField = [[UITextField alloc] init];	
	ownerTextField.delegate = self;
	NSString * const ownerDefaultText = @"";
	ownerTextField.text = ownerDefaultText;
	ownerTextField.textAlignment = UITextAlignmentRight;
	ownerTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[ownerTextField setFrame:CGRectMake(-100, -100, 20, 20)];
	[ownerTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	ownerTextField.textColor = [UIColor blackColor];
	ownerTextField.backgroundColor = [UIColor whiteColor];
	ownerTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	ownerTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//ownerTextField.tag = 0;
	ownerTextField.clearButtonMode = false;	
	[ownerTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(ownerTextField)]) { 
			UITextField * tzip = [parentController ownerTextField] ;
			ownerTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(ownerArray)]) { 
			NSString *value = (NSString *)[[parentController ownerArray] objectAtIndex:[parentController selectedRow]]  ;
			ownerTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"owner"] ;	
		ownerTextField.text = value ;
		ownerTextFieldId = [self retrieveFromUserDefaultsFor:@"ownerId"] ; ;
		
	}
	[self.view addSubview:ownerTextField];
	

	
	secretTextField = [[UITextField alloc] init];	
	secretTextField.delegate = self;
	NSString * const secretDefaultText = @"";
	secretTextField.text = secretDefaultText;
	secretTextField.textAlignment = UITextAlignmentRight;
	secretTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[secretTextField setFrame:CGRectMake(-100, -100, 20, 20)];
	[secretTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	secretTextField.textColor = [UIColor blackColor];
	secretTextField.backgroundColor = [UIColor whiteColor];
	secretTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	secretTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//secretTextField.tag = 0;
	secretTextField.clearButtonMode = false;	
	[secretTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(secretTextField)]) { 
			UITextField * tzip = [parentController secretTextField] ;
			secretTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(secretArray)]) { 
			NSString *value = (NSString *)[[parentController secretArray] objectAtIndex:[parentController selectedRow]]  ;
			secretTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"secret"] ;	
		secretTextField.text = value ;
		secretTextFieldId = [self retrieveFromUserDefaultsFor:@"secretId"] ; ;
		
	}
	[self.view addSubview:secretTextField];
	

	
	farmTextField = [[UITextField alloc] init];	
	farmTextField.delegate = self;
	NSString * const farmDefaultText = @"";
	farmTextField.text = farmDefaultText;
	farmTextField.textAlignment = UITextAlignmentRight;
	farmTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[farmTextField setFrame:CGRectMake(-100, -100, 20, 20)];
	[farmTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	farmTextField.textColor = [UIColor blackColor];
	farmTextField.backgroundColor = [UIColor whiteColor];
	farmTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	farmTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//farmTextField.tag = 0;
	farmTextField.clearButtonMode = false;	
	[farmTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(farmTextField)]) { 
			UITextField * tzip = [parentController farmTextField] ;
			farmTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(farmArray)]) { 
			NSString *value = (NSString *)[[parentController farmArray] objectAtIndex:[parentController selectedRow]]  ;
			farmTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"farm"] ;	
		farmTextField.text = value ;
		farmTextFieldId = [self retrieveFromUserDefaultsFor:@"farmId"] ; ;
		
	}
	[self.view addSubview:farmTextField];
	

	
	serverTextField = [[UITextField alloc] init];	
	serverTextField.delegate = self;
	NSString * const serverDefaultText = @"";
	serverTextField.text = serverDefaultText;
	serverTextField.textAlignment = UITextAlignmentRight;
	serverTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[serverTextField setFrame:CGRectMake(-100, -100, 20, 20)];
	[serverTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	serverTextField.textColor = [UIColor blackColor];
	serverTextField.backgroundColor = [UIColor whiteColor];
	serverTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	serverTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//serverTextField.tag = 0;
	serverTextField.clearButtonMode = false;	
	[serverTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(serverTextField)]) { 
			UITextField * tzip = [parentController serverTextField] ;
			serverTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(serverArray)]) { 
			NSString *value = (NSString *)[[parentController serverArray] objectAtIndex:[parentController selectedRow]]  ;
			serverTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"server"] ;	
		serverTextField.text = value ;
		serverTextFieldId = [self retrieveFromUserDefaultsFor:@"serverId"] ; ;
		
	}
	[self.view addSubview:serverTextField];
	

	
	idTextField = [[UITextField alloc] init];	
	idTextField.delegate = self;
	NSString * const idDefaultText = @"";
	idTextField.text = idDefaultText;
	idTextField.textAlignment = UITextAlignmentRight;
	idTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[idTextField setFrame:CGRectMake(-100, -100, 20, 20)];
	[idTextField setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	idTextField.textColor = [UIColor blackColor];
	idTextField.backgroundColor = [UIColor whiteColor];
	idTextField.autocorrectionType = UITextAutocorrectionTypeNo;
	idTextField.keyboardType =  UIKeyboardTypeAlphabet;
	//idTextField.tag = 0;
	idTextField.clearButtonMode = false;	
	[idTextField setBorderStyle:UITextBorderStyleNone] ;
	

	
	
	if (parentController != nil) {
		if ([parentController respondsToSelector:@selector(idTextField)]) { 
			UITextField * tzip = [parentController idTextField] ;
			idTextField.text = tzip.text ; 
		}
		if ([parentController respondsToSelector:@selector(idArray)]) { 
			NSString *value = (NSString *)[[parentController idArray] objectAtIndex:[parentController selectedRow]]  ;
			idTextField.text = value ; 
		}
	}
	if (isUserDefault) {
		NSString *value = [self retrieveFromUserDefaultsFor:@"id"] ;	
		idTextField.text = value ;
		idTextFieldId = [self retrieveFromUserDefaultsFor:@"idId"] ; ;
		
	}
	[self.view addSubview:idTextField];
	

	[self didSelectViewController];

	[self setTitle:@"Album"];
	

	 
 
 
 
 
 
 
 
 
 
 
	
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
	 
	 

//Action For Image 

 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 
 
	 



// No Gallery Here





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

		 
	[titleTextField release] ;
	[titleTextFieldId release] ;
 
	[sourceImage release];  sourceImage = nil ;
	[sourcePath release] ; sourcePath = nil ;
	
	
 
	[widthTextField release] ;
	[widthTextFieldId release] ;
 
	[heightTextField release] ;
	[heightTextFieldId release] ;
 
	[labelTextField release] ;
	[labelTextFieldId release] ;
 
	[mediaTextField release] ;
	[mediaTextFieldId release] ;
 
	[ownerTextField release] ;
	[ownerTextFieldId release] ;
 
	[secretTextField release] ;
	[secretTextFieldId release] ;
 
	[farmTextField release] ;
	[farmTextFieldId release] ;
 
	[serverTextField release] ;
	[serverTextFieldId release] ;
 
	[idTextField release] ;
	[idTextFieldId release] ;


	[[NSNotificationCenter defaultCenter] removeObserver:self];


}




- (void)dealloc {
    
	
	[super dealloc];
}




@end
