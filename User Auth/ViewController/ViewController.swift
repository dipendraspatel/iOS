//
//  ViewController.swift
//  User Auth
//
//  Created by Dipendra on 10/08/19.
//  Copyright © 2019 Dipendra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var paswordTxtField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginButtonClicked(_ sender: Any) {
        
        if !(ValidationManager.validateEmail(email: idTextField.text!)) {
            showInvalidInputAlert(idTextField.placeholder!)
        }
        else if ValidationManager.validatePassword(password: paswordTxtField.text!) == 0 {
            showPasswordLengthAlert()
        }
        else if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param:[String:String] = ["email":self.idTextField.text!,
                                          "password": self.paswordTxtField.text!
            ]
            ServerClass.sharedInstance.postRequestWithUrlParameters(param, path: PROJECT_URL.LOGIN_API, successBlock: { (json) in
                print(json)
                hideAllProgressOnView(self.view)
                let success = json["success"].stringValue
                if success  == "true"  {
                    UserDefaults.standard.set(json["token"].stringValue, forKey: USER_DEFAULTS_KEYS.LOGIN_TOKEN)
                    let webViewController = UIStoryboard.webViewController()
                    webViewController.tokenString = json["token"].stringValue
                    self.navigationController?.pushViewController(webViewController, animated: true)
                }
                else{
                     UIAlertController.showInfoAlertWithTitle("Alert", message: json["error"].stringValue, buttonTitle: "Okay")
                }
            }, errorBlock: { (NSError) in
                UIAlertController.showInfoAlertWithTitle("Alert", message: kUnexpectedErrorAlertString, buttonTitle: "Okay")
                hideAllProgressOnView(self.view)
            })
        }
        else{
            UIAlertController.showInfoAlertWithTitle("Alert", message: "Please Check internet connection", buttonTitle: "Okay")
        }
    }
}

