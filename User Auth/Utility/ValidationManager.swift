//
//  ValidationManager.swift
//  Amistos
//
//  Created by chawtech solutions on 3/26/18.
//  Copyright © 2018 chawtech solutions. All rights reserved.
//

import UIKit

class ValidationManager: NSObject {

    class func validatePassword(password:String) -> Int {
        let characterSet = NSCharacterSet.whitespaces
        let range = password.rangeOfCharacter(from: characterSet)
        
        if range == nil {
            if password.count >= kPasswordMinimumLength  {
                return 2
            } else {
                return 0
            }
        } else {
            return 1
        }
    }
    
    class func validateEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    class func validateFieldForEmpty(text:String) -> Bool {
        let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimmedText.count == 0 {
            return false
        } else {
            return true
        }
    }
    
  

}
