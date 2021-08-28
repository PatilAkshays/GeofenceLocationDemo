//
//  Validation.swift
//  LocationDemo
//
//  Created by Akshay Patil on 25/08/21.
//

import Foundation
struct ValidationResult {
    var success: Bool = false
    var errorMessage: String?
}


struct Validation {

    // validate the user inputs
    func validateApiParameter(userDetails: UserDetails) -> ValidationResult {

        if(userDetails.name!.isEmpty && userDetails.userId!.isEmpty && userDetails.place!.isEmpty){
            return ValidationResult(success: false, errorMessage: "User Name, userID cannot be empty")
        }
        
        if userDetails.name!.isEmpty {
            return ValidationResult(success: false, errorMessage: "User Name cannot be empty")
        }
        
        if userDetails.userId!.isEmpty {
            return ValidationResult(success: false, errorMessage: "User Id cannot be empty")
        }
        
        if userDetails.place!.isEmpty {
            return ValidationResult(success: false, errorMessage: "Place name cannot be empty")
        }
        
        
       
        return ValidationResult(success: true, errorMessage: nil)
    }

    
    func validateLocationParameter(location: String , latitude: String, longitude: String, radius: String) -> ValidationResult {

        if(location.isEmpty && latitude.isEmpty && longitude.isEmpty && radius.isEmpty){
            return ValidationResult(success: false, errorMessage: "Location, Latitude, Longitude & Radius Fields cannot be empty")
        }
        
        if location == "" || location.count <= 1 {
            return ValidationResult(success: false, errorMessage: "Location Field cannot be empty")
        }
        
        if latitude == "" {
            return ValidationResult(success: false, errorMessage: "Latitude Field cannot be empty")
        }
        
        if longitude == "" {
            return ValidationResult(success: false, errorMessage: "Longitude Field cannot be empty")
        }
        
        if radius == "" {
            return ValidationResult(success: false, errorMessage: "Radius Field cannot be empty")
        }
        
        guard Double(latitude) != nil else {
            return ValidationResult(success: false, errorMessage: "Latitude Field cannot be character. it should be integer or double value")
        }
        
        guard Double(longitude) != nil else {
            return ValidationResult(success: false, errorMessage: "Longitude Field cannot be character. it should be integer or double value")
        }
        
        guard Double(radius) != nil else {
            return ValidationResult(success: false, errorMessage: "Radius Field cannot be character. it should be a Number")
        }
        
       
        return ValidationResult(success: true, errorMessage: nil)
    }

  
}
