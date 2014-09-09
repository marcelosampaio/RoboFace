//
//  ViewController.m
//  RoboFace
//
//  Created by Marcelo Sampaio on 9/8/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize refreshOutlet;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadRandomImage];
    
}

#pragma mark - Working Methods
-(void)loadRandomImage {
    // Random set
    int randomSet=arc4random()%3;
    randomSet++;
    
    // Generate a random value to the roboFace
    long randomNumber=arc4random() % 99999999;
    if (randomNumber<0) {
        randomNumber=randomNumber * -1;
    }
    
    NSString *urlString=[NSString stringWithFormat:@"http://robohash.org/%ld.png?set=set%d",randomNumber,randomSet];
    
    // Load image from web
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    self.imageView.image=[UIImage imageWithData:data];
    
    NSLog(@"url = %@",urlString);

}

#pragma mark - UI Actions
- (IBAction)refresh:(id)sender {
    [self loadRandomImage];
}


@end
