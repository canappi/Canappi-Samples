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
#import <QuartzCore/QuartzCore.h>
#import "GradientButton.h"
#import "SBJsonParser.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"

#import <SystemConfiguration/SystemConfiguration.h>


@interface flickrViewController : UIViewController  
<
NSXMLParserDelegate
,UITextFieldDelegate>

{

	BOOL isInitialized ;
	BOOL isPresented ;
	
	UIViewController *parentController ;
	NSMutableDictionary *flickrViewIds ;
	NSMutableDictionary *flickrViewValues ;
	 
    	// Connection flickr
         
        	 
	// Operation : getPhotos
	NSMutableArray *getPhotosResultSet ;
	NSMutableDictionary *getPhotosRow ;
	NSMutableArray *currentResultSet ;
	NSMutableDictionary *currentRow ;
	BOOL isRoot ;
	BOOL isRow ;
	BOOL isColumn ;
	NSMutableString *currentProperty;
	NSString *currentElement;
	NSString *currentResultSetElement;
	NSString *currentRowElement;
	NSMutableDictionary *dups ;	
	
	NSXMLParser *getPhotosXMLParser ;
	
	NSString const *getPhotosURLString ;
 
	// Operation : getSizes
	NSMutableArray *getSizesResultSet ;
	NSMutableDictionary *getSizesRow ;
	
	NSXMLParser *getSizesXMLParser ;
	
	NSString *photo_idQueryParameter ;
	NSString const *getSizesURLString ;


	 
	// Layout : flickrLayout	 
	NSMutableArray *flickrGalleryImageArray ; 
	NSMutableArray *flickrGalleryIdArray ; 
	NSMutableArray *flickrGalleryListOfItems ; 
	 
	NSMutableArray *sourceArray ; 
 
	NSMutableArray *widthArray ;
 
	NSMutableArray *heightArray ;
 
	NSMutableArray *labelArray ;
 
	NSMutableArray *mediaArray ;
 
	NSMutableArray *ownerArray ;
 
	NSMutableArray *secretArray ;
 
	NSMutableArray *farmArray ;
 
	NSMutableArray *serverArray ;
 
	NSMutableArray *titleArray ;
 
	NSMutableArray *idArray ;
 
	UIButton *infoButton ; 
	 
 
	UIWebView *mdslWebView ;
	
	 
	// Layout : flickrLayoutIPad	 
 
	
	
	
	
	int currentTableSelectedRow ;
		
	
}

	
	@property (nonatomic,retain) UIViewController *parentController ;
	@property (nonatomic,retain) NSMutableDictionary *flickrViewIds ;
	@property (nonatomic,retain) NSMutableDictionary *flickrViewValues ;
	
	 
	// Layout flickrLayout properties
    	// Connection flickr         
        	 
	//Operation getPhotos Properties
	@property (nonatomic,retain) NSMutableArray *getPhotosResultSet ;
	@property (nonatomic,retain) NSMutableDictionary *getPhotosRow ;	
	@property (nonatomic,retain) NSMutableArray *currentResultSet ;
	@property (nonatomic,retain) NSMutableDictionary *currentRow ;
	@property (nonatomic,assign) BOOL isRoot;
	@property (nonatomic,assign) BOOL isRow;
	@property (nonatomic,assign) BOOL isColumn;
	@property (nonatomic,retain) NSMutableString *currentProperty;
	@property (nonatomic,copy)   NSString *currentElement;
	@property (nonatomic,copy)   NSString *currentResultSetElement;
	@property (nonatomic,copy)   NSString *currentRowElement;
	
	@property (nonatomic,retain) NSXMLParser *getPhotosXMLParser ;  
	
 
	//Operation getSizes Properties
	@property (nonatomic,retain) NSMutableArray *getSizesResultSet ;
	@property (nonatomic,retain) NSMutableDictionary *getSizesRow ;	
	
	@property (nonatomic,retain) NSXMLParser *getSizesXMLParser ;  
	
	@property (nonatomic,copy)   NSString *photo_idQueryParameter ;
	

	 
	// Layout : flickrLayout	 
	//flickrGallery properties
	@property (nonatomic,retain)  NSMutableArray *flickrGalleryImageArray ;
	@property (nonatomic,retain)  NSMutableArray *flickrGalleryIdArray ;
	@property (nonatomic,retain)  NSMutableArray *flickrGalleryListOfItems ; 

	
	 
	@property (nonatomic,retain) NSMutableArray *sourceArray ; 
	
 
	@property (nonatomic,retain) NSMutableArray *widthArray ;
	
 
	@property (nonatomic,retain) NSMutableArray *heightArray ;
	
 
	@property (nonatomic,retain) NSMutableArray *labelArray ;
	
 
	@property (nonatomic,retain) NSMutableArray *mediaArray ;
	
 
	@property (nonatomic,retain) NSMutableArray *ownerArray ;
	
 
	@property (nonatomic,retain) NSMutableArray *secretArray ;
	
 
	@property (nonatomic,retain) NSMutableArray *farmArray ;
	
 
	@property (nonatomic,retain) NSMutableArray *serverArray ;
	
 
	@property (nonatomic,retain) NSMutableArray *titleArray ;
	
 
	@property (nonatomic,retain) NSMutableArray *idArray ;
	
 
	@property (nonatomic,retain,readonly)  UIButton *infoButton ;
	 
 
	@property (nonatomic,retain,readonly)  UIWebView *mdslWebView ;
	
	 
	 
 
	



	

-(id) initWithTabBar ;
-(void) selectViewController ;
-(void) didSelectViewController;
-(NSString*)retrieveFromUserDefaultsFor:(NSString*)key ;
-(NSString *) textValueForControl:(NSString *)name ;
-(NSString *) idForControl:(NSString *)name ;
-(NSMutableDictionary *) identities ;
-(NSMutableDictionary *) values ;
-(NSString *) getDocumentDirectory;
- (id)valueForKey:(NSString *)key inRow:(NSDictionary *)row ;
- (void)addParsedValue:(id)value toArray:(NSMutableArray *)dataArray ;
- (int)selectedRow ;

@end
