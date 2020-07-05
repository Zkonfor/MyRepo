
#import "TokenViewController.h"

@interface TokenViewController ()
@end

@implementation TokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismiss:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [self.activityIndicator startAnimating];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self getTokenDataFromNetworkWithDataBlock:^(NSString *dataMessage) {
        [self->_activityIndicator stopAnimating];
        [self->_textLabel setText: dataMessage];
    
    } withErrorBlock:^(NSString *errorMessage, NSError *error) {
        [self->_activityIndicator stopAnimating];
        [self->_textLabel setText: errorMessage];
        NSLog(@"Error Message: %@", errorMessage);
        if (error != nil) {
            NSLog(@"More Data on Error: %@", error);
        }
    }];
}


- (void)getTokenDataFromNetworkWithDataBlock:(void (^ __nullable)(NSString *dataMessage))dataBlock withErrorBlock: (void (^ __nullable)(NSString *errorMessage, NSError *error))errorBlock {
    
    NSString *getTokenURL= @"Some Dummy URL";
    
    if (getTokenURL == nil) {
        errorBlock(@"Unable to get proper URL", nil);
    } else {
        
        NSMutableURLRequest *getTokenRequest = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:getTokenURL]];
        if([[TapestryShell sharedShell] settings].ssoEnable)
        {
            [getTokenRequest setValue:[TapestryShell sharedShell].currentDevice.actualDeviceID  forHTTPHeaderField:@"deviceId"];
            [getTokenRequest setValue:[[TapestryShell sharedShell] settings].featureEnabledDate forHTTPHeaderField:@"appRelease"];
            [getTokenRequest setValue:@"true" forHTTPHeaderField:@"sso_token"];
        }
        [getTokenRequest setTimeoutInterval:[TapestryShell sharedShell].settings.requestTimeoutSeconds];
        
        [[TapestryServices shared] serviceCallUsingMutableRequest:getTokenRequest];
        NSData *data = [[TapestryServices shared] _data];
        NSError *error = [[TapestryServices shared] _error];
        
        if (data) {
            
// if the recieved data is a dictionary
            
            NSDictionary* jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"Token returned data is %@",jsonDictionary);
            
            if (![jsonDictionary isKindOfClass:[NSDictionary class]]) {
                errorBlock(@"There was an error retrieving the Token", error);
                return;
            }
            
            NSString *dealerCode =[jsonDictionary objectForKey:@"dealerCode"];
            NSString *tokenCode =[jsonDictionary objectForKey:@"pseudoUserId"];
            NSString *passCode =[jsonDictionary objectForKey:@"tokenPasscode"];
            
            if([dealerCode class]== [NSNull class] || [dealerCode length]==0)
                dealerCode=@"Not available";
            
            if([tokenCode class]== [NSNull class] || [tokenCode length]==0)
                tokenCode=@"Not available";
            
            if([passCode class]== [NSNull class] || [passCode length]==0)
                passCode=@"Not available";
            
            //need to do this on main thread
            NSString* dataMessage = [NSString stringWithFormat:@"Dealer Code: %@\nToken Code: %@\nPasscode: %@", dealerCode, tokenCode, passCode];
            dataBlock(dataMessage);
            
        } else {
            errorBlock(@"There was an error retrieving the Token", error);
        }
    }
    
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (BOOL)shouldAutorotate {
    return ![TapestryShell sharedShell].settings.kioskMode;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [TapestryShell sharedShell].settings.kioskMode ? UIInterfaceOrientationMaskLandscape : UIInterfaceOrientationMaskAll;
}

@end
