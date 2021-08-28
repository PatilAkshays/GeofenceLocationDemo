//
//  AddLatLongVC.swift
//  LocationDemo
//
//  Created by Akshay Patil on 27/08/21.
//

import UIKit

protocol GeofenceLatLongDelegate {
    func passLatLongWith(location: String, Latitude: Double, Longitude: Double, radius: Double)
}


class AddLatLongVC: UIViewController {

    @IBOutlet weak var locationTxtField: UITextField!
    @IBOutlet weak var latTxtField: UITextField!
    @IBOutlet weak var longiTxtField: UITextField!
    @IBOutlet weak var radiusTxtField: UITextField!

    var delegate: GeofenceLatLongDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationTxtField.delegate = self
        self.latTxtField.delegate = self
        self.longiTxtField.delegate = self
        self.radiusTxtField.delegate = self

        self.locationTxtField.keyboardType = .default
        self.latTxtField.keyboardType = .numbersAndPunctuation
        self.longiTxtField.keyboardType = .numbersAndPunctuation
        self.radiusTxtField.keyboardType = .numbersAndPunctuation

        // Do any additional setup after loading the view.
    }
    
    
    //
    @IBAction func onClickUpdateGeofenceDataAction(_ sender: Any) {
        let validation = Validation().validateLocationParameter(location: locationTxtField.text!, latitude: latTxtField.text!, longitude: longiTxtField.text!, radius: radiusTxtField.text!)
       
        if validation.success {
          
            guard let lati = Double(latTxtField.text!) else {return }
            guard let long = Double(longiTxtField.text!) else {return }
            guard let radius = Double(radiusTxtField.text!) else {return }

            self.delegate?.passLatLongWith(location: locationTxtField.text!, Latitude: lati, Longitude: long, radius: radius)
            self.dismiss(animated: true, completion: nil)
        }else{
            self.showAlertWithAction(title: "Incorrect Input Fields", msg: validation.errorMessage ?? "Please Check the Input Fields.")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension AddLatLongVC: UITextFieldDelegate {
    
    //MARK: Textfield Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField === locationTxtField)
        {
            locationTxtField.resignFirstResponder()
            latTxtField.becomeFirstResponder()
        } else if (textField === latTxtField)
        {
            latTxtField.resignFirstResponder()
            longiTxtField.becomeFirstResponder()
        } else if (textField === longiTxtField)
        {
            longiTxtField.resignFirstResponder()
            radiusTxtField.becomeFirstResponder()

        }else if (textField === radiusTxtField)
        {
            radiusTxtField.resignFirstResponder()
        }
        return true
    }
    
    
    
    //MARK: Text Field Formatter Validation
       func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool
       {
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) {
//            print("Backspace was pressed")
            return true
        }
        
        if textField == locationTxtField{
            return textField.acceptAlphanumericCharacters(str: string)
        }
        if textField == latTxtField || textField == longiTxtField{
            if (textField.text?.count)! > 8{
                return false
            }
            return textField.acceptFloatIntegers(str: string, acceptInput: .INTEGERFLOAT_CHARACTERS)
        }
        if textField == radiusTxtField{
            if (textField.text?.count)! > 2{
                return false
            }
            return textField.acceptFloatIntegers(str: string, acceptInput: .INTEGER_CHARACTERS)
            
        }
        
        return true
    }
    
}
