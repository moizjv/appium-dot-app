//
//  AppiumAndroidPreferencesPopOverControllerWindowController.m
//  Appium
//
//  Created by Dan Cuellar on 4/22/14.
//  Copyright (c) 2014 Appium. All rights reserved.
//

#import "AppiumAppDelegate.h"
#import "AppiumMonitorWindowController.h"
#import "AppiumMonitorWindowPopOverViewController.h"
#import "AppiumMonitorWindowPopOverButton.h"

@class AppiumAppDelegate;
@class AppiumMonitorWindowController;

@interface AppiumMonitorWindowPopOverViewController ()

@end

@implementation AppiumMonitorWindowPopOverViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
    }
	
    return self;
}

-(void) close
{
	if (self.popover.isShown) {
		[self.popover close];
	}
}

-(IBAction)toggle:(id)sender
{
	if (!self.popover.isShown) {
		// close all popovers
		AppiumMonitorWindowController *monitorWindow = ((AppiumAppDelegate*)[NSApplication sharedApplication].delegate).mainWindowController;
		[monitorWindow closeAllPopovers];
		
		// open the popover
		[self.popover showRelativeToRect:[(NSView*)sender bounds]
								  ofView:sender
						   preferredEdge:NSMaxYEdge];
	} else {
		// close the popover
		[self.popover close];
	}
}

@end
