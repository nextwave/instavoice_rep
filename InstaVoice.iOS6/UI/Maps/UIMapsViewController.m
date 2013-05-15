//
//  UIMapsViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIMapsViewController.h"
#import "MapKitAdditions.h"
#import "ASIHTTPRequest.h"
#import "AddressAnnotation.h"
#import "LocationData.h"
#import "NSDictionary_JSONExtensions.h"

#define kLocationAPIKey @"AIzaSyDME-dSqL0Tj61Koll8G42iPFrky-YRA7Y"
#define ZOOM_LEVEL 10

@implementation UIMapsViewController
@synthesize customMap;
@synthesize delegate;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
    self.backBtn.titleLabel.text = [loc back:lang];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	customMap.showsUserLocation=NO;
	customMap.mapType=MKMapTypeHybrid;
	customMap.multipleTouchEnabled = TRUE;
	customMap.zoomEnabled = TRUE;
    
    NSLog(@"viewDidLoad in UIMapsViewController");

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[annotationsArray release];
	[customMap release];
    [_backBtn release];
    [super dealloc];
}

#pragma mark Functions
-(IBAction) onClickDone
{
    
    
    NSLog(@"Added by Vineeth onClickDone");
	[self stopLocation];
	[self dismissViewControllerAnimated:YES completion:^{
        //NOthing to do
    }];
    if ([delegate respondsToSelector:@selector(onClickMapBack)]) {
        [delegate performSelector:@selector(onClickMapBack)];
    }
}

-(void) startLocation:(NSString*) query
{
    
     NSLog(@"startLocation in UIMapsViewController");
    
	[[LocationManager sharedManager] startMonitoring];
	LocationManager* manager = [LocationManager sharedManager];
	if (manager.latitude == -1 || manager.longitude == -1)
		[self performSelector:@selector(getLocationData:) withObject:query afterDelay:3];
	else 
		[self getLocationData:query];
}

-(void) stopLocation
{
	[[LocationManager sharedManager] stopMonitoring];
    
     NSLog(@"stopLocation in UIMapsViewController");
    
}

-(void) setLocations
{
     NSLog(@"setLocations in UIMapsViewController");
    
    
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.2;
	span.longitudeDelta=0.2;
	
	LocationManager* manager = [LocationManager sharedManager];
	CLLocationCoordinate2D centerCoord = { manager.latitude, manager.longitude };
	CLLocationCoordinate2D location = centerCoord;
	region.span=span;
	region.center=location;
	
	if (annotationsArray == nil)
		annotationsArray = [[NSMutableArray alloc] init];
	
	for (int i=0; i<[annotationsArray count]; i++)
	{
		AddressAnnotation* annot = [annotationsArray objectAtIndex:i];
		[customMap removeAnnotation:annot];
	}
	
	[annotationsArray removeAllObjects];
	
	for (int i=0; i<[dataArray count]; i++)
	{
		LocationData* data = [dataArray objectAtIndex:i];
		CLLocationCoordinate2D locationCord = { data.latitude, data.longitude };
		AddressAnnotation* addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:locationCord];
		addAnnotation.title = data.locationName;
		addAnnotation.subtitle = @"";
		[customMap addAnnotation:addAnnotation];							  
		[annotationsArray addObject:addAnnotation];
	}
//	if(addAnnotation != nil) {
//		[customMap removeAnnotation:addAnnotation];
//		[addAnnotation release];
//		addAnnotation = nil;
//	}
//	addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:location];
//	addAnnotation.title = clubData.clubName;
//	addAnnotation.subtitle = clubData.clubAddress;
//	[customMap addAnnotation:addAnnotation];
	[customMap setRegion:region animated:TRUE];
	[customMap regionThatFits:region];
	
	
    [customMap setCenterCoordinate:centerCoord zoomLevel:ZOOM_LEVEL animated:YES];
}

#pragma mark -
- (void)requestFinished:(ASIHTTPRequest *)request
{
    
     NSLog(@"requestFinished in UIMapsViewController");
    
    
	DLog(@"request succeeded = %@", [request responseString]);
	NSData* data = [request responseData];
	if (data == nil)
	{
		DLog(@"requestFinished data nil returning");
		return;
	}
	
	@synchronized(self)
	{	
		NSError* error = nil;
		NSDictionary* obj = [NSDictionary dictionaryWithJSONData:[request responseData]  error:&error];
		
		if (dataArray == nil)
			dataArray =[[NSMutableArray alloc] init];
		
		[dataArray removeAllObjects];
		
		NSArray* geomateryArray = [obj objectForKey:@"results"];
		if ([geomateryArray count] == 0)
		{
			UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:@"No location found" delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
		
		for (int i=0; i<[geomateryArray count]; i++)
		{
			LocationData* data = [[LocationData alloc] init];
			NSDictionary* dict = [geomateryArray objectAtIndex:i];
			data.locationName = [dict objectForKey:@"name"];
			NSDictionary* geomatery = [dict objectForKey:@"geometry"];
			NSDictionary* dict2 = [geomatery objectForKey:@"location"]; 
			data.latitude = [[dict2 objectForKey:@"lat"] doubleValue];
			data.longitude = [[dict2 objectForKey:@"lng"] doubleValue];
			[dataArray addObject:data];
			[data release];
		}
		
		[self setLocations];
	}
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
   
    NSLog(@"requestFailed in UIMapsViewController");

    
    DLog(@"request failed = %@", [[request error] description]);
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[[request error] description] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
	[alert show];
	[alert release];
}
//根据搜索关键字，读取经纬度，如果未找到与关键字匹配的地方，返回no，成功返回yes。
-(BOOL)getLatitudeLongitude:(NSString*)query
{
    
     NSLog(@"getLatitudeLongitude in UIMapsViewController"); 
    
    // NSString *addr = @"Istanbul";
    // NSString *addr = @"瑞达路枫杨街";
    //NSString *addr = @"121 Oak Hills Rd. South Bend Indiana 46604";
    //NSString *addr = @"Stowe Vermont";
    //NSString *addr = @"Pizza Delivery";//读不到经纬度，所以返回经纬度值均为0。
    NSString *addr = query;
    NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=csv", 
                           [addr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSString *locationString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] 
                                                        encoding:NSUTF8StringEncoding 
                                                           error:nil];
    NSArray *array = [locationString componentsSeparatedByString:@","];
    if(array == nil)
    {
        return NO;
    }
    else
    {
        if(array.count > 3)
        {
            double lat = [[array objectAtIndex:2] doubleValue];
            double longt = [[array objectAtIndex:3] doubleValue];
            if (lat == 0 && longt == 0) {
                return NO;
            }
            else
            {
                /*
                if (dataArray == nil)
                    dataArray =[[NSMutableArray alloc] init];
                
                [dataArray removeAllObjects];
                
                
                //for (int i=0; i<[geomateryArray count]; i++)
                //{
                    LocationData* data = [[LocationData alloc] init];
                    data.locationName = query;
                    
                    
                    data.latitude = lat;
                    data.longitude = longt;
                    [dataArray addObject:data];
                    [data release];
                //}
                
                [self setLocations];
                CLLocationCoordinate2D workingCoordinate;
                
                workingCoordinate.latitude = lat;
                workingCoordinate.longitude = longt;
                
                [customMap setRegion:MKCoordinateRegionMake(workingCoordinate, MKCoordinateSpanMake(.01, .01)) animated:YES];
                 */
            }
        }
    }
    return YES;
}
#pragma mark Functions
-(void) getLocationData:(NSString*) query
{
    
    NSLog(@"getLocationData in UIMapsViewController"); 
    
    /*
	for (int i=0; i<[annotationsArray count]; i++)
	{
		AddressAnnotation* annot = [annotationsArray objectAtIndex:i];
		[customMap removeAnnotation:annot];
	}
	
	[annotationsArray removeAllObjects];
    */
    
    BOOL blflag = [self getLatitudeLongitude:query];
    NSString *urlString = nil;
    LocationManager* manag = [LocationManager sharedManager];
    if (blflag == YES) {
        //如果找到该关键匹配的地方了，就不再执行下边语句了。
        urlString = [[NSString stringWithFormat:@"http://maps.google.com/maps?z=14&q=%@",query] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        DLog(@"urlString = %@",urlString);
    }
    else
    {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(manag.location.coordinate, MapRadius*2, MapRadius*2);
        
        urlString = [[NSString stringWithFormat:@"http://maps.google.com/maps?z=14&ll=%.6f,%.6f&spn=%.6f,%.6f&q=%@",region.center.latitude,region.center.longitude,region.span.latitudeDelta,region.span.longitudeDelta,query] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        DLog(@"urlString = %@",urlString);
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [self onClickDone];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
	
	//NSString* geoURL = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%.6f,%.6f&radius=50000&name=%@&sensor=false&key=%@", manag.latitude, manag.longitude,[UtilityManager stringByEscapingForURLArgument:query], kLocationAPIKey];
    //NSString* geoURL = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%.6f,%.6f&radius=%@&name=%@&sensor=false&key=%@", manag.latitude, manag.longitude,MapRadius,[UtilityManager stringByEscapingForURLArgument:query], kLocationAPIKey];
    /*double lat = manag.latitude;
    double log = manag.longitude;
    NSString* geoURL = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%.6f,%.6f&radius=%.6f&name=%@&sensor=false&key=%@", lat,log,MapRadius,query, kLocationAPIKey];
	DLog(@"geoURL = %@", geoURL);
    NSLog(@"geoURL = %@", geoURL);*/
	//ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:geoURL]];
	//[request addRequestHeader:@"Accept-Language" value:@"en-us"];
	//[request setDelegate:self];
	//[request startAsynchronous];
}
@end
