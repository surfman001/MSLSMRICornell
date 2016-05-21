//
//  MSLSMRICornellFilter.m
//  MSLSMRICornell
//
//  Copyright (c) 2016 Rijian. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MSLSMRICornellFilter.h"
#import "SetWindowController.h"
@implementation MSLSMRICornellFilter

- (void) initPlugin
{
}

- (long) filterImage:(NSString*) menuName
{
    NSLog(@"dispfilterimage");
    SetWindowController *setWindow = [MSLSMRICornellFilter getControllerForMainViewer:viewerController registeredViewer:[viewerController blendedWindow]];
    if (setWindow==nil)
    {
        NSLog(@"setWindowNil");
        setWindow = [[SetWindowController alloc]initWithMainViewer:viewerController registeredViewer:viewerController];
        
    }
    else
    {
        NSLog(@"setWindowNotNil");
        [setWindow showWindow:self];
        
    }
    return 0;
}

+ (id) getControllerForMainViewer:(ViewerController*) mViewer registeredViewer:(ViewerController*) rViewer
{
	NSArray *winList = [NSApp windows];
	int i=0;
	for( id loopItem in winList)
	{
		i++;
        NSLog(@"%iloopItem%@",i,loopItem);
        if( [[[loopItem windowController] windowNibName] isEqualToString:@"SetWindowController"])
		{
			if( [[loopItem windowController] mainViewer] == mViewer &&
			   [[loopItem windowController] registeredViewer] == rViewer)
			{
				NSLog(@"itis nViewer");
                DebugLog(@"Found an existing segmentation window controller, just using that");
				return [loopItem windowController];
			}
            else
            {
                NSLog(@"itisn't nViewer");
            }
		}
	}
	
	return nil;
}

@end
