//
//  DBManager.m
//  DBApp
//
//  Created pda.developer@gmail.com on 4/1/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "DBManager.h"
#import "NaunceManager.h"

@implementation DBManager
@synthesize fetchedResultsController=fetchedResultsController_;
@synthesize searchFetchedResultsController=searchFetchedResultsController_;

static DBManager* _manager;
+(DBManager*) sharedManager
{
	if (_manager == nil)
	{
		_manager = [[DBManager alloc] init];
	}
	return _manager;
}

- (void)dealloc {
	[managedObjectContext_ release];
    [managedObjectModel_ release];
    [persistentStoreCoordinator_ release];
	[fetchedResultsController_ release];
	[searchFetchedResultsController_ release];
	
    [super dealloc];
}

#pragma mark Functions

- (void)saveContext {
    
		//	DLog(@" Saving context");
    NSError *error = nil;
	NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
			//		DLog(@" Context not nil and changes = %d", [managedObjectContext hasChanges]);
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
			DLog(@"Error in saving");
            DLog(@"Unresolved error %@, %@", error, [error userInfo]);
            //commented check log
         //   abort();
        } 
    }
}    

#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext_ != nil) {
        return managedObjectContext_;
    }
		//    DLog(@" Creating managed Context");
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
        [managedObjectContext_ setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext_;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel_ != nil) {
        return managedObjectModel_;
    }
	
		//	DLog(@" Creating managed modal");
	
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"DBJott" ofType:@"mom"];
	//NSString *modelPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"DBJott.mom"];
    NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
	//NSFileManager* man = [NSFileManager defaultManager];
//	if ([man fileExistsAtPath:modelPath])
//	{
//		DLog(@"File eixist");
//	}
//	else 
//	{
//		DLog(@"File doesnot eixist");
//	}
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return managedObjectModel_;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator_ != nil) {
        return persistentStoreCoordinator_;
    }
    DLog(@" Creating persistant storage");
    
    NSError * error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:DB_FOLDER
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:&error];
    NSString *storePath = [DB_FOLDER stringByAppendingPathComponent: @"DBiJott.sqlite"];
    NSURL *storeURL = [NSURL fileURLWithPath:storePath];
    /*
    NSFileManager *fileManager = [NSFileManager defaultManager];
	// If the expected store doesn't exist, copy the default store.
	if (![fileManager fileExistsAtPath:storePath]) {
		NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:@"DBiJott" ofType:@"sqlite"];
		if (defaultStorePath) {
			[fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
		}
	}
     */
    
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        DLog(@"Unresolved error %@, %@", error, [error userInfo]);
        //commented check log
      //  abort();
    }    
    
    return persistentStoreCoordinator_;
}


#pragma mark -
#pragma mark Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (fetchedResultsController_ != nil) {
        NSError *error = nil;
        if (![fetchedResultsController_ performFetch:&error]) {
            DLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        return fetchedResultsController_;
    }
    DLog(@" fetching controller");
    /*
     Set up the fetched results controller.
	 */
    // Create the fetch request for the entity.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBJottTable" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    //[fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
    self.fetchedResultsController = aFetchedResultsController;
    
    [aFetchedResultsController release];
    [fetchRequest release];
    [sortDescriptor release];
    [sortDescriptors release];
    
    NSError *error = nil;
    if (![fetchedResultsController_ performFetch:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         */
        DLog(@"Unresolved error %@, %@", error, [error userInfo]);
        //commented check log
      //  abort();
    }
    
    return fetchedResultsController_;
} 

#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark Custom Funcitons
-(DBJottTable *)addNew:(NSString*) name text:(NSString*)text extensin:(NSString*) extension sampleRate:(NSString*) sampleRate audioQuality:(NSString*) audioQuality size:(NSString*) size date:(NSDate*) date
{
	DLog(@"adding new");
	DLog(@"%@, %@, %@, %@, %@, %@", name, text, extension, sampleRate,audioQuality, size);

	//NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBJottTable" inManagedObjectContext:self.managedObjectContext];
    DBJottTable *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:self.managedObjectContext];

	newManagedObject.name = name;
	newManagedObject.extension = extension;
	newManagedObject.sampleRate = sampleRate;
	newManagedObject.audioQuality = audioQuality;
	newManagedObject.size = size;
	newManagedObject.date = date;
    newManagedObject.message = text;
    
    NaunceManager* naunce = [NaunceManager sharedManager] ;
    newManagedObject.duration = [NSString stringWithFormat:@"%d s", [naunce getInterval]];
    
    [self saveContext];
    return newManagedObject;
}

#pragma mark Search Controller
-(void) findResult:(NSString*) searchText
{
    if (searchText && searchText.length) {
		
		NSArray *keywords = [searchText componentsSeparatedByString:@" "];
		NSPredicate *searchTemplate = [NSPredicate predicateWithFormat:@"(name LIKE[cd] $KEYWORD) OR (message LIKE[cd] $KEYWORD)"];
		NSMutableArray *subPredicates = [NSMutableArray arrayWithCapacity:[keywords count]];
		for(NSString *keyword in keywords)
		{
			keyword = [NSString stringWithFormat:@"*%@*", keyword];
			[subPredicates addObject:[searchTemplate predicateWithSubstitutionVariables:[NSDictionary dictionaryWithObject:keyword forKey:@"KEYWORD"]]];
		}
        /* use the compound predicate to combine them */
		NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:subPredicates];
		
		
		[searchFetchedResultsController_.fetchRequest setPredicate:predicate];
		[NSFetchedResultsController deleteCacheWithName:@"searchRoot"];
    }
    NSError *error = nil;
    if (![[self searchFetchedResultsController] performFetch:&error]) {
			// Handle error
        DLog(@"Unresolved error %@, %@", error, [error userInfo]);
        exit(-1);  // Fail
    }
}

- (NSFetchedResultsController *)searchFetchedResultsController {
    
    if (searchFetchedResultsController_ != nil) {
        NSError *error = nil;
        if (![fetchedResultsController_ performFetch:&error]) {
            DLog(@"Unresolved error %@, %@", error, [error userInfo]);
            //commented check log
          //  abort();
        }
        return searchFetchedResultsController_;
    }
    DLog(@" fetching controller");
    /*
     Set up the fetched results controller.
	 */
		// Create the fetch request for the entity.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
		// Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBJottTable" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
		// Set the batch size to a suitable number.
		//[fetchRequest setFetchBatchSize:20];
    
		// Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
		// Edit the section name key path and cache name if appropriate.
		// nil for section name key path means "no sections".
//    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"searchRoot"];
     NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.searchFetchedResultsController = aFetchedResultsController;
    
    [aFetchedResultsController release];
    [fetchRequest release];
    [sortDescriptor release];
    [sortDescriptors release];
    
    NSError *error = nil;
    if (![searchFetchedResultsController_ performFetch:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         */
        DLog(@"Unresolved error %@, %@", error, [error userInfo]);
        //commented check log
     //   abort();
    }
    
    return searchFetchedResultsController_;
} 
@end
