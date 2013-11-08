//
//  BLCAppDelegate.h
//  BeaconOSX
//
//  Created by Matthew Robinson on 1/11/2013.
//  Copyright (c) 2013 Blended Cocoa. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BLCAppDelegate : NSObject <NSApplicationDelegate, NSTextFieldDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *lblUuid;
@property (weak) IBOutlet NSTextField *lblMajor;
@property (weak) IBOutlet NSTextField *lblMinor;
@property (weak) IBOutlet NSTextField *lblBroadcasting;

@end
