//
//  Videos+CoreDataProperties.swift
//  
//
//  Created by t2023-m0059 on 2023/09/08.
//
//

import Foundation
import CoreData


extension Videos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Videos> {
        return NSFetchRequest<Videos>(entityName: "Videos")
    }

    @NSManaged public var id: String?
    @NSManaged public var thumbnailImageName: String?
    @NSManaged public var title: String?
    @NSManaged public var viewcount: Int16

}
