//
//  SetWindowController.m
//  MSLSMRICornell
//
//  Created by RijianSu on 5/20/16.
//
//
#import "MSLSMRICornellFilter.h"
#import "SetWindowController.h"
#import "OsiriXAPI/ROI.h"
//Default ROI color
static char color_default[] = {0x04, 0x0b, 0x73, 0x74, 0x72, 0x65, 0x61, 0x6d, 0x74, 0x79, 0x70, 0x65,
    0x64, 0x81, 0xe8, 0x03, 0x84, 0x01, 0x40, 0x84, 0x84, 0x84, 0x07, 0x4e, 0x53, 0x43, 0x6f, 0x6c,
    0x6f, 0x72, 0x00, 0x84, 0x84, 0x08, 0x4e, 0x53, 0x4f, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x00, 0x85,
    0x84, 0x01, 0x63, 0x01, 0x84, 0x04, 0x66, 0x66, 0x66, 0x66, 0x83, 0x4e, 0x5a, 0xda, 0x3d, 0x83,
    0x26, 0xeb, 0x36, 0x3e, 0x83, 0x6d, 0x0a, 0x63, 0x3f, 0x01, 0x86};

@implementation SetWindowController

@synthesize mainViewer, registeredViewer;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        NSLog(@"initwithwindows");
        // Initialization code here.
    }
    return self;
}
- (id) initWithMainViewer:(ViewerController*) mViewer registeredViewer:(ViewerController*) rViewer
{
    [[NSUserDefaultsController sharedUserDefaultsController] setInitialValues:[self getDefaults]];
	NSLog(@"dispinitmainviewer");
	self = [super initWithWindowNibName:@"SetWindowController"];
	if(self != nil)
	{

		mainViewer = mViewer;
		registeredViewer = rViewer;
		seedPointSelected = NO;
		
		[self showWindow:self];
/*
		if(registeredViewer != nil)
			segmenter = [[ITKRegionGrowing3D alloc] initWithMainViewer:mainViewer regViewer:registeredViewer];
		else
			segmenter = [[ITKRegionGrowing3D alloc] initWithViewer:mainViewer];
		
		[mainViewerLabel setStringValue:[[mainViewer window] title]];
		
		if(registeredViewer != nil)
		{
			[regViewerLabel setStringValue:[[registeredViewer window] title]];
		}
		else
		{
			[enableRegViewerButton setState:NSOffState];
			[enableRegViewerButton setEnabled:NO];
		}
		
		//remove any haning ROIs
		[self removeMaxRegionROI];
		[self removeSeedPointROI];
		
		//make sure we catch the necessary notifications
		NSNotificationCenter *nc;
		nc = [NSNotificationCenter defaultCenter];
		[nc addObserver: self
			   selector: @selector(mouseViewerDown:)
				   name: @"mouseDown"
				 object: nil];
		
		[nc addObserver: self
			   selector: @selector(CloseViewerNotification:)
				   name: @"CloseViewerNotification"
				 object: nil];
        
		algorithms = [NSArray arrayWithObjects: @"Connected Threshold",
					  @"Neighborhood Connected",
					  @"Confidence Connected",
					  @"Gradient Thresholding",
					  nil];
		
		//initialize the rest of the interface (fill algorithm pop up, set correct tab)
		[self fillAlgorithmsPopUp];
		[self updateAlgorithm:self];
		[self manualRadioSelChanged:self];*/
		
	}
	else
		NSLog(@"Error loading the region growing window nib!");
	
	return self;

}
/*- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}*/

- (NSMutableDictionary*) getDefaults
{
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
	[defaults setValue:@"Segmented Region" forKey:@"NMSegRoiLabel"];
	[defaults setValue:@"45.0"	forKey:@"NMSegCutOffPercent"];
	[defaults setValue:@"70.0"	forKey:@"NMSegSearchRegion"];
	[defaults setValue:@"1"		forKey:@"NMSegNHRadiusX"];
	[defaults setValue:@"1"		forKey:@"NMSegNHRadiusY"];
	[defaults setValue:@"1"		forKey:@"NMSegNHRadiusZ"];
	[defaults setValue:@"1"		forKey:@"NMSegManualSeg"];
	[defaults setValue:@"0"		forKey:@"NMSegAlgorithm"];
	[defaults setValue:@"2"		forKey:@"NMSegConfRadiusX"];
	[defaults setValue:@"2"		forKey:@"NMSegConfRadiusY"];
	[defaults setValue:@"2"		forKey:@"NMSegConfRadiusZ"];
	[defaults setValue:@"2.5"	forKey:@"NMSegConfMultiplier"];
	[defaults setValue:@"5"		forKey:@"NMSegConfIterations"];
	[defaults setValue:@"8.0"	forKey:@"NMSegGradient"];
	[defaults setValue:@"30"	forKey:@"NMSegMaxVolumeSize"];
	[defaults setValue:@"1"		forKey:@"NMSegShowSeed"];
	[defaults setValue:@"1"		forKey:@"NMSegShowMaxRegion"];
	[defaults setValue:@"1"		forKey:@"NMSegDisableClick"];
	[defaults setValue:[NSData dataWithBytes:color_default length:71] forKey:@"NMSegColor"];
    
	return defaults;
}


@end
