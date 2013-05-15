//
//  SineWaveView.m
//  ShapeLayerTest
//
//  Created by Duncan Champney on 8/1/11.
//  Copyright 2011 WareTo. All rights reserved.
//

#import "SineWaveView.h"
#import <QuartzCore/QuartzCore.h>


#define threeLayers 1

//#ifdef threeLayers
//  #define layerCount 3
//#else
//  #define layerCount 10
//#endif

#define interval .125


@implementation SineWaveView


@synthesize phase;
@synthesize amplitude;
@synthesize glowColor;
@synthesize lineColor;
@synthesize tickCount;

//-----------------------------------------------------------------------------------------------------------
#pragma mark - property methods
//-----------------------------------------------------------------------------------------------------------

- (void) setPhase: (CGFloat) newValue
{
  phase = newValue;
}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - instance methods
//-----------------------------------------------------------------------------------------------------------

- (CGFloat) screenScale;
{
  return [[UIScreen mainScreen] scale];
}

//-----------------------------------------------------------------------------------------------------------

- (CGFloat) randomFloat: (CGFloat) max_value;
{
	CGFloat aRandom = (arc4random() % 1000000001);
	aRandom = (aRandom * max_value) / 1000000000;
	return aRandom;
}

- (CGFloat) randomFloatPlusOrMinus: (CGFloat) max_value;
{
	CGFloat aRandom = [self randomFloat: max_value*2] - max_value;
	return aRandom;
}


- (void) beginAnimating;
{
  [NSTimer scheduledTimerWithTimeInterval: interval 
                                   target: self 
                                 selector: @selector(animateWaves:) 
                                 userInfo: nil 
                                  repeats: YES];
}

//-----------------------------------------------------------------------------------------------------------

- (void) buildControlPoints: (bezierControlPoints[]) controlPoints 
                      count: (NSUInteger) count 
               currentPhase: (CGFloat) currentPhase 
           currentAmplitude: (CGFloat) currentAmplitude;
{
  //  int outset = 7;
  int outset = 0;//dmc testing
  
  NSUInteger index;
  CGPoint origin;
  
  
  CGRect myFrame = self.frame;
  
  //Calculate the width of 1 full sine wave
  //DMC testing
  //  CGFloat waveWidth = (myFrame.size.width+ 2*outset) / (count-2);
  CGFloat waveWidth = (wavelength*3 +2*outset) / (count-2);
  
  
  origin.x = -outset - currentPhase * waveWidth;
  origin.y = self.frame.size.height/2;
  
  for (index = 0; index < count; index++)
  {
    controlPoints[index].start.x = origin.x + index * waveWidth;
    controlPoints[index].start.y = origin.y;
    
    controlPoints[index].ctrl1.x = controlPoints[index].start.x + waveWidth*15/32;
    controlPoints[index].ctrl1.y = origin.y - myFrame.size.height*1.1*currentAmplitude;
    
    controlPoints[index].ctrl2.x = controlPoints[index].start.x + waveWidth*17/32;
    controlPoints[index].ctrl2.y = origin.y + myFrame.size.height*1.1*currentAmplitude;
    
    controlPoints[index].end.x = controlPoints[index].start.x + waveWidth;
    controlPoints[index].end.y = origin.y;
  }
}
//-----------------------------------------------------------------------------------------------------------

- (void) animateWithDuration: (CGFloat) duration;
{
  static BOOL show_time = FALSE;
  NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate];
  static NSTimeInterval old_time;
  if (tickCount == 0)
    old_time = [NSDate timeIntervalSinceReferenceDate];
  
  if (show_time)
  {
  if (tickCount && tickCount %30 == 0)
    printf("time = %.5f. average time = %.5f\n", time, (time-old_time)/tickCount);
  }
  tickCount++;
  CGFloat phase_step = duration/2;
  //  CAShapeLayer* curveLayer;
  //  self.phase = 0;//DMC testing
  float newPhase = self.phase + phase_step;
  static BOOL firstTime = TRUE;
  CATransform3D transform;
  CGFloat offset;
  CGFloat waveLayerWidth;
  
  static CGFloat oldPhase = -1;
  static CGFloat oldAmplitude;
  
  waveLayerWidth = wavelength * 3;
  
  
  
  if (firstTime)
  {
    firstTime = FALSE;
    newPhase = self.phase + phase_step;
    transform = CATransform3DIdentity;
  }
  
  
  
  while (newPhase > 1.0)
    newPhase = newPhase - 1.0;
  //    DLog(@"In animate. duration = %f. newPhase = %f", duration, newPhase);
  self.phase = newPhase;
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
  
  animation.duration = duration;
  animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  
  
  animation.autoreverses = NO;
//  animation.fillMode = kCAFillModeForwards;
//  animation.removedOnCompletion = NO;
  
  if (oldPhase == -1)
  {
    transform = CATransform3DIdentity;
  }
  else if (oldPhase == 1)
  {
    transform = CATransform3DMakeScale(1.0, oldAmplitude, 1.0);
    transform = CATransform3DTranslate(transform, 0, 0, 0);
  }
  else 
  {
    transform = CATransform3DMakeScale(1.0, oldAmplitude, 1.0);
    offset = -0.5 * waveLayerWidth * oldPhase;
    transform = CATransform3DTranslate(transform, offset, 0, 0);
  }
  animation.fromValue = [NSValue valueWithCATransform3D:transform];
  
  transform = CATransform3DMakeScale(1.0, amplitude, 1.0);
  //printf("amplitude = %.3f\n", amplitude);
  offset = -0.5 * waveLayerWidth * self.phase;

  transform = CATransform3DTranslate(transform, offset, 0, 0);

  animation.toValue = [NSValue valueWithCATransform3D:transform];
  
  if (TRUE)
  {
    [CATransaction begin];
    {
      [CATransaction setValue: [NSNumber numberWithBool: YES]
                       forKey: kCATransactionDisableActions];
      
      waveLayer.transform = transform;
    }
    [CATransaction commit];

    [waveLayer addAnimation: animation forKey: nil]; 
  }
  else 
  {
    self.backgroundColor = [UIColor redColor];
  }
  
//  if (oldPhase == 1.0)
//  {
//    [CATransaction begin];
//    {
//      
//      [CATransaction setValue: [NSNumber numberWithBool: YES]
//                       forKey: kCATransactionDisableActions];
//      transform = CATransform3DMakeScale(1.0, oldAmplitude, 1.0);
//      offset = 0;
//      transform = CATransform3DTranslate(transform, offset, 0, 0);
//      
//      waveLayer.transform = transform;
//    }
//    [CATransaction commit];
//  }
//  
//  [CATransaction begin];
//  {
//    
//    [CATransaction setValue: [NSNumber numberWithFloat: duration]
//                     forKey: kCATransactionAnimationDuration];
//    [CATransaction setAnimationTimingFunction: [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear]];
//    
//    transform = CATransform3DMakeScale(1.0, amplitude, 1.0);
//    offset = -0.5 * waveLayerWidth * self.phase;
//    transform = CATransform3DTranslate(transform, offset, 0, 0);
//    
//    waveLayer.transform = transform;
//  }
//  [CATransaction commit];
  oldPhase = self.phase;
  oldAmplitude = amplitude;
  //  printf("amplitude = %.3f\n", amplitude);
  //printf("phase = %.3f\n", self.phase);
  
}

//-----------------------------------------------------------------------------------------------------------

- (void) animateWaves: (NSTimer*) timer;
{
  [self animateWithDuration: interval];
}

//-----------------------------------------------------------------------------------------------------------

- (void) updateWaves;
{
}

//-----------------------------------------------------------------------------------------------------------

//This method takes the control points from wave1, wave2, and wave3 and returns a CGPathRef

//- (CGPathRef) newWavePath;
//
//{
//  NSUInteger index;
//  CGFloat oneThird = 1.0/3.0;
//  NSUInteger wavesIndex;
//  CGMutablePathRef wavePath;
//  wavePath = CGPathCreateMutable();
//  
//  static CGFloat maxAmplitude = 0;
//  
//  if (amplitude > maxAmplitude)
//  {
//    maxAmplitude = amplitude;
//    NSLog(@"Max amplitude = %.3f", maxAmplitude);
//  }
//  
//  for (wavesIndex = 0; wavesIndex <3; wavesIndex++)
//  {
//    [self buildControlPoints: waves[wavesIndex] count: waveCounts[wavesIndex] 
//                currentPhase: phase + oneThird * wavesIndex 
//            currentAmplitude: amplitude];
//    //    [self buildControlPoints: waves[wavesIndex] count: waveCounts[wavesIndex] 
//    //                currentPhase: phase + oneThird * wavesIndex 
//    //            currentAmplitude: 1.0];
//    for (index = 0; index < waveCounts[wavesIndex]; index++)
//    {
//      if (FALSE)
//      {
//        DLog(@"outer wave count = %d. Inner wave count = %d", wavesIndex, index);
//        DLog(@"start = (%f, %f). ctrl1 = (%f, %f) ctrl2 = (%f, %f). End = (%f, %f)", 
//             waves[wavesIndex][index].start.x, waves[wavesIndex][index].start.y,
//             waves[wavesIndex][index].ctrl1.x,   waves[wavesIndex][index].ctrl1.y,
//             waves[wavesIndex][index].ctrl2.x,   waves[wavesIndex][index].ctrl2.y,
//             waves[wavesIndex][index].end.x, waves[wavesIndex][index].end.y);
//      }
//      
//      CGPathMoveToPoint(wavePath, nil, waves[wavesIndex][index].start.x, waves[wavesIndex][index].start.y);
//      CGPathAddCurveToPoint(wavePath, nil, 
//                            waves[wavesIndex][index].ctrl1.x,   waves[wavesIndex][index].ctrl1.y,
//                            waves[wavesIndex][index].ctrl2.x,   waves[wavesIndex][index].ctrl2.y,
//                            waves[wavesIndex][index].end.x, waves[wavesIndex][index].end.y);
//    }
//  }
//  return wavePath;
//}

//-----------------------------------------------------------------------------------------------------------
//Call this method when it's time to stop animating the sine wave. It does cleanup.

- (void) removeAnimations;
{
  [waveLayer removeAllAnimations];
}

//- (NSString*) getDocumentDirectory;
//{
//	NSString *documentsDirectory = 
//	[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//	return documentsDirectory;
//}

//- (void) captureWave;
//{
//  NSLog(@"in $%s", __PRETTY_FUNCTION__);
//  UIGraphicsBeginImageContext(self.bounds.size);
//  [self.layer renderInContext:UIGraphicsGetCurrentContext()];
//  
//  UIImage *waveImage = UIGraphicsGetImageFromCurrentImageContext();
//  UIGraphicsEndImageContext();
//  NSString *documentsDir = [self getDocumentDirectory];
//  NSString *path = [documentsDir stringByAppendingPathComponent: @"wave.PNG"];
//  NSData *waveData = UIImagePNGRepresentation(waveImage);
//  [waveData writeToFile: path atomically: TRUE];
//}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - object lifecycle  methods
//-----------------------------------------------------------------------------------------------------------

- (void) doInitSetup
{
//  NSString* lineSettingsKey;
  
//  //Read in the "lineSettings.plist" file with line color, line sizes, and line opacities
//  NSString* a_path = [[NSBundle mainBundle] pathForResource:@"lineSettings" ofType: @"plist"];
//  NSDictionary* settingsDict = [NSDictionary dictionaryWithContentsOfFile:a_path];
//  
//  //  lineSettingsKey = @"lineSettings";
//  
//  if ([self screenScale] > 1.0)
//    lineSettingsKey = @"lineSettings";
//  else
//    lineSettingsKey = @"lineSettings_nonRetina";
//  NSDictionary* lineSettings = [settingsDict objectForKey: lineSettingsKey];
//  
//  NSDictionary* glowColorDict = [lineSettings objectForKey: @"glowColor"];
//  CGFloat red = [[glowColorDict objectForKey: @"red"] intValue] / 255.0;
//  CGFloat green = [[glowColorDict objectForKey: @"green"] intValue] / 255.0;
//  CGFloat blue = [[glowColorDict objectForKey: @"blue"] intValue] / 255.0;
//  
//  NSDictionary* lineColorDict = [lineSettings objectForKey: @"lineColor"];
//  
//  red = [[lineColorDict objectForKey: @"red"] intValue] / 255.0;
//  green = [[lineColorDict objectForKey: @"green"] intValue] / 255.0;
//  blue = [[lineColorDict objectForKey: @"blue"] intValue] / 255.0;    
//  self.glowColor = [UIColor colorWithRed: red 
//                                   green: green 
//                                    blue: blue alpha:1.0];
//  
//  
//  NSArray* lineOpacities = [lineSettings objectForKey: @"opacity"];
//  NSArray* lineSizes = [lineSettings objectForKey: @"thickness"];
//  layerCount = [lineSizes count];
//  //  layerCount = 1; //DMC testing
//  
//  DLog(@"opacities = %@",lineOpacities);
//  DLog(@"lineSizes = %@",lineSizes);
//  
//  //#ifdef threeLayers
//  //  CGFloat sizes[] =     {1.0,   3,    5};
//  //  CGFloat opacities[] = {1.0,  .2,   .1};
//  //#else
//  //  CGFloat linesizes[] =     {18,   16,    10,    7,   	6,     5,     4,      3,    2,     1.5};
//  //  CGFloat opacities[] = {.1,  .05,   .1,   .05,  .1,   .05,   .1,      .05,   .05,    1.0}; 
//  //#endif
//  self.phase = 0;
//  
//  
//  self.amplitude = 1.0;
//  
//  
//  waves[0] = wave1;
//  waveCounts[0] = wave1Count;
//  
//  waves[1] = wave2;
//  waveCounts[1] = wave2Count;
//  
//  waves[2] = wave3;
//  waveCounts[2] = wave3Count;
  
  //DMC new code
  if (!waveLayer)
  {
  waveLayer = [CALayer layer];
  UIImage *waveImage = [UIImage imageNamed: @"wave.png"];
  CGRect frame = waveLayer.frame;
  frame.size = waveImage.size;
  waveLayer.frame = frame;
  waveLayer.contents = (id)[waveImage CGImage];
  [self.layer addSublayer: waveLayer];
  }
  
  //	if (self.layersArray == nil)
  //	{
  //		self.layersArray = [NSMutableArray arrayWithCapacity: layerCount];
  //		
  //		
  //		
  //		CGRect myFrame = self.frame;
  //    //--------
  //    myFrame.size.width = wavelength * 3;//dmc testing
  //    self.layer.frame = myFrame;
  //   //--------
  //    
  //    
  //    
  //		
  //		for (int index = 0; index < layerCount; index++)
  //		{
  //			curveLayer = [CAShapeLayer layer];
  //			CGRect theFrame = myFrame;
  //			theFrame.origin = CGPointMake(0,0);
  //			curveLayer.frame = theFrame;
  //			CGFloat opacity = [[lineOpacities objectAtIndex: index] floatValue];
  //				//opacities[index];
  //			if (index == 0)
  //				curveLayer.strokeColor = [[UIColor whiteColor] CGColor];
  //			else if (index == 1)
  //				curveLayer.strokeColor = [lineColor CGColor];
  //			else      
  //				curveLayer.strokeColor = [glowColor CGColor];
  //			curveLayer.fillColor = nil;
  //			curveLayer.opacity = opacity;
  //				//    CGFloat screenScale = [self screenScale];
  //				//    if (screenScale>1)
  //				//    {
  //				//      curveLayer.shouldRasterize = TRUE;
  //				//      curveLayer.rasterizationScale = 1;
  //				//    }
  //			curveLayer.lineWidth = [[lineSizes objectAtIndex: index] floatValue];
  //			
  //			curveLayer.fillMode = kCAFillModeBackwards;
  //			
  //			curveLayer.masksToBounds = TRUE;
  //			
  //			[layersArray addObject: curveLayer];
  //			[self.layer addSublayer: curveLayer];
  //		}
  //	}
	
  //DMC testing:
  //  amplitude = 1.0;
  [self updateWaves];
  
  /*
   //Draw a bezier curve approximaton of the sinewave
   CGMutablePathRef shapePath;
   shapePath = CGPathCreateMutable();
   
   CGPathMoveToPoint(shapePath, nil, -10, self.frame.size.height/2);
   CGPathAddCurveToPoint(shapePath, nil, 
   myFrame.size.width*15/32,   myFrame.size.height/2+myFrame.size.height*-1.725,
   myFrame.size.width*17/32, myFrame.size.height/2+myFrame.size.height*1.725,
   myFrame.size.width+10,     myFrame.size.height/2);
   
   
   //Add an x axis and verical lines for the 1/4 and 3/4 points
   if (FALSE)
   {
   CGPathMoveToPoint(shapePath, nil, 0, myFrame.size.height/2);
   CGPathAddLineToPoint(shapePath, nil, myFrame.size.width, myFrame.size.height/2);
   
   CGPathMoveToPoint(shapePath, nil, myFrame.size.width/4, -50);
   CGPathAddLineToPoint(shapePath, nil, myFrame.size.width/4, myFrame.size.height+50);
   
   CGPathMoveToPoint(shapePath, nil, myFrame.size.width*3/4, -50);
   CGPathAddLineToPoint(shapePath, nil, myFrame.size.width*3/4, myFrame.size.height+50);
   }
   */
  
  
}

//-----------------------------------------------------------------------------------------------------------

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) 
  {
    [self doInitSetup];
  }
  return self;
}

//-----------------------------------------------------------------------------------------------------------

- (id) initWithCoder:(NSCoder *)aDecoder;
{
  self = [super initWithCoder: aDecoder];
  if (!self)
    return nil;
  [self doInitSetup];
  return self;
}

//-----------------------------------------------------------------------------------------------------------

- (void)dealloc
{
  self.glowColor = nil;
  self.lineColor = nil;
  [super dealloc];
}

@end
