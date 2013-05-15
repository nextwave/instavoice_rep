//
//  DBManager.h
//  DBApp
//
//  Created pda.developer@gmail.com on 4/1/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DBJottTable.h"

@interface DBManager : NSObject {

@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
	NSFetchedResultsController *fetchedResultsController_;
	NSFetchedResultsController *searchFetchedResultsController_;
	
}

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSFetchedResultsController *searchFetchedResultsController;

+(DBManager*) sharedManager;

- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

-(DBJottTable *)addNew:(NSString*) name text:(NSString*)text extensin:(NSString*) extension sampleRate:(NSString*) sampleRate audioQuality:(NSString*) audioQuality size:(NSString*) size date:(NSDate*) date;

-(void) findResult:(NSString*) searchText;

@end
