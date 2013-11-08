//
//  BLCAppDelegate.m
//  BeaconOSX
//
//  Created by Matthew Robinson on 1/11/2013.
//  Copyright (c) 2013 Blended Cocoa. All rights reserved.
//

#import "BLCAppDelegate.h"

#import <IOBluetooth/IOBluetooth.h>

#import "BLCBeaconAdvertisementData.h"

@interface BLCAppDelegate () <CBPeripheralManagerDelegate>

@property (nonatomic,strong) CBPeripheralManager *manager;
@property (nonatomic,strong) NSUUID *uuid;

@end

@implementation BLCAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    [self.lblBroadcasting setHidden:YES];
    
    _manager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                       queue:nil];
    _uuid = [[NSUUID alloc] initWithUUIDString:@"A6C4C5FA-A8DD-4BA1-B9A8-A240584F02D3"];
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        [self startBeacon];
        [self.lblUuid setStringValue:[_uuid UUIDString]];
    }
}


- (void)controlTextDidChange:(NSNotification *)notification{
    NSLog(@"text change %@", self.lblMajor);
    [self.lblBroadcasting setHidden:YES];
    [_manager stopAdvertising];
    [self startBeacon];
}

- (void) startBeacon {
    [self.lblBroadcasting setHidden:NO];
    
    uint16_t major = [self.lblMajor stringValue].intValue;
    uint16_t minor = [self.lblMinor stringValue].intValue;
    
    
    BLCBeaconAdvertisementData *beaconData = [[BLCBeaconAdvertisementData alloc] initWithProximityUUID:_uuid major:major minor:minor measuredPower:-59];
    
    [_manager startAdvertising:beaconData.beaconAdvertisement];
}

@end
