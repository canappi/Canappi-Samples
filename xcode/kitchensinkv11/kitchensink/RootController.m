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
#import "RootController.h"
#import "homeViewController.h"
#import "youTubeViewController.h"
#import "aboutViewController.h"



#ifndef IS_PAD
#define IS_PAD
BOOL isPad() {
#ifdef UI_USER_INTERFACE_IDIOM
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
#else
    return NO;
#endif
}
#endif

@implementation RootController
@synthesize homeViewControllerInstance ;
@synthesize youTubeViewControllerInstance ;
@synthesize aboutViewControllerInstance ;

 


- (void)viewDidLoad {
    	
	[self startApp];
	[super viewDidLoad];
	
}

-(void) startApp {
	
	
	UITabBarController *tabBarController;
	tabBarController = [[UITabBarController alloc] init];
	
	CGRect tabBarFrame;
    if (isPad()) {
        tabBarFrame = CGRectMake(0, 0, 768, 1024-20);
    } else {
        tabBarFrame = CGRectMake(0, 0, 320, 480-20);
    }
	tabBarController.view.frame = tabBarFrame;
	tabBarController.delegate = self;
	 
	
	NSMutableArray *localControllersArray = [[NSMutableArray alloc] initWithCapacity:4];
	UINavigationController *localNavigationController;

	
	
	self.homeViewControllerInstance = [[homeViewController alloc] initWithTabBar];
	
	localNavigationController = [[UINavigationController alloc] initWithRootViewController:self.homeViewControllerInstance];
	[localControllersArray addObject:localNavigationController];
	
	//localNavigationController.navigationBar.tintColor = [UIColor colorWithRed: 0.36 green: 0.24 blue: 0.36 alpha: 1.000];
	
	localNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	// release since we are done with this for now
	[localNavigationController release];
	self.youTubeViewControllerInstance = [[youTubeViewController alloc] initWithTabBar];
	
	localNavigationController = [[UINavigationController alloc] initWithRootViewController:self.youTubeViewControllerInstance];
	[localControllersArray addObject:localNavigationController];
	
	//localNavigationController.navigationBar.tintColor = [UIColor colorWithRed: 0.36 green: 0.24 blue: 0.36 alpha: 1.000];
	
	localNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	// release since we are done with this for now
	[localNavigationController release];
	self.aboutViewControllerInstance = [[aboutViewController alloc] initWithTabBar];
	
	localNavigationController = [[UINavigationController alloc] initWithRootViewController:self.aboutViewControllerInstance];
	[localControllersArray addObject:localNavigationController];
	
	//localNavigationController.navigationBar.tintColor = [UIColor colorWithRed: 0.36 green: 0.24 blue: 0.36 alpha: 1.000];
	
	localNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	// release since we are done with this for now
	[localNavigationController release];

		
	tabBarController.viewControllers = localControllersArray;
	[localControllersArray release];
	
	tabBarController.view.tag = 1;
	[self.view addSubview:tabBarController.view];
	[tabBarController.view setHidden:NO];
	
	self.navigationController.navigationBar.hidden = YES;
}




- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController 
{

	if ([viewController.title isEqualToString:@"Kitchen Sink"]) [homeViewControllerInstance didSelectViewController];
	if ([viewController.title isEqualToString:@"Tutorials"]) [youTubeViewControllerInstance didSelectViewController];
	if ([viewController.title isEqualToString:@"About ..."]) [aboutViewControllerInstance didSelectViewController];

			
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	
	[super viewDidUnload];
}


- (void)dealloc {
    
	[homeViewControllerInstance release];
	//homeViewControllerInstance = nil;
	[youTubeViewControllerInstance release];
	//youTubeViewControllerInstance = nil;
	[aboutViewControllerInstance release];
	//aboutViewControllerInstance = nil;

	[super dealloc];
}


@end



