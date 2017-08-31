//
//  SelectServiceTypeVC.swift
//  I-HelperEmployee
//
//  Created by Maxtra Technologies P LTD on 21/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import UIKit

class SelectServiceTypeVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    internal var categories: [Category] = []
    var filterCategoryList = [SubCategory]()
    var selectedSubCategoryIds:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        //searchBar..addDoneButtonToKeyboard(myAction:  #selector(self.nameTextField.resignFirstResponder))
        CustomActivityIndicator.shared.showActivityIndicator(view: self.view)
        self.searchBar.returnKeyType = .search
        var searchTextField:UITextField? = nil
        
        for view in searchBar.subviews {
            if view is UITextField{
                searchTextField = view as? UITextField
               
            }
        }
         searchTextField?.addDoneButtonToKeyboard(myAction:  #selector(searchTextField?.resignFirstResponder))
        
        NetworkClient.shared.downloadDataWithAPIName(apiname: "getCategory", params: nil, success: { [weak self]  (serverResponse) in
            // print(serverResponse)
            guard let strongSelf = self else{return}
            if serverResponse["status"] as! Bool && serverResponse["isarray"] as! Bool{
                if let data = serverResponse["data"] as? [[String:Any]] {
                    DispatchQueue.main.async {
                        strongSelf.categories =  Category.array(jsonArray: data)
                        strongSelf.tableView.reloadData()
                        
                    }
                }
            }else{
                print(serverResponse["message"] as! String)
            }
            CustomActivityIndicator.shared.hideActivityIndicator(view: strongSelf.view)
            
        }) { (error) in
            print(error)
            CustomActivityIndicator.shared.hideActivityIndicator(view: self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func nextButtonPressed(_ sender: Any) {
        
        
        
        if self.selectedSubCategoryIds.count > 0 {
            
            
            
            if let data = UserDefaults.standard.data(forKey: "userObject") {
                guard let user = NSKeyedUnarchiver.unarchiveObject(with: data as Data ) as? Users
                    else{
                        return
                }
                // {"provider_id":"4","service_sub_cat_ids":"2,4,6"}
                let sub_cat_ids = self.selectedSubCategoryIds.joined(separator: ",")
                
                let params = ["provider_id":"\(user.provider_id)","service_sub_cat_ids":"\(sub_cat_ids)"]
                print(params)
                
                CustomActivityIndicator.shared.showActivityIndicator(view: self.view)
                NetworkClient.shared.downloadDataWithAPIName(apiname: "addServiceCategory", params: params, success: { [weak self]  (serverResponse) in
                    print(serverResponse)
                    guard let strongSelf = self else{return}
                    if let status = serverResponse["status"] as? Bool, status {
                        
                        DispatchQueue.main.async {
                            print(data)
                            guard let selectServiceAreaVC = strongSelf.storyboard?.instantiateViewController(withIdentifier: "SelectServiceAreaVC" ) as? SelectServiceAreaVC else {
                                return
                            }
                            selectServiceAreaVC.title = "Service area"
                            strongSelf.navigationController?.pushViewController(selectServiceAreaVC, animated: true)
                            
                        }
                        
                        
                    }
                    else{
                        if let message = serverResponse["message"] as? String{
                            strongSelf.showAlertMessage(message: message)
                        }
                        print(serverResponse["message"] as! String)
                    }
                    CustomActivityIndicator.shared.hideActivityIndicator(view: strongSelf.view)
                    
                }) { (error) in
                    print(error)
                    CustomActivityIndicator.shared.hideActivityIndicator(view: self.view)
                }
            }
            
            
        }
        else{
            showAlertMessage(message: "Please select a service category")
        }
        
        
    }
    
    func showAlertMessage( message:String)  {
        let alertCtrl = UIAlertController(title: "Error!!!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertCtrl.addAction(alertAction)
        self.present(alertCtrl, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SelectServiceTypeVC:UITableViewDelegate,UITableViewDataSource{
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if self.filterCategoryList.count>0 {
            return 1
        }else{
            return self.categories.count
        }
        
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.filterCategoryList.count>0 {
            return self.filterCategoryList.count
        }else{
            return categories[section].sub_category.count
        }
        
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.filterCategoryList.count>0 {
            return "Search results"
        }else{
            return categories[section].category_name
        }
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        var subCategory:SubCategory? = nil
        if self.filterCategoryList.count>0 {
            subCategory = self.filterCategoryList[indexPath.row]
        }
        else{
            subCategory = categories[indexPath.section].sub_category[indexPath.row]
        }
        if let subCategory = subCategory {
            cell.textLabel?.text = subCategory.sub_cat_name
            if self.selectedSubCategoryIds.contains(subCategory.sub_cat_id){
                cell.accessoryType = .checkmark
            }
            else{
                cell.accessoryType = .none
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            
             var subcategoryId = ""
            if self.filterCategoryList.count > 0  {
                 subcategoryId = self.filterCategoryList[indexPath.row].sub_cat_id
                
            }
            else{
                subcategoryId = self.categories[indexPath.section].sub_category[indexPath.row].sub_cat_id
            }
            if self.selectedSubCategoryIds.contains(subcategoryId), let itemIndex = self.selectedSubCategoryIds.index(of: subcategoryId) {
                self.selectedSubCategoryIds.remove(at: itemIndex)
                cell.accessoryType = .none
            }
            else{
                self.selectedSubCategoryIds.append(subcategoryId)
                cell.accessoryType = .checkmark
            }
        }
    }
}

extension SelectServiceTypeVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filterCategoryList = categories.flatMap{$0.sub_category}.filter{$0.sub_cat_name.range(of: searchText) != nil}
        
        tableView.reloadData()
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
