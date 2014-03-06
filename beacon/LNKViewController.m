//
//  LNKViewController.m
//  beacon
//
//  Created by Nenad VULIC on 05/03/14.
//  Copyright (c) 2014 Nenad VULIC. All rights reserved.
//

#import "LNKViewController.h"
#import "LNKIBeaconManager.h"

@interface LNKViewController (){
    IBOutlet UILabel *beaconslbl;
}

@end

@implementation LNKViewController

- (void)beaconsUpdatedNotification:(NSNotification*)beaconNotification{
    
    beaconslbl.text = [beaconNotification.object description];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beaconsUpdatedNotification:)
                                                 name:kLNKIBeaconUpdatedNotification object:nil];
    
    [[LNKIBeaconManager currentManager] setUuid:@"7CB36A04-A0BB-47CF-9ED8-2E84D350B9BB"];
    [[LNKIBeaconManager currentManager] setIdentifier:@"551920A5-9675-4246-B32D-339A48A59F88"]; //should be the same for all beacons
}

- (IBAction)switchValueChanged:(id)sender{
    UISwitch *sw = (UISwitch*)sender;
    if (sw.isOn){
        [[LNKIBeaconManager currentManager] startAdvertisingAndRanging];
    }else{
        [[LNKIBeaconManager currentManager] stopAdvertisingAndRanging];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
