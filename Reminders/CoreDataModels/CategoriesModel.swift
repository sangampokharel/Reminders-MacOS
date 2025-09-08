//
//  CategoriesModel.swift
//  Reminders
//
//  Created by sangam pokharel on 04/09/2025.
//


import Foundation
import CoreData
import AppKit

@objc(CategoriesEntity)
public class CategoriesEntity:NSManagedObject {
    
}

extension CategoriesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoriesEntity> {
        return NSFetchRequest<CategoriesEntity>(entityName: "CategoriesEntity")
    }

    @NSManaged public var category: String?
    @NSManaged public var colors: NSColor?
    @NSManaged public var items:NSSet?

}



