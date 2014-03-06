//
//  LNKIBeaconManager.h
//  beacon
//
//  Created by Nenad VULIC on 06/03/14.
//  Copyright (c) 2014 Nenad VULIC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLNKIBeaconUpdatedNotification @"com.linkie.beacon.update"


@import CoreLocation;
@import CoreBluetooth;

@interface LNKIBeaconManager : NSObject <CLLocationManagerDelegate, CBPeripheralManagerDelegate> {
    CLLocationManager   *_locationManager;
    CLBeaconRegion      *_beaconRegion;
    CBPeripheralManager *_peripheralManager;
    
    NSArray             *_detectedBeacons;
    
    NSString            *_uuid;
    NSString            *_identifier;
}

@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *identifier;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLBeaconRegion *beaconRegion;
@property (nonatomic, strong) CBPeripheralManager *peripheralManager;
@property (nonatomic, strong) NSArray *detectedBeacons;

+ (id)currentManager;

- (void) startAdvertisingAndRanging;
- (void) stopAdvertisingAndRanging;

@end