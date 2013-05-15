//
//  DBJottTable.h
//  iJott
//
//  Created by pda.developer@gmail.com on 8/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface DBJottTable :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * flag;
@property (nonatomic, retain) NSString * size;
@property (nonatomic, retain) NSString * duration;
@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSString * audioQuality;
@property (nonatomic, retain) NSString * extension;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * sampleRate;

@end



