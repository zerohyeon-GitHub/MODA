//
//  Video+CoreDataProperties.swift
//  MODA
//
//  Created by t2023-m0059 on 2023/09/08.
//
//

import Foundation
import CoreData


extension Video {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Video> {
        return NSFetchRequest<Video>(entityName: "Video")
    }

    @NSManaged public var id: String?
    @NSManaged public var thumbnailImageName: String?
    @NSManaged public var title: String?
    @NSManaged public var viewcount: String?

}

extension Video : Identifiable {

}
