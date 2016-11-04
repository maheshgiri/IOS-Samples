//
//  TextLimitDelegate.swift
//  ChallengeTextDelegateApp
//
//  Created by Hemisphere on 24/10/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import Foundation
import UIKit

class TextLimitDelegate :  NSObject, UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextFieldDidEditting  \(textField.text)")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextFieldBeginEditing  \(textField.text)")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextFieldShouldEditing \(textField.text)")
    return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextFieldShouldBeginEditing  \(textField.text)")
      return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("TextFiledReplace called  Text \(textField.text)  Range \(range) ReplacementString \(string)")
        return true
    }
    
    
}
