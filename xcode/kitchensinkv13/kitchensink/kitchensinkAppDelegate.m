
#import "kitchensinkAppDelegate.h"
#import "RootController.h"

#import "twitterViewController.h"  

@implementation kitchensinkAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize navigationController;



#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

	
	if (isPad()) {
        splashScreenView = [[UIView alloc] initWithFrame:CGRectMake(0,0,768,1024)];        
    }
	else {
        splashScreenView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,480)];
    } 
	
	splashScreenView.backgroundColor = [UIColor blackColor];
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:splashScreenView.bounds];
	UIImage *image =[UIImage imageNamed:@"canappi.png"];
	[imageView setImage:image];
	[splashScreenView addSubview:imageView];
	[imageView release] ;
		
	[window addSubview:splashScreenView];
	

    [self.window makeKeyAndVisible];

 	
	[self performSelector:@selector(loadRootController) withObject:nil afterDelay:2];


    return YES;
}

-(void) loadRootController{
	
    
	[splashScreenView removeFromSuperview];
	[splashScreenView release];
	
	
    
	RootController *rootController = [[RootController alloc] init]; 
	self.viewController = rootController;
	[rootController release] ;

	self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
	[self.navigationController setDelegate:self];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	[window addSubview:[self.navigationController view]];
	
	
		
}

- (void) removeNavigationController {
    [[self.navigationController view] removeFromSuperview] ;
    [self.window makeKeyAndVisible];

}

- (void) addNavigationController {
    
	[window addSubview:[self.navigationController view]];
    [self.window makeKeyAndVisible];
   
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    
    
    
    [super dealloc];
}


@end
