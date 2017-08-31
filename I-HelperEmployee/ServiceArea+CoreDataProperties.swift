//
//  ServiceArea+CoreDataProperties.swift
//  I-HelperEmployee
//
//  Created by Maxtra Technologies P LTD on 21/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import Foundation
import CoreData


extension ServiceArea {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ServiceArea> {
        return NSFetchRequest<ServiceArea>(entityName: "ServiceArea")
    }

    @NSManaged public var area_id: String?
    @NSManaged public var provider_id: String?
    @NSManaged public var area_name: String?
    @NSManaged public var lat: String?
    @NSManaged public var lng: String?
    @NSManaged public var is_active: String?
    @NSManaged public var created_date: String?
    @NSManaged public var user: User?

}
