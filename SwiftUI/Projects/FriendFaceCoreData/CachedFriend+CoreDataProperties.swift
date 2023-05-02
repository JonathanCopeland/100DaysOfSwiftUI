//
//  CachedFriend+CoreDataProperties.swift
//  FriendFaceCoreData
//
//  Created by Jonathan Copeland on 02/05/2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?

}

extension CachedFriend : Identifiable {

}
