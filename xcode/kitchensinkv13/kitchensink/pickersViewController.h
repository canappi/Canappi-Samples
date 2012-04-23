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
#import "pickersViewPickerController.h"
#import "pickersViewDatePickerController.h"

#import <SystemConfiguration/SystemConfiguration.h>


@interface pickersViewController : UIViewController  
<
NSXMLParserDelegate,UIPickerViewDataSource, UIPickerViewDelegate
,UITextFieldDelegate,UITextFieldDelegate>

{

	BOOL isInitialized ;
	BOOL isPresented ;
	
	UIViewController *parentController ;
	NSMutableDictionary *pickersViewIds ;
	NSMutableDictionary *pickersViewValues ;
	 
	 
	// Layout : pickersLayout	 
	UIButton *myPickerPicker ; 
	UIPickerView *myPickerPickerView;
	NSMutableArray *myPickerArray ; 
	NSString *myPickerPickerId ;
	NSMutableArray *myPickerList ;
    UIActionSheet *myPickerPickerActionSheet ;
    pickersViewPickerController *myPickerValuePicker ; 
    
	NSString *myPickerQueryParameter ;
 
	UITextField *eventTitleTextField ; 
	NSString *eventTitleTextFieldId ;
		NSString * const eventTitlePlaceHolderText ; 
	
	NSString *eventTitleQueryParameter ;
 
	UIDatePicker *myDatePickerDatePicker ; 
	UIButton *myDatePickerPickerButton ;
	UITextField *myDatePickerPickerDay ;
	UITextField *myDatePickerPickerTime ; 	
	UITextField *myDatePickerDateTime ;
	UITextField *myDatePickerDateDay ;
	UIActionSheet *myDatePickerDatePickerActionSheet;	
    pickersViewDatePickerController *myDatePickerValueDatePicker ; 
 
	UIButton *myCheckboxCheckBoxButton ; 
	UILabel *myCheckboxCheckBoxLabel ; 
	NSString * const myCheckboxCheckBoxText ; 
	BOOL myCheckboxSelected ;
	
	NSString *myCheckboxQueryParameter ;
 
	UIButton *r1RadioButton ; 
	UILabel *r1RadioButtonLabel ; 
	NSString * const r1RadioButtonText ; 
	
	NSString *r1QueryParameter ;
 
	UIButton *r2RadioButton ; 
	UILabel *r2RadioButtonLabel ; 
	NSString * const r2RadioButtonText ; 
	
	NSString *r2QueryParameter ;
 
	UIButton *r3RadioButton ; 
	UILabel *r3RadioButtonLabel ; 
	NSString * const r3RadioButtonText ; 
	
	NSString *r3QueryParameter ;
 
	UIButton *infoButton ; 
	
	
	
	NSMutableArray *radioButtons ;
	NSMutableArray *radioButtonValues ;
	NSString *radioButtonValue ;
	UIPopoverController *pickersViewValuePickerPopover ;
	UIButton *currentPicker ; 
	UIPopoverController *pickersViewValueDatePickerPopover ;
	UITextField *currentDate ; 
	UITextField *currentTime ; 
	
		
	
}

	
	@property (nonatomic,retain) UIViewController *parentController ;
	@property (nonatomic,retain) NSMutableDictionary *pickersViewIds ;
	@property (nonatomic,retain) NSMutableDictionary *pickersViewValues ;
	
	 
	// Layout pickersLayout properties
	 
	 
	@property (nonatomic,retain,readonly)  UIButton *myPickerPicker ;
	@property (nonatomic,retain,readonly)  UIPickerView *myPickerPickerView;
	@property (nonatomic,copy)    NSString *myPickerPickerId ;
	@property (nonatomic,retain)  NSMutableArray *myPickerArray ;
	@property (nonatomic,retain)  NSMutableArray *myPickerList ;
    @property (nonatomic,retain)  UIActionSheet *myPickerPickerActionSheet ;
    @property (nonatomic, assign)  pickersViewPickerController *myPickerValuePicker ; 
	@property (nonatomic,copy)    NSString *myPickerQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UITextField *eventTitleTextField ;
	@property (nonatomic,copy)    NSString *eventTitleTextFieldId ;
	@property (nonatomic,copy)   NSString *eventTitleQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UIDatePicker *myDatePickerDatePicker ;
	@property (nonatomic,retain,readonly)  UIButton *myDatePickerPickerButton ;
	@property (nonatomic,retain,readonly)  UITextField *myDatePickerPickerDay ;
	@property (nonatomic,retain,readonly)  UITextField *myDatePickerPickerTime ;
	@property (nonatomic,retain,readonly)  UIActionSheet *myDatePickerDatePickerActionSheet;	
    @property (nonatomic, assign)  pickersViewDatePickerController *myDatePickerValueDatePicker ; 
	@property (nonatomic,copy)    NSString *myDatePickerQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UIButton *myCheckboxCheckBoxButton ;
	@property (nonatomic,retain,readonly)  UILabel *myCheckboxCheckBoxLabel ; 
	@property (assign) BOOL myCheckboxSelected ;
	@property (nonatomic,copy)    NSString *myCheckboxQueryParameter ;
 
	@property (nonatomic,retain,readonly)  UIButton *r1RadioButton ;
	@property (nonatomic,retain,readonly)  UILabel *r1RadioButtonLabel ; 
	@property (nonatomic,copy)   NSString *r1QueryParameter ;
 
	@property (nonatomic,retain,readonly)  UIButton *r2RadioButton ;
	@property (nonatomic,retain,readonly)  UILabel *r2RadioButtonLabel ; 
	@property (nonatomic,copy)   NSString *r2QueryParameter ;
 
	@property (nonatomic,retain,readonly)  UIButton *r3RadioButton ;
	@property (nonatomic,retain,readonly)  UILabel *r3RadioButtonLabel ; 
	@property (nonatomic,copy)   NSString *r3QueryParameter ;
 
	@property (nonatomic,retain,readonly)  UIButton *infoButton ;
	

	
	@property (nonatomic,retain)  NSMutableArray *radioButtons ;
	@property (nonatomic,retain)  NSMutableArray *radioButtonValues ;
	@property (nonatomic,copy)  NSString *radioButtonValue ;

	@property (nonatomic,retain) UIPopoverController *pickersViewValuePickerPopover ;
	@property (nonatomic,retain) UIButton *currentPicker ;

	@property (nonatomic,retain) UIPopoverController *pickersViewValueDatePickerPopover ;
	@property (nonatomic,retain) UITextField *currentDate ;
	@property (nonatomic,retain) UITextField *currentTime ;
	

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
