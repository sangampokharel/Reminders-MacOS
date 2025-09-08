//
//  CoreDataManager.swift
//  Reminders
//
//  Created by sangam pokharel on 04/09/2025.
//

import CoreData
import Foundation

class CoreDataManager {
    let persistentContainer:NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        
        ValueTransformer.setValueTransformer(NSColorTransformer(), forName: NSValueTransformerName("NSColorTransformer"))
        persistentContainer = NSPersistentContainer(name: "CategoriesModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to intialize core data \(error)")
            }
        }
    }
}
