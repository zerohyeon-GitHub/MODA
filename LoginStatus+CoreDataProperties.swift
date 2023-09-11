//
//  LoginStatus+CoreDataProperties.swift
//  MODA
//
//  Created by t2023-m0059 on 2023/09/08.
//
//

import Foundation
import CoreData


extension LoginStatus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginStatus> {
        return NSFetchRequest<LoginStatus>(entityName: "LoginStatus")
    }

    @NSManaged public var status: Bool
    @NSManaged public var id: String?

}

extension LoginStatus : Identifiable {

}
