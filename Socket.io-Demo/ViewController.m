//
//  ViewController.m
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/3.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "ViewController.h"
#import "SocketIOPacket.h"

@interface ViewController ()<SocketIODelegate>
{
    NSMutableString * resultString;
    SocketIO *socketIO;
}
@end


@implementation ViewController
@synthesize resultTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    socketIO = [[SocketIO alloc] initWithDelegate:self];
    resultString = [[NSMutableString alloc] initWithCapacity:10];

}

-(void)setServiceUrl
{
    self.serviceUrl=@"localhost";
}

- (IBAction)login:(id)sender {
    UIAlertView * nameAlert = [[UIAlertView alloc] initWithTitle:@"Welcome to ChatRoom"
                                                         message:@"Who are you" delegate:self cancelButtonTitle:nil
                                               otherButtonTitles:@"OK", nil];
    
    nameAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [nameAlert show];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString * inputName = [alertView textFieldAtIndex:0].text;
    [socketIO connectToHost:@"localhost" onPort:8124];
    NSDictionary * hello = [NSDictionary dictionaryWithObjectsAndKeys:inputName,@"name", nil];
    [socketIO sendEvent:@"addme" withData:inputName ];
    
}


-(void) updateResult{
    resultTextView.text = resultString;
}

#pragma SocketIO Delegate
- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet{

    
    //packet.name
    if ([packet.name isEqualToString:@"chat"]) {
        NSDictionary * stringData = (NSDictionary *) [NSJSONSerialization JSONObjectWithData:
                                                      [packet.data dataUsingEncoding:NSUTF8StringEncoding] options:
                                                      NSJSONReadingMutableContainers error:NULL];
        
        NSArray * messageData = [stringData objectForKey:@"args"];
        
        [resultString appendFormat:@"%@ say %@\n",messageData[0],messageData[1]];

        NSLog(@"*********************************\n%@\n*****************************",stringData);

    }
    [self updateResult];
}

-(IBAction)handleSendMessageData:(id)sender
{
    UITextField *textField=(UITextField *)sender;
    
//    NSDictionary * hello = [NSDictionary dictionaryWithObjectsAndKeys:inputName,@"name", nil];
    
//    NSDictionary *dataDic=@{@"lat":@"120.01",@"lon":@"46.23"};
    [socketIO sendEvent:@"sendchat" withData:textField.text];
}

-(void)uitTest
{
    for(int i=0;i<100;i++)
    {
        NSString *test=[NSString stringWithFormat:@"%d",i];
        [socketIO sendEvent:@"sendchat" withData:test];

    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
