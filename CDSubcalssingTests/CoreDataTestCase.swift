//
//  CoreDataTestCase.swift
//  Ticketstream
//
//  Created by Kris Wolff on 21/07/15.
//  Copyright (c) 2015 aus der Technik. All rights reserved.
//

import Foundation
import CoreData
import XCTest

class CoreDataTestCase:XCTestCase {
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("CDSubcalssing", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application’s saved data."
        if coordinator!.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: &error) == nil {
            coordinator = nil
            let dict = NSMutableDictionary()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application’s saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            dump(dict)
//            error = NSError.errorWithDomain("YOUR_ERROR_DOMAIN", code: 9999, userInfo: nil)

            NSLog("Unresolved error (error), (error!.userInfo)")
            abort()
        }
        
        return coordinator
        }()
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }()
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        managedObjectContext = nil
    }
    
}