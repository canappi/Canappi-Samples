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
#import "pickersViewDatePickerController.h"


@implementation pickersViewDatePickerController

@synthesize values ;
@synthesize delegate ;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}



-(id) setMode:(int)m  {
    
    self.values = [NSMutableArray array];
    mode = m;
	return self;
}

-(void) addValue:(NSString *)value {
	[self.values addObject:value] ;
}


-(void) viewDidLoad {
    
    [super viewDidLoad];

    datePicker = [[UIDatePicker alloc] init];
    switch(mode) {
	    case 0 : datePicker.datePickerMode = 	UIDatePickerModeDateAndTime	;
            break;
	    case 1 : datePicker.datePickerMode = 	UIDatePickerModeTime	;
            break;
	    case 2 : datePicker.datePickerMode = 	UIDatePickerModeDate	;
            break;
	    case 3 : datePicker.datePickerMode = 	UIDatePickerModeCountDownTimer	;
            break;
	    default : datePicker.datePickerMode = 	UIDatePickerModeDateAndTime	;
            break;
    }

    datePicker.frame = CGRectMake(0, 0, 210, 200);
    [self.view addSubview:datePicker];
    [datePicker release] ;
    
    UIBarButtonItem *okButton = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleBordered target:self action:@selector(dismissmyDatePickerDatePickerActionSheet:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(dismissmyDatePickerDatePickerActionSheet)];
    
    self.navigationItem.title = @"";
    
    [self.navigationItem setLeftBarButtonItem:cancelButton animated:NO];
    [self.navigationItem setRightBarButtonItem:okButton animated:NO];
    
    [cancelButton release];
    [okButton release];

    
    self.contentSizeForViewInPopover = CGSizeMake(210, 180);
}

- (void)dismissmyDatePickerDatePickerActionSheet:(id)sender {
    
    [delegate dateValueSelected:datePicker];
    
}

- (void)dismissmyDatePickerDatePickerActionSheet {
    
    [delegate dateValueSelected:nil];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    
}


- (void)dealloc {
    self.values = nil;
    self.delegate = nil;
    [super dealloc];
}


@end

