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


@interface standardButtonView2Controller : UIViewController  
<
NSXMLParserDelegate
>

{

	BOOL isInitialized ;
	BOOL isPresented ;
	
	UIViewController *parentController ;
	NSMutableDictionary *standardButtonView2Ids ;
	NSMutableDictionary *standardButtonView2Values ;
	 
	 
	// Layout : standardButtonLayout	 
	UIButton *mybuttonButton ; 
 
	UIButton *mybutton1Button ; 
 
	UIButton *mybutton2Button ; 
 
	UIButton *mybutton3Button ; 
 
	UIButton *mybutton5Button ; 
 
	UIButton *mybutton6Button ; 
 
	UIButton *infoButton ; 
 
	UIButton *addButton ; 
	 
 
 
 
 
 
 
	UIWebView *mdslWebView ;
 
	
	 
	// Layout : standardButtonLayoutIPad	 
 
 
 
 
 
 
 
	
	
	
	
		
	
}

	
	@property (nonatomic,retain) UIViewController *parentController ;
	@property (nonatomic,retain) NSMutableDictionary *standardButtonView2Ids ;
	@property (nonatomic,retain) NSMutableDictionary *standardButtonView2Values ;
	
	 
	// Layout standardButtonLayout properties
	 
	 
	@property (nonatomic,retain,readonly)  UIButton *mybuttonButton ;
 
	@property (nonatomic,retain,readonly)  UIButton *mybutton1Button ;
 
	@property (nonatomic,retain,readonly)  UIButton *mybutton2Button ;
 
	@property (nonatomic,retain,readonly)  UIButton *mybutton3Button ;
 
	@property (nonatomic,retain,readonly)  UIButton *mybutton5Button ;
 
	@property (nonatomic,retain,readonly)  UIButton *mybutton6Button ;
 
	@property (nonatomic,retain,readonly)  UIButton *infoButton ;
 
	@property (nonatomic,retain,readonly)  UIButton *addButton ;
	 
 
 
 
 
 
 
	@property (nonatomic,retain,readonly)  UIWebView *mdslWebView ;
 
	
	 
	// Layout : standardButtonLayoutIPad	 
 
 
 
 
 
 
 
	



	

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
