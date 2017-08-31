//
//  ServiceCategory.swift
//  I-HelperEmployee
//
//  Created by Maxtra Technologies P LTD on 21/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import Foundation
/*{
 "service_cat_id": "15",
 "provider_id": "36",
 "sub_cat_id": "2",
 "is_active": "1",
 "created_date": "2017-08-21 10:54:01"
 }
 */

public final class ServiceCategorys:NSObject,NSCoding{
    //MARK - Constants
    private struct Keys{
        static let service_cat_id =  "service_cat_id"
        static let provider_id =  "provider_id"
        static let sub_cat_id =  "sub_cat_id"
        static let is_active =  "is_active"
        static let created_date =  "created_date"
        
    }
    
    //MARK: - Instance Properties
    public let service_cat_id : String
    public let provider_id : String
    public let sub_cat_id : String
    public let is_active : String
    public let created_date : String
    
    //MARK: - Object lifecycle
    public  init( service_cat_id : String,
                  provider_id : String,
                  sub_cat_id : String,
                  is_active : String,
                  created_date : String){
        
        self.service_cat_id = service_cat_id
        self.provider_id = provider_id
        self.sub_cat_id = sub_cat_id
        self.is_active = is_active
        self.created_date = created_date
    }
    
    public init?(json:[String:Any]){
        
        guard let provider_id = json[Keys.provider_id] as? String,
            let service_cat_id = json[Keys.service_cat_id] as? String,
            let sub_cat_id = json[Keys.sub_cat_id] as? String,
            let is_active = json[Keys.is_active] as? String,
            let created_date = json[Keys.created_date] as? String
            else { return nil }
        
        self.service_cat_id = service_cat_id
        self.provider_id = provider_id
        self.sub_cat_id = sub_cat_id
        self.is_active = is_active
        self.created_date = created_date
    }
    
    
    required convenience public init?(coder aDecoder:NSCoder) {
        guard let provider_id = aDecoder.decodeObject(forKey:Keys.provider_id) as? String,
            let service_cat_id = aDecoder.decodeObject(forKey:Keys.service_cat_id) as? String,
            let sub_cat_id = aDecoder.decodeObject(forKey:Keys.sub_cat_id) as? String,
            let is_active = aDecoder.decodeObject(forKey:Keys.is_active) as? String,
            let created_date = aDecoder.decodeObject(forKey:Keys.created_date) as? String
            else{
                return nil
        }
        
        self.init(service_cat_id: service_cat_id, provider_id: provider_id, sub_cat_id: sub_cat_id, is_active: is_active, created_date: created_date)
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.provider_id, forKey: Keys.provider_id)//provider_id
        aCoder.encode(self.service_cat_id, forKey: Keys.service_cat_id)//service_cat_id
        aCoder.encode(self.sub_cat_id, forKey: Keys.sub_cat_id)//sub_cat_id
        aCoder.encode(self.is_active, forKey: Keys.is_active)//is_active
        aCoder.encode(self.created_date, forKey: Keys.created_date)//created_date
    }
    
    //MARK: - Class Constructors
    class func array(jsonObject:[[String:Any]])->[ServiceCategorys]{
        var array:[ServiceCategorys] = []
        for json in jsonObject {
            guard let user = ServiceCategorys(json: json) else { continue }
            array.append(user)
        }
        return array
    }
    
    ///
    
}
