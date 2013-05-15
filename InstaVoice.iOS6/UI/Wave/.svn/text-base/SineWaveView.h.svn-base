//
//  SineWaveView.h
//  ShapeLayerTest
//
//  Created by Duncan Champney on 8/1/11.
//  Copyright 2011 WareTo. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 This class implements a gadget that displays a sine wave animation with varing amplitude. To use it, 
 add the files SineWaveView.h and SineWaveView.m to your project. You also need to include the file 
 lineSettings.plist. That file specfiies the line colors, thicknesses, and opacities for the lines 
 that are combined to create a soft-edged sine wave shape.

 To use this control in a view controller, #import SineWaveView.h in the view controller's .m file
 Then, in the nib file for the view controller, create a UIView object, and use the identity inspector
 to change the class of the object to SineWaveVIew. 
 
 The SineWaveView will size itself to fit the rectagle you create in Interface Builder.
 To start animating the sine wave, start a timer that fires every 1/8 second or so. The interval 
 should be an even fraction of a second.
 
 Smaller intervals
 will create a more responsive animation, but slower devices like the 3GS might not be able to keep
 up with shorter animation steps.
 
 In the timer function, set this object's amplitude property to a value from 0.0 to 1.0, and call 
 animateWithDuration:, passing in the timer interval. The timer interval and animation duration should be
 constant.
 */

typedef struct 
{
  CGPoint start;
  CGPoint ctrl1;
  CGPoint ctrl2;
  CGPoint end;
} bezierControlPoints;

//DMC testing
//#define wave1Count 3
//#define wave2Count 3 
//#define wave3Count 4  
//#define wave1Count 6
//#define wave2Count 6 
//#define wave3Count 8

#define wavelength 109

@interface SineWaveView : UIView 
{
//  bezierControlPoints wave1[wave1Count];
//  bezierControlPoints wave2[wave2Count];
//  bezierControlPoints wave3[wave3Count];
  
//  bezierControlPoints* waves[3];
//  NSUInteger waveCounts[3];
  
  CGFloat phase;			
  CGFloat amplitude;	
//  CGPathRef oldPath;
//	int layerCount;
  CALayer *waveLayer;
  long int tickCount;

}

@property (nonatomic) CGFloat phase;			//This value contols the starting point of each sine wave. At 0, 
                                          //the sine wave starts Just off the left edge of the view. 
                                          //As the value increases, the sine wave shifts further to the left.
                                          //Valid values range from 0 to 1.

@property (nonatomic) CGFloat amplitude;;	//The value determines the height of the sine waves. At a value 
                                          //of 1, the sine waves reaches the top of the view. at a value of 
                                          //0, the sine waves are flat. Valid values range from 0 to 1.

@property (nonatomic, retain) UIColor* glowColor;
@property (nonatomic, retain) UIColor* lineColor;
@property (nonatomic) long int tickCount;

//-----------------------------------------------------------------------------------------------------------
#pragma mark - instance methods
//-----------------------------------------------------------------------------------------------------------

//This method creates an animation with the specified duration that sets the sine waves to the current 
//phase value and amplitude.

- (void) animateWithDuration: (CGFloat) duration;

- (CGFloat) randomFloat: (CGFloat) max_value;

- (CGFloat) randomFloatPlusOrMinus: (CGFloat) max_value;


//-----------------------------------------------------------------------------------------------------------

//This method is really only for testing, and is no longer used.

- (void) beginAnimating;

//-----------------------------------------------------------------------------------------------------------

/*
 This method builds an array of bezier control points to be used to construct a CGPath.
 It builds 1 more sine wave than is ever displayed on-screen, to allow the wave to be shifted based on the "phase" value."
*/

- (void) buildControlPoints: (bezierControlPoints[]) controlPoints 
                      count: (NSUInteger) count 
               currentPhase: (CGFloat) currentPhase 
                  currentAmplitude: (CGFloat) amplitude;

//The following methods are used internally, and normally won't need to be called from outside.
//-----------------------------------------------------------------------------------------------------------
- (void) updateWaves;

//-----------------------------------------------------------------------------------------------------------
//Call this method when it's time to stop animating the sine wave. It does cleanup.

- (void) removeAnimations;

//-----------------------------------------------------------------------------------------------------------


//This method takes the control points from wave1, wave2, and wave3 and returns a CGPathRef

//- (CGPathRef) newWavePath;

- (void) doInitSetup;

@end
