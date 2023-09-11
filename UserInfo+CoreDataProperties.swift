//
//  UserInfo+CoreDataProperties.swift
//  MODA
//
//  Created by t2023-m0059 on 2023/09/08.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var pw: String?
    @NSManaged public var relationship: NSSet?

}

// MARK: Generated accessors for relationship
extension UserInfo {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: Videos)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: Videos)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}

extension UserInfo : Identifiable {

}
