//
//  SetWindowController.h
//  MSLSMRICornell
//
//  Created by RijianSu on 5/20/16.
//
//

#import <Cocoa/Cocoa.h>
#import "OsiriXAPI/ViewerController.h"
#import "ProjectDebug.h"

@interface SetWindowController : NSWindowController{
    
    ViewerController *mainViewer, *registeredViewer;
	//ITKRegionGrowing3D* segmenter;
    bool seedPointSelected;
}
@property (readonly) ViewerController* mainViewer;
@property (readonly) ViewerController* registeredViewer;

/**
 *	Instantiates the class, loads the window nib file, and creates the segmentation object for the viewer combination
 */
- (id) initWithMainViewer:(ViewerController*) mViewer registeredViewer:(ViewerController*) rViewer;

/**
 *	Returns a dictionary with the factory defaults used by the application
 */
- (NSMutableDictionary*) getDefaults;

@end
