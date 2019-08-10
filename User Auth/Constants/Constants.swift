//
//  Constants.swift
//  User Auth
//
//  Created by Dipendra on 10/08/19.
//  Copyright © 2019 Dipendra. All rights reserved.
//

import UIKit
import MBProgressHUD
import AVFoundation
import SwiftyJSON



let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate

let kPasswordMinimumLength = 1

let kLostInternetConnectivityAlertString = "Your internet connection seems to be lost." as String
let kPasswordLengthAlertString = NSString(format:"The Password should consist at least %d characters.",kPasswordMinimumLength) as String
let kPasswordWhiteSpaceAlertString = "The Password should not contain any whitespaces." as String
let kUnexpectedErrorAlertString = "An unexpected error has occurred. Please try again." as String


struct PROJECT_URL {
    /****** COMMON API ******/
    static let LOGIN_API = "https://reqres.in/api/login"
    }

struct USER_DEFAULTS_KEYS {
    static let LOGIN_TOKEN = "loginToken"
    
}
func showInvalidInputAlert(_ fieldName : String)
{
    UIAlertController.showInfoAlertWithTitle("Error", message: String(format:"Please enter a valid %@.",fieldName), buttonTitle: "Okay")
}
func showLostInternetConnectivityAlert()
{
    UIAlertController.showInfoAlertWithTitle("Uh Oh!", message: kLostInternetConnectivityAlertString , buttonTitle: "Okay")
}
func showPasswordLengthAlert()
{
    UIAlertController.showInfoAlertWithTitle("Error", message: kPasswordLengthAlertString, buttonTitle: "Okay")
}

//MARK:- MBProgressHUD Methods

func showProgressOnView(_ view:UIView)
{
    let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
    loadingNotification.mode = MBProgressHUDMode.indeterminate
    loadingNotification.label.text = "Loading.."
}

func hideProgressOnView(_ view:UIView)
{
    MBProgressHUD.hide(for: view, animated: true)
}

func hideAllProgressOnView(_ view:UIView)
{
    MBProgressHUD.hideAllHUDs(for: view, animated: true)
}





