//
//  QuizViewController.h
//  Speed
//
//  Created by Home on 6/3/13.
//  Copyright (c) 2013 Milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface QuizViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *manager;
    double distCount;
    double startLat;
    double startLong;
    
    // The view object
    IBOutlet UILabel *speedDisplay;
    IBOutlet UILabel *coordinateDisplay;
    IBOutlet UILabel *distFromHome;
}
@end
