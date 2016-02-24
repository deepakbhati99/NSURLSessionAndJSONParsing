//
//  DetailViewController.m
//  NSURLSessionTutorial
//
//  Created by Himanshu Khatri on 2/23/16.
//  Copyright © 2016 bdAppManiac. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
@interface DetailViewController ()
@end
NSString *const kUsername = @"bdAppManiac";

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem description] stringByAppendingString:@"\nLOADING DATA. . . "];

        
        // Prepare the URL that we'll get the country info data from.
        NSString *URLString = [NSString stringWithFormat:@"http://api.geonames.org/countryInfoJSON?username=%@&country=%@", kUsername, self.detailItem[@"code"]];
        NSURL *url = [NSURL URLWithString:URLString];
        
        [AppDelegate downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
            // Check if any data returned.
            if (data != nil) {
                // Convert the returned data into a dictionary.
                NSError *error;
                NSMutableDictionary *returnedDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                
                if (error != nil) {
                    NSLog(@"%@", [error localizedDescription]);
                }
                else{
                    NSDictionary *countryDetailsDictionary = [[returnedDict objectForKey:@"geonames"] objectAtIndex:0];
                    
                    // Set the country name to the respective label.
                    self.detailDescriptionLabel.text = [NSString stringWithFormat:@"%@ \n\n Json:-\n%@",[self.detailItem description],countryDetailsDictionary.description];
                    

                }
            }
        }];

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
