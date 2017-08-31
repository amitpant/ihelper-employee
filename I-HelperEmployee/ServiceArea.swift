//
//  ServiceArea.swift
//  I-HelperEmployee
//
//  Created by Maxtra Technologies P LTD on 21/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import Foundation
/*
 {
 "area_id": "30",
 "provider_id": "36",
 "area_name": "Maxtra Technologies",
 "lat": "28.610066500000002",
 "lng": "77.3543117",
 "is_active": "1",
 "created_date": "2017-08-21 11:21:45"
 }
 */

public final class ServiceAreas{
    //MARK - Constants
    private struct Keys{
        static let area_id = "area_id"
        static let provider_id = "provider_id"
        static let area_name = "area_name"
        static let lat = "lat"
        static let lng = "lng"
        static let is_active = "is_active"
        static let created_date = "created_date"
    }
    
    //MARK: - Instance Properties
    public let area_id : String
    public let provider_id : String
    public let area_name : String
    public let lat : String
    public let lng : String
    public let is_active : String
    public let created_date : String
    
    //MARK: - Object lifecycle
    public  init( area_id : String,
     provider_id : String,
     area_name : String,
     lat : String,
     lng : String,
     is_active : String,
     created_date : String){
        
        self.area_id = area_id
        self.provider_id = provider_id
        self.area_name = area_name
        self.lat = lat
        self.lng = lng
        self.is_active = is_active
        self.created_date = created_date
    }
    
    public init?(json:[String:Any]){
        
        guard let provider_id = json[Keys.provider_id] as? String,
            let area_id = json[Keys.area_id] as? String,
            let area_name = json[Keys.area_name] as? String,
            let is_active = json[Keys.is_active] as? String,
            let lat = json[Keys.lat] as? String,
            let lng = json[Keys.lng] as? String,
            let created_date = json[Keys.created_date] as? String
            else { return nil }
        
        self.area_id = area_id
        self.provider_id = provider_id
        self.area_name = area_name
        self.lat = lat
        self.lng = lng
        self.is_active = is_active
        self.created_date = created_date
    }
    
    required convenience public init?(coder aDecoder:NSCoder) {
        guard let provider_id = aDecoder.decodeObject(forKey:Keys.provider_id) as? String,
            let area_id = aDecoder.decodeObject(forKey:Keys.area_id) as? String,
            let area_name = aDecoder.decodeObject(forKey:Keys.area_name) as? String,
            let lat = aDecoder.decodeObject(forKey:Keys.lat) as? String,
            let lng = aDecoder.decodeObject(forKey:Keys.lng) as? String,
            let is_active = aDecoder.decodeObject(forKey:Keys.is_active) as? String,
            let created_date = aDecoder.decodeObject(forKey:Keys.created_date) as? String
            else{
                return nil
        }
        
        self.init(area_id: area_id, provider_id: provider_id, area_name: area_name, lat: lat, lng: lng, is_active: is_active, created_date: created_date)
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.provider_id, forKey: Keys.provider_id)//provider_id
        aCoder.encode(self.area_id, forKey: Keys.area_id)//area_id
        aCoder.encode(self.area_name, forKey: Keys.area_name)//area_name
        aCoder.encode(self.lat, forKey: Keys.lat)//lat
        aCoder.encode(self.lng, forKey: Keys.lng)//lng
        aCoder.encode(self.is_active, forKey: Keys.is_active)//is_active
        aCoder.encode(self.created_date, forKey: Keys.created_date)//created_date
    }
    
    
    //MARK: - Class Constructors
    class func array(jsonObject:[[String:Any]])->[ServiceAreas]{
        var array:[ServiceAreas] = []
        for json in jsonObject {
            guard let user = ServiceAreas(json: json) else { continue }
            array.append(user)
        }
        return array
    }
}
