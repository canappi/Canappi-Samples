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


@interface flickrPhotoViewController : UIViewController  
<
NSXMLParserDelegate
,UITextFieldDelegate>

{

	BOOL isInitialized ;
	BOOL isPresented ;
	
	UIViewController *parentController ;
	NSMutableDictionary *flickrPhotoViewIds ;
	NSMutableDictionary *flickrPhotoViewValues ;
	 
    	// Connection flickr2
         
        	 
	// Operation : getPicture
	NSMutableArray *getPictureResultSet ;
	NSMutableDictionary *getPictureRow ;
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
	
	NSXMLParser *getPictureXMLParser ;
	
	NSString *farmQueryParameter ;
	NSString *serverQueryParameter ;
	NSString *idQueryParameter ;
	NSString *secretQueryParameter ;
	NSString const *getPictureURLString ;


	 
	// Layout : flickrPhotoLayout	 
	UITextField *titleTextField ; 
	NSString *titleTextFieldId ;
		NSString * const titleDefaultText ; 
	
	NSString *titleQueryParameter ;
 
	UIImageView *sourceImage ; 
	NSString *sourcePath ;
	
	
	NSString *sourceQueryParameter ;
 
	UITextField *widthTextField ; 
	NSString *widthTextFieldId ;
		NSString * const widthDefaultText ; 
	
	NSString *widthQueryParameter ;
 
	UITextField *heightTextField ; 
	NSString *heightTextFieldId ;
		NSString * const heightDefaultText ; 
	
	NSString *heightQueryParameter ;
 
	UITextField *labelTextField ; 
	NSString *labelTextFieldId ;
		NSString * const labelDefaultText ; 
	
	NSString *labelQueryParameter ;
 
	UITextField *mediaTextField ; 
	NSString *mediaTextFieldId ;
		NSString * const mediaDefaultText ; 
	
	NSString *mediaQueryParameter ;
 
	UITextField *ownerTextField ; 
	NSString *ownerTextFieldId ;
		NSString * const ownerDefaultText ; 
	
	NSString *ownerQueryParameter ;
 
	UITextField *secretTextField ; 
	NSString *secretTextFieldId ;
		NSString * const secretDefaultText ; 
	
 
	UITextField *farmTextField ; 
	NSString *farmTextFieldId ;
		NSString * const farmDefaultText ; 
	
 
	UITextField *serverTextField ; 
	NSString *serverTextFieldId ;
		NSString * const serverDefaultText ; 
	
 
	UITextField *idTextField ; 
	NSString *idTextFieldId ;
		NSString * const idDefaultText ; 
	
	
	
	
	
		
	
}

	
	@property (nonatomic,retain) UIViewController *parentController ;
	@property (nonatomic,retain) NSMutableDictionary *flickrPhotoViewIds ;
	@property (nonatomic,retain) NSMutableDictionary *flickrPhotoViewValues ;
	
	 
	// Layout flickrPhotoLayout properties
    	// Connection flickr2         
        	 
	//Operation getPicture Properties
	@property (nonatomic,retain) NSMutableArray *getPictureResultSet ;
	@property (nonatomic,retain) NSMutableDictionary *getPictureRow ;	
	@property (nonatomic,retain) NSMutableArray *currentResultSet ;
	@property (nonatomic,retain) NSMutableDictionary *currentRow ;
	@property (nonatomic,assign) BOOL isRoot;
	@property (nonatomic,assign) BOOL isRow;
	@property (nonatomic,assign) BOOL isColumn;
	@property (nonatomic,retain) NSMutableString *currentProperty;
	@property (nonatomic,copy)   NSString *currentElement;
	@property (nonatomic,copy)   NSString *currentResultSetElement;
	@property (nonatomic,copy)   NSString *currentRowElement;
	
	@property (nonatomic,retain) NSXMLParser *getPictureXMLParser ;  
	
	@property (nonatomic,copy)   NSString *farmQueryParameter ;
	
	@property (nonatomic,copy)   NSString *serverQueryParameter ;
	
	@property (nonatomic,copy)   NSString *idQueryParameter ;
	
	@property (nonatomic,copy)   NSString *secretQueryParameter ;
	

	 
	// Layout : flickrPhotoLayout	 
	@property (nonatomic,retain,readonly)  UITextField *titleTextField ;
	@property (nonatomic,copy)    NSString *titleTextFieldId ;
	@property (nonatomic,copy)   NSString *titleQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UIImageView *sourceImage ;
	@property (nonatomic,copy)    NSString *sourcePath ;
	
	@property (nonatomic,copy) NSString *sourceQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UITextField *widthTextField ;
	@property (nonatomic,copy)    NSString *widthTextFieldId ;
	@property (nonatomic,copy)   NSString *widthQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UITextField *heightTextField ;
	@property (nonatomic,copy)    NSString *heightTextFieldId ;
	@property (nonatomic,copy)   NSString *heightQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UITextField *labelTextField ;
	@property (nonatomic,copy)    NSString *labelTextFieldId ;
	@property (nonatomic,copy)   NSString *labelQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UITextField *mediaTextField ;
	@property (nonatomic,copy)    NSString *mediaTextFieldId ;
	@property (nonatomic,copy)   NSString *mediaQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UITextField *ownerTextField ;
	@property (nonatomic,copy)    NSString *ownerTextFieldId ;
	@property (nonatomic,copy)   NSString *ownerQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UITextField *secretTextField ;
	@property (nonatomic,copy)    NSString *secretTextFieldId ;
 
	@property (nonatomic,retain,readonly)  UITextField *farmTextField ;
	@property (nonatomic,copy)    NSString *farmTextFieldId ;
 
	@property (nonatomic,retain,readonly)  UITextField *serverTextField ;
	@property (nonatomic,copy)    NSString *serverTextFieldId ;
 
	@property (nonatomic,retain,readonly)  UITextField *idTextField ;
	@property (nonatomic,copy)    NSString *idTextFieldId ;
	



	

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

@end
