//
//  ServiceCategory+CoreDataProperties.swift
//  I-HelperEmployee
//
//  Created by Maxtra Technologies P LTD on 21/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import Foundation
import CoreData


extension ServiceCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ServiceCategory> {
        return NSFetchRequest<ServiceCategory>(entityName: "ServiceCategory")
    }

    @NSManaged public var service_cat_id: String?
    @NSManaged public var provider_id: String?
    @NSManaged public var is_active: String?
    @NSManaged public var sub_cat_id: String?
    @NSManaged public var created_date: String?
    @NSManaged public var user: User?

}
