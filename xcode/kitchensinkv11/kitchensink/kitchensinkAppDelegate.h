#import <UIKit/UIKit.h>

@class RootController;

@interface kitchensinkAppDelegate : NSObject <UIApplicationDelegate, UINavigationControllerDelegate> {
    UIWindow *window;
    RootController *viewController;
    
    UINavigationController *navigationController;	
    
    UIView *splashScreenView ;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RootController *viewController;
@property (nonatomic, retain) UINavigationController *navigationController;	



- (void) loadRootController ;

@end
