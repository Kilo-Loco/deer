//
//  CoreDataService.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataService: PersistenceServiceInterface {
    
    private lazy var context = persistentContainer.viewContext
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "deer")
        container.loadPersistentStores(completionHandler: { [unowned container] (storeDescription, error) in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func save(_ scooters: [Scooter.JSONScooter]) {
        
        for scooter in scooters {
            let mocScooter = Scooter(context: context)
            mocScooter.id = scooter.id
            mocScooter.name = scooter.name
            mocScooter.location = scooter.location
        }
        
        saveContext()
    }
}
