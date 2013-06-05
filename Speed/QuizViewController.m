//
//  QuizViewController.m
//  Speed
//
//  Created by Home on 6/3/13.
//  Copyright (c) 2013 Milan. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // call the init method implemented by the super class
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        manager = [[CLLocationManager alloc] init];
        manager.delegate = self;
        distCount = 0;
        [manager startUpdatingLocation];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation *location in locations) {
        speedDisplay.text = [[NSString alloc] initWithFormat:@"%.02f",location.speed];
        if (distCount == 0) {
            startLat = location.coordinate.latitude;
            startLong = location.coordinate.longitude;
        }
        distCount++;
        double dx = pow(location.coordinate.latitude - startLat, 2);
        double dy = pow(location.coordinate.longitude - startLong, 2);
        double dist = sqrt(dx+dy);
        coordinateDisplay.text = [[NSString alloc] initWithFormat:@"(%.02f, %.02f)",location.coordinate.latitude, location.coordinate.longitude];
        distFromHome.text = [[NSString alloc] initWithFormat:@"%.02f", dist];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
