//
//  GeofenceViewModel.swift
//  TestDemo
//
//  Created by Akshay Patil on 26/07/21.
//


import UIKit

//Mark: Protocol For Enter & Exit
protocol GeofenceProtocol {
    func didEnterRegion(details: UserDetails)
    func didExitRegion(details: UserDetails)
}

//Mark: Parameter Passing For Geofence Engine
struct Locations {
    var name: String?
    var lattitude: Double?
    var longitude: Double?
    var radius: Double?
}


//Mark: Parameter Passing For API call
struct UserDetails {
    var name: String?
    var userId: String?
    var place: String?
    var status: String?
}



//Mark: ViewModel For Geofence View Controller
class GeofenceViewModel : GeofenceProtocol{
    
    func didEnterRegion(details: UserDetails) {
        self.updateUserLocation(userDetails: details)
    }
    
    
    func didExitRegion(details: UserDetails) {
        self.updateUserLocation(userDetails: details)

    }
    
       
    //MARK: API Call For Enter And Exit
    func updateUserLocation(userDetails: UserDetails) -> Void {
        
        let validation = Validation().validateApiParameter(userDetails: userDetails)
        
        if Connectivity.isConnectedToInternet() && validation.success {
            self.postDummyRequestWith(userDetails: userDetails) { (responce) in
                DispatchQueue.main.async {
                    if responce.isSuccess ?? false {
                        //Success
                    }else{
                        //Error
                    }
                }
            }
        }
    }
    
    
    
    //API Call After all Validations
    var apiContentResponse: BaseApiResponse?
    func postDummyRequestWith(userDetails: UserDetails, completion: @escaping (BaseApiResponse) -> Void) {
        
        ApiClient.shared.postDummyRequestWith(userDetails: userDetails, completionHandler: {  (response) in
            
            DispatchQueue.main.async {
                self.apiContentResponse = response
                
                if self.getApiCallDataSuccess(){
                    print(self.getApiCallSuccessMessage())
                  
                }else{
                    print(self.getApiCallSuccessMessage())
                }
                completion(self.apiContentResponse!)
            }
        })
    }
    
    //Success
    func getApiCallDataSuccess() -> Bool {
        return (apiContentResponse?.isSuccess ?? false)
    }
    //Message
    func getApiCallSuccessMessage() -> String {
        return (apiContentResponse?.msg) ?? "Unknown Error"
    }
    
    
    
}
