//
//  User.swift
//  I-Helper
//
//  Created by Maxtra Technologies P LTD on 08/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import Foundation
/// Response Json
/*{
 
    "data": {
        "provider_id": "37",
        "company_name": "",
        "company_reg_no": "",
        "unique_agency_number": "",
        "employee_no": "0",
        "name": "Amit",
        "reg_no": "",
        "mobile": "4444444444",
        "email": "ios@gmail.com",
        "password": "",
        "profile_pic": "http://122.160.42.242/~priya/i_helper/api/",
        "is_individual": "1",
        "is_verified": "0",
        "job_done": "0",
        "rating": "3.5",
        "device_token": "",
        "device_type": "I",
        "payment_status": "0",
        "expiry_date": "0000-00-00 00:00:00",
        "package_id": "0",
        "created_date": "2017-08-21 12:57:23",
        "bank_name": "",
        "account_no": "",
        "ifsc_code": "",
        "account_name": "",
        "service_areas": [],
        "service_category": []
    }
*/
///
final class Users :NSObject,NSCoding{
    //MARK: - Constants
    private struct Keys{
        static let provider_id = "provider_id"
        static let company_name = "company_name"
        static let company_reg_no = "company_reg_no"
        static let unique_agency_number = "unique_agency_number"
        static let employee_no = "employee_no"
        static let name = "name"
        static let reg_no = "reg_no"
        static let mobile = "mobile"
        static let email = "email"
        static let password = "password"
        static let is_individual = "is_individual"
        static let profile_pic = "profile_pic"
        static let is_verified = "is_verified"
        static let job_done = "job_done"
        static let rating = "rating"
        static let device_token = "device_token"
        static let device_type = "device_type"
        static let payment_status = "payment_status"
        static let expiry_date = "expiry_date"
        static let package_id = "package_id"
        static let created_date = "created_date"
        static let bank_name = "bank_name"
        static let account_no = "account_no"
        static let ifsc_code = "ifsc_code"
        static let account_name = "account_name"
        static let service_areas = "service_areas"
        static let service_category = "service_category"
    }
    
    //MARK: - Instance Properties
    public let provider_id:String
    public let company_name:String
    public let company_reg_no:String
    public let unique_agency_number:String
    public let employee_no:String
    public let name:String
    public let reg_no:String
    public let mobile:String
    public let email:String
    public let password:String
    public let is_individual:String
    public let profile_pic:String
    public let is_verified:String
    public let job_done:String
    public let rating:String
    public let device_token:String
    public let device_type:String
    public let payment_status:String
    public let expiry_date:String
    public let package_id:String
    public let created_date:String
    public let bank_name:String
    public let account_no:String
    public let ifsc_code:String
    public let account_name:String
    public var service_areas:[ServiceAreas]?
    public var service_category:[ServiceCategorys]?
    
    //MARK: - Object lifecycle
    public init(provider_id:String,
                company_name:String,
                company_reg_no:String,
                unique_agency_number:String,
                employee_no:String,
                name:String,
                reg_no:String,
                mobile:String,
                email:String,
                password:String,
                is_individual:String,
                profile_pic:String,
                is_verified:String,
                job_done:String,
                rating:String,
                device_token:String,
                device_type:String,
                payment_status:String,
                expiry_date:String,
                package_id:String,
                created_date:String,
                bank_name:String,
                account_no:String,
                ifsc_code:String,
                account_name:String,
                service_areas:[ServiceAreas]?,
                service_category:[ServiceCategorys]?){
        
        self.provider_id =  provider_id
        self.company_name =  company_name
        self.company_reg_no =  company_reg_no
        self.unique_agency_number =  unique_agency_number
        self.employee_no =  employee_no
        self.name =  name
        self.reg_no =  reg_no
        self.mobile =  mobile
        self.email =  email
        self.password =  password
        self.is_individual =  is_individual
        self.profile_pic =  profile_pic
        self.is_verified =  is_verified
        self.job_done =  job_done
        self.rating =  rating
        self.device_token =  device_token
        self.device_type =  device_type
        self.payment_status =  payment_status
        self.expiry_date =  expiry_date
        self.package_id =  package_id
        self.created_date =  created_date
        self.bank_name =  bank_name
        self.account_no =  account_no
        self.ifsc_code =  ifsc_code
        self.account_name =  account_name
        self.service_areas =  service_areas
        self.service_category =  service_category
    }
    
    public init?(json:[String:Any]){
        guard let provider_id = json[Keys.provider_id] as? String,
        let company_name = json[Keys.company_name] as? String,
        let company_reg_no = json[Keys.company_reg_no] as? String,
        let unique_agency_number = json[Keys.unique_agency_number] as? String,
        let employee_no = json[Keys.employee_no] as? String,
        let name = json[Keys.name] as? String,
        let reg_no = json[Keys.reg_no] as? String,
        let mobile = json[Keys.mobile] as? String,
        let email = json[Keys.email] as? String,
        let password = json[Keys.password] as? String,
        let is_individual = json[Keys.is_individual] as? String,
        let profile_pic = json[Keys.profile_pic] as? String,
        let is_verified = json[Keys.is_verified] as? String,
        let job_done = json[Keys.job_done] as? String,
        let rating = json[Keys.rating] as? String,
        let device_token = json[Keys.device_token] as? String,
        let device_type = json[Keys.device_type] as? String,
        let payment_status = json[Keys.payment_status] as? String,
        let expiry_date = json[Keys.expiry_date] as? String,
        let package_id = json[Keys.package_id] as? String,
        let created_date = json[Keys.created_date] as? String,
        let bank_name = json[Keys.bank_name] as? String,
        let account_no = json[Keys.account_no] as? String,
        let ifsc_code = json[Keys.ifsc_code] as? String,
        let account_name = json[Keys.account_name] as? String
        //let service_areas = json[Keys.service_areas] as? [String:Any],
       // let service_category = json[Keys.service_category] as? String
 
            else { return nil }
        
        self.provider_id =  provider_id
        self.company_name =  company_name
        self.company_reg_no =  company_reg_no
        self.unique_agency_number =  unique_agency_number
        self.employee_no =  employee_no
        self.name =  name
        self.reg_no =  reg_no
        self.mobile =  mobile
        self.email =  email
        self.password =  password
        self.is_individual =  is_individual
        self.profile_pic =  profile_pic
        self.is_verified =  is_verified
        self.job_done =  job_done
        self.rating =  rating
        self.device_token =  device_token
        self.device_type =  device_type
        self.payment_status =  payment_status
        self.expiry_date =  expiry_date
        self.package_id =  package_id
        self.created_date =  created_date
        self.bank_name =  bank_name
        self.account_no =  account_no
        self.ifsc_code =  ifsc_code
        self.account_name =  account_name
        //self.service_areas =  service_areas
        //self.service_category =  service_category
    }
    
    required convenience public init?(coder aDecoder:NSCoder) {
        guard let provider_id = aDecoder.decodeObject(forKey:Keys.provider_id) as? String,
            let company_name = aDecoder.decodeObject(forKey:Keys.company_name) as? String,
            let company_reg_no = aDecoder.decodeObject(forKey:Keys.company_reg_no) as? String,
            let unique_agency_number = aDecoder.decodeObject(forKey:Keys.unique_agency_number) as? String,
            let employee_no = aDecoder.decodeObject(forKey:Keys.employee_no) as? String,
            let name = aDecoder.decodeObject(forKey:Keys.name) as? String,
            let reg_no = aDecoder.decodeObject(forKey:Keys.reg_no) as? String,
            let mobile = aDecoder.decodeObject(forKey:Keys.mobile) as? String,
            let email = aDecoder.decodeObject(forKey:Keys.email) as? String,
            let password = aDecoder.decodeObject(forKey:Keys.password) as? String,
            let is_individual = aDecoder.decodeObject(forKey:Keys.is_individual) as? String,
            let profile_pic = aDecoder.decodeObject(forKey:Keys.profile_pic) as? String,
            let is_verified = aDecoder.decodeObject(forKey:Keys.is_verified) as? String,
            let job_done = aDecoder.decodeObject(forKey:Keys.job_done) as? String,
            let rating = aDecoder.decodeObject(forKey:Keys.rating) as? String,
            let device_token = aDecoder.decodeObject(forKey:Keys.device_token) as? String,
            let device_type = aDecoder.decodeObject(forKey:Keys.device_type) as? String,
            let payment_status = aDecoder.decodeObject(forKey:Keys.payment_status) as? String,
            let expiry_date = aDecoder.decodeObject(forKey:Keys.expiry_date) as? String,
            let package_id = aDecoder.decodeObject(forKey:Keys.package_id) as? String,
            let created_date = aDecoder.decodeObject(forKey:Keys.created_date) as? String,
            let bank_name = aDecoder.decodeObject(forKey:Keys.bank_name) as? String,
            let account_no = aDecoder.decodeObject(forKey:Keys.account_no) as? String,
            let ifsc_code = aDecoder.decodeObject(forKey:Keys.ifsc_code) as? String,
            let account_name = aDecoder.decodeObject(forKey:Keys.account_name) as? String
            
            else { return nil }
        
        self.init(provider_id: provider_id, company_name: company_name, company_reg_no: company_reg_no, unique_agency_number: unique_agency_number, employee_no: employee_no, name: name, reg_no: reg_no, mobile: mobile, email: email, password: password, is_individual: is_individual, profile_pic: profile_pic, is_verified: is_verified, job_done: job_done, rating: rating, device_token: device_token, device_type: device_type, payment_status: payment_status, expiry_date: expiry_date, package_id: package_id, created_date: created_date, bank_name: bank_name, account_no: account_no, ifsc_code: ifsc_code, account_name: account_name, service_areas: nil, service_category: nil)
    }
   
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.provider_id, forKey: Keys.provider_id)//provider_id
        aCoder.encode(self.company_name, forKey: Keys.company_name)//company_name
        aCoder.encode(self.company_reg_no, forKey: Keys.company_reg_no)//company_reg_no
        aCoder.encode(self.unique_agency_number, forKey: Keys.unique_agency_number)//unique_agency_number
        aCoder.encode(self.employee_no, forKey: Keys.employee_no)//employee_no
        aCoder.encode(self.name, forKey: Keys.name)//name
        aCoder.encode(self.reg_no, forKey: Keys.reg_no)//reg_no
        aCoder.encode(self.mobile, forKey: Keys.mobile)//mobile
        aCoder.encode(self.email, forKey: Keys.email)//email
        aCoder.encode(self.password, forKey: Keys.password)//password
        aCoder.encode(self.is_individual, forKey: Keys.is_individual)//is_individual
        aCoder.encode(self.profile_pic, forKey: Keys.profile_pic)//profile_pic
        aCoder.encode(self.is_verified, forKey: Keys.is_verified)//is_verified
        aCoder.encode(self.job_done, forKey: Keys.job_done)//job_done
        aCoder.encode(self.rating, forKey: Keys.rating)//rating
        aCoder.encode(self.device_token, forKey: Keys.device_token)//device_token
        aCoder.encode(self.device_type, forKey: Keys.device_type)//device_type
        aCoder.encode(self.payment_status, forKey: Keys.payment_status)//payment_status
        aCoder.encode(self.expiry_date, forKey: Keys.expiry_date)//expiry_date
        aCoder.encode(self.package_id, forKey: Keys.package_id)//package_id
        aCoder.encode(self.created_date, forKey: Keys.created_date)//created_date
        aCoder.encode(self.bank_name, forKey: Keys.bank_name)//bank_name
        aCoder.encode(self.account_no, forKey: Keys.account_no)//account_no
        aCoder.encode(self.ifsc_code, forKey: Keys.ifsc_code)//ifsc_code
        aCoder.encode(self.account_name, forKey: Keys.account_name)//account_name
        aCoder.encode(self.service_areas, forKey: Keys.service_areas)//service_areas
        aCoder.encode(self.service_category, forKey: Keys.service_category)//service_category
    }

    //MARK: - Class Constructors
    class func array(jsonObject:[[String:Any]])->[Users]{
        var array:[Users] = []
        for json in jsonObject {
            guard let user = Users(json: json) else { continue }
            array.append(user)
        }
        return array
    }
    
}
