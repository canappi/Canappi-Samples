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
#import "twitterViewController.h"
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
@synthesize twitterViewControllerInstance ;
@synthesize aboutViewControllerInstance ;

@synthesize tabBarController;
 


- (void)viewDidLoad {
    	
	[self startApp];
	[super viewDidLoad];
	
}

-(void) startApp {
	
	
	self.tabBarController = [[UITabBarController alloc] init];
	
	CGRect tabBarFrame;
    if (isPad()) {
        tabBarFrame = CGRectMake(0, 0, 768, 1024-20);
    } else {
        tabBarFrame = CGRectMake(0, 0, 320, 480-20);
    }
	self.tabBarController.view.frame = tabBarFrame;
	self.tabBarController.delegate = self;
	 
	
	NSMutableArray *localControllersArray = [[NSMutableArray alloc] initWithCapacity:4];
	UINavigationController *localNavigationController;

	
	self.homeViewControllerInstance = [[homeViewController alloc] initWithTabBar];
	
	localNavigationController = [[UINavigationController alloc] initWithRootViewController:self.homeViewControllerInstance];
	[localControllersArray addObject:localNavigationController];
	localNavigationController.navigationBar.tintColor = [UIColor colorWithRed:168.0/255.0 green:200.0/255.0 blue:30.0/255.0
	         alpha:1.0]
 ;
	
	localNavigationController.navigationBar.translucent = YES;	
	[localNavigationController release];
	self.youTubeViewControllerInstance = [[youTubeViewController alloc] initWithTabBar];
	
	localNavigationController = [[UINavigationController alloc] initWithRootViewController:self.youTubeViewControllerInstance];
	[localControllersArray addObject:localNavigationController];
	localNavigationController.navigationBar.tintColor = [UIColor colorWithRed:168.0/255.0 green:200.0/255.0 blue:30.0/255.0
	         alpha:1.0]
 ;
	
	localNavigationController.navigationBar.translucent = YES;	
	[localNavigationController release];
	self.twitterViewControllerInstance = [[twitterViewController alloc] initWithTabBar];
	
	localNavigationController = [[UINavigationController alloc] initWithRootViewController:self.twitterViewControllerInstance];
	[localControllersArray addObject:localNavigationController];
	localNavigationController.navigationBar.tintColor = [UIColor colorWithRed:168.0/255.0 green:200.0/255.0 blue:30.0/255.0
	         alpha:1.0]
 ;
	
	localNavigationController.navigationBar.translucent = YES;	
	[localNavigationController release];
	self.aboutViewControllerInstance = [[aboutViewController alloc] initWithTabBar];
	
	localNavigationController = [[UINavigationController alloc] initWithRootViewController:self.aboutViewControllerInstance];
	[localControllersArray addObject:localNavigationController];
	localNavigationController.navigationBar.tintColor = [UIColor colorWithRed:168.0/255.0 green:200.0/255.0 blue:30.0/255.0
	         alpha:1.0]
 ;
	
	localNavigationController.navigationBar.translucent = YES;	
	[localNavigationController release];

		
	self.tabBarController.viewControllers = localControllersArray;
	[localControllersArray release];
	
	self.tabBarController.view.tag = 1;
	[self.tabBarController.view setHidden:NO];

	[self.tabBarController setSelectedIndex:2] ;
	
	if ([UITabBar instancesRespondToSelector:@selector(setTintColor:)])
	{
    	[self.tabBarController.tabBar setTintColor:[UIColor blackColor]];
	}

	
	[self.view addSubview:self.tabBarController.view];
		
	self.navigationController.navigationBar.hidden = YES;
}

- (void) removeTabBarFromView {
    CGRect tabBarFrame;
    if (isPad()) {
        tabBarFrame = CGRectMake(0, 0, 768, 1100);
    } else {
        tabBarFrame = CGRectMake(0, 0, 320, 530);
    }
    self.tabBarController.view.frame = tabBarFrame  ;
}

- (void) addTabBarToView {
    CGRect tabBarFrame;
    if (isPad()) {
        tabBarFrame = CGRectMake(0, 0, 768, 1024-20);
    } else {
        tabBarFrame = CGRectMake(0, 0, 320, 480-20);
    }
    self.tabBarController.view.frame = tabBarFrame  ;
}



- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController 
{

	if ([viewController.title isEqualToString:@"Kitchen Sink"]) [homeViewControllerInstance selectViewController];
	if ([viewController.title isEqualToString:@"Tutorials"]) [youTubeViewControllerInstance selectViewController];
	if ([viewController.title isEqualToString:@"Twitter"]) [twitterViewControllerInstance selectViewController];
	if ([viewController.title isEqualToString:@"About ..."]) [aboutViewControllerInstance selectViewController];

			
}



- (NetworkStatus)networkStatus {
    
    if (!network) network = [[Reachability reachabilityWithHostName: @"www.canappi.com"] retain];
    
    NetworkStatus netStatus = [network currentReachabilityStatus];
    
    switch (netStatus)
    {
        case NotReachable:
        {
            NSLog(@"Access Not Available");
            break;
        }
            
        case ReachableViaWWAN:
        {
            NSLog(@"Reachable WWAN");
            break;
        }
        case ReachableViaWiFi:
        {
            NSLog(@"Reachable WiFi");
            break;
        }
    }
    return netStatus ;
    
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
	[twitterViewControllerInstance release];
	//twitterViewControllerInstance = nil;
	[aboutViewControllerInstance release];
	//aboutViewControllerInstance = nil;

	[super dealloc];
}


@end



