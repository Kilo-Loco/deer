//
//  CoreDataService.swift
//  deer
//
//  Created by Kyle Lee on 9/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation
import CoreData
import ReactiveSwift
import ReactiveCocoa
import Result

final class CoreDataService: PersistenceServiceInterface {
    
    // MARK: - Communication
    
    let (scootersSignal, scootersObserver) = Signal<[SlateScooter], NoError>.pipe()
    
    
    // MARK: - Instance Properties
    
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
    
    
    // MARK: Injected Properties
    
    let slate: Slate
    
    
    // MARK: - Initializer
    
    init(slate: Slate = .init()) {
        self.slate = slate
        setup()
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        let container = persistentContainer
        slate.configure(managedObjectModel: container.managedObjectModel,
                        persistentStoreDescription: container.persistentStoreDescriptions.last!) {
                            if let error = $1 {
                                print(error)
                            } else {
                                print("Slate configured with", $0)
                            }
        }
    }
    
    // MARK: - Events
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
                getScooters()
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
            mocScooter.latitude = scooter.location.latitude
            mocScooter.longitude = scooter.location.longitude
        }
        
        saveContext()
    }
    
    func getScooters() {
        slate.queryAsync { [weak self] context in
            let scooters: [SlateScooter] = try context[SlateScooter.self].fetch()
            self?.scootersObserver.send(value: scooters)
            
        }.catch { error in
            print(error)
        }
        
    }
}
