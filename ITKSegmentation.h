//
//  ITKSegmentation.h
//  MSLSMRICornell
//
//  Created by RijianSu on 5/28/16.
//
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

#import "ProjectDebug.h"

#import "ITKImageWrapper.h"
#import "ViewerController.h"

@interface ITKSegmentation : NSObject
{
    ViewerController *mainViewer, *regViewer;
	ITKImageWrapper* itkImage;
	ImageType::PointType	outputOrigin;
	ImageType::SpacingType  outputSpacing;
	ImageType::SizeType		outputSize;
}

- (void) regionGrowing:(long) slice seedPoint:(int[3]) seed name:(NSString*) name color:(NSColor*) color algorithmNumber:(int) algorithmNumber
		lowerThreshold:(float) lowerThreshold upperThreshold:(float) upperThreshold radius:(int[3]) radius confMultiplier:(float) confMultiplier
            iterations:(int) iterations gradient:(float) gradient;

/**
 *	Create with a single viewer
 */
- (id) initWithViewer:(ViewerController*) viewer;

/**
 *	Create with a main display viewer, and a registered viewerer. All segmentation will performed in the registered viewer, but the ROI
 *	will be displayed in the main viewer
 */
- (id) initWithMainViewer:(ViewerController*) mViewer regViewer:(ViewerController*) rViewer;

/**
 *	Used to the change / add a registered viewer
 */
- (void) setRegViewer:(ViewerController*) rViewer;

/**
 * Turn off segmentation using the registered viewer
 */
- (void) removeRegViewer;

/**
 * Searches for the maximum intensity value of the registered viewer starting at the index rIndex (in px)
 * a region of size rSize (in px).
 */
- (float) findMaximum:(int[3]) rIndex region:(int[3]) rSize;


@end
