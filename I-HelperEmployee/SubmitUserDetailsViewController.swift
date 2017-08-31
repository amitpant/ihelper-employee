//
//  SubmitUserDetailsViewController.swift
//  I-Helper
//
//  Created by Maxtra Technologies P LTD on 08/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import UIKit

class SubmitUserDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name:.UIKeyboardWillShow , object: self.view.window)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: self.view.window)
        
        nameTextField.addDoneButtonToKeyboard(myAction:  #selector(self.nameTextField.resignFirstResponder))
        emailIdTextField.addDoneButtonToKeyboard(myAction:  #selector(self.emailIdTextField.resignFirstResponder))
    }
    
    
 
    
    @IBAction func submitPressed(_ sender: UIButton) {
        
        if let name = nameTextField.text, let emailid = emailIdTextField.text{
            
            if name.characters.count > 2 {
                if  CommonHelper.isValidEmail(emailid: emailid)  {
                   guard let mobileNo = UserDefaults.standard.string(forKey: "userMobileNo")  else { return  }
                    CustomActivityIndicator.shared
                        .showActivityIndicator(view: self.view)
                    
                    
                    let params = ["device_token":"","device_type":"I","email":"\(emailid)","mobile":"\( mobileNo)","name":"\(name)"]
                    print(params)
                    NetworkClient.shared.downloadDataWithAPIName(apiname: "signup", params: params, success: { [weak self]  (serverResponse) in
                        print(serverResponse)
                         guard let strongSelf = self else{return}
                        if serverResponse["status"] as! Bool && serverResponse["isarray"] as! Bool{
                            if let data = serverResponse["data"] as? [String:Any] {
                                DispatchQueue.main.async {
                                   print(data)
                                    if let userObject = Users(json: data){
                                        let userData  = NSKeyedArchiver.archivedData(withRootObject: userObject)
                                        UserDefaults.standard.set(userData, forKey: "userObject")
                                        
                                        
                                        guard let selectServiceTypeVC = strongSelf.storyboard?.instantiateViewController(withIdentifier: "SelectServiceTypeVC" ) as? SelectServiceTypeVC else {
                                            return
                                        }
                                        selectServiceTypeVC.title = "Service category" 
                                        strongSelf.navigationController?.pushViewController(selectServiceTypeVC, animated: true)
                                        UserDefaults.standard.set(false, forKey: "isNotFirstTime_ihelperEmp")
                                       
                                    }
                                    
                                    /*guard let submitUserDetailsVC = strongSelf.storyboard?.instantiateViewController(withIdentifier: "ServiceListTableViewController" ) as? ServiceListTableViewController else {
                                        return
                                    }
                                    
                                    strongSelf.navigationController?.pushViewController(submitUserDetailsVC, animated: true)
                                    UserDefaults.standard.set(true, forKey: "isNotFirstTime")*/
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
                else{
                    showAlertMessage(message: "Please enter a vaild email address")
                }
                
            }
            else{
                showAlertMessage(message: "Please enter a vaild name")
            }
        }
    }
    
    func showAlertMessage(message:String)  {
        let alertCtrl = UIAlertController(title: "Error!!!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertCtrl.addAction(alertAction)
        self.present(alertCtrl, animated: true, completion: nil)
    }
    
    // MARK: Keyboard notification methods
    func keyboardWillShow(notification: Notification)  {
        let userInfo = notification.userInfo ?? [:]
        let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let offset:CGSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        
        if keyboardSize.height == offset.height {
            if self.view.frame.origin.y == 0 {
                UIView.animate(withDuration: 0.1, animations: {
                    () -> Void in
                    self.view.frame.origin.y -= 60
                })
            }
        }
        else{
            UIView.animate(withDuration: 0.1, animations: {
                ()-> Void in
                self.view.frame.origin.y += keyboardSize.height - offset.height
            })
        }
    }
    
    func keyboardWillHide(notification: Notification)  {
        self.view.frame.origin.y = 0
    }
}

extension SubmitUserDetailsViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
