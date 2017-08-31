//
//  User+CoreDataProperties.swift
//  I-HelperEmployee
//
//  Created by Maxtra Technologies P LTD on 21/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var provider_id: String?
    @NSManaged public var account_name: String?
    @NSManaged public var ifsc_code: String?
    @NSManaged public var account_no: String?
    @NSManaged public var bank_name: String?
    @NSManaged public var created_date: String?
    @NSManaged public var package_id: String?
    @NSManaged public var expiry_date: String?
    @NSManaged public var payment_status: String?
    @NSManaged public var device_type: String?
    @NSManaged public var device_token: String?
    @NSManaged public var rating: String?
    @NSManaged public var job_done: String?
    @NSManaged public var is_verified: String?
    @NSManaged public var is_individual: String?
    @NSManaged public var profile_pic: String?
    @NSManaged public var password: String?
    @NSManaged public var email: String?
    @NSManaged public var mobile: String?
    @NSManaged public var reg_no: String?
    @NSManaged public var name: String?
    @NSManaged public var employee_no: String?
    @NSManaged public var unique_agency_number: String?
    @NSManaged public var company_reg_no: String?
    @NSManaged public var company_name: String?
    @NSManaged public var service_areas: NSSet?
    @NSManaged public var service_category: NSSet?

}

// MARK: Generated accessors for service_areas
extension User {

    @objc(addService_areasObject:)
    @NSManaged public func addToService_areas(_ value: ServiceArea)

    @objc(removeService_areasObject:)
    @NSManaged public func removeFromService_areas(_ value: ServiceArea)

    @objc(addService_areas:)
    @NSManaged public func addToService_areas(_ values: NSSet)

    @objc(removeService_areas:)
    @NSManaged public func removeFromService_areas(_ values: NSSet)

}

// MARK: Generated accessors for service_category
extension User {

    @objc(addService_categoryObject:)
    @NSManaged public func addToService_category(_ value: ServiceCategory)

    @objc(removeService_categoryObject:)
    @NSManaged public func removeFromService_category(_ value: ServiceCategory)

    @objc(addService_category:)
    @NSManaged public func addToService_category(_ values: NSSet)

    @objc(removeService_category:)
    @NSManaged public func removeFromService_category(_ values: NSSet)

}
