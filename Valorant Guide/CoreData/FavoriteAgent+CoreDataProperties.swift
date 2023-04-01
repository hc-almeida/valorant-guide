//
//  FavoriteAgent+CoreDataProperties.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 12/02/23.
//
//

import Foundation
import CoreData
import UIKit

extension FavoriteAgent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteAgent> {
        return NSFetchRequest<FavoriteAgent>(entityName: "FavoriteAgent")
    }

    @NSManaged public var color: String?
    @NSManaged public var roleName: String?
    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var id: String?

}

extension FavoriteAgent : Identifiable { }
