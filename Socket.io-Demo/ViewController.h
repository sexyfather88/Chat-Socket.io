//
//  ViewController.h
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/3.
//  Copyright © 2017年 Wilson. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SocketIO.h"

@interface ViewController : UIViewController<SocketIODelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;

-(void)setServiceUrl;

@property(nonatomic,strong) NSString *serviceUrl;

@end
