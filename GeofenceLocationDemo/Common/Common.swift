//
//  Common.swift
//  LocationDemo
//
//  Created by Akshay Patil on 25/08/21.
//

import Foundation
import UIKit
import CoreLocation

extension UIViewController {
    
    //MARK: Method to display  Alert
    func showAlertWithSetting(title: String, msg: String) {
        let alert = UIAlertController(title: title , message: msg, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Setting", style: UIAlertAction.Style.default, handler: { action in
            
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)")
                })
            }
            alert.dismiss(animated: true, completion: nil)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { action in
            
        }))
        self.present(alert, animated:true, completion:nil)
        
    }
    
    //MARK: Method to display  Alert
    func showAlertWithAction(title: String, msg: String) {
        let alert = UIAlertController(title: title , message: msg, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: { action in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated:true, completion:nil)
           
    }
    
}

extension String {
    static let INTEGERFLOAT_CHARACTERS =  "0123456789."
    static let INTEGER_CHARACTERS =  "0123456789."
    static let enter = "Enter"
    static let exit = "Exit"
}

extension UITextField {
    
    func acceptFloatIntegers(str: String, acceptInput: String) -> Bool{
        
        let cs = NSCharacterSet(charactersIn: acceptInput).inverted
        let filtered = str.components(separatedBy: cs).joined(separator: "")
        
        if (str == " " || str.count == 0){
            return false
        }else{
            if (str.count > 0){
                return (str == filtered)
            }else{
                return false
            }
        }
    }
    
    
    func acceptAlphanumericCharacters(str: String) -> Bool{
        
        let ACCEPTABLE_CHARACTERS =  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 "
        
        return isValid(text: str, acceptableCharacters: ACCEPTABLE_CHARACTERS)
    }
    
    private func isValid(text: String, acceptableCharacters: String) -> Bool {
        let cs = NSCharacterSet(charactersIn: acceptableCharacters).inverted
        let filtered = text.components(separatedBy: cs).joined(separator: "")
        
        let oldText = self.text!
        if (oldText == " " && (text == " " || text.count == 0)){
            return false
        }else{
            if (text.count > 0){
                return (text == filtered)
            }else{
                return false
            }
        }
    }
    
    
    
}

extension Notification.Name {
    static let locationSetting = Notification.Name("LocationSettingObserver")
   
}
