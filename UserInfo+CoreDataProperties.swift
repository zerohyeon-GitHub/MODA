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

}

extension UserInfo : Identifiable {

}
