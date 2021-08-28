//
//  ApiClient.swift
//  LocationDemo
//
//  Created by Akshay Patil on 25/08/21.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

final class ApiClient {
    
    static let shared = ApiClient()
    
    private init(){
        
    }
    
     private let baseUrl = "https://itunes.apple.com"
    
    //MARK: Post Data
    func postDummyRequestWith(userDetails: UserDetails, completionHandler: @escaping (BaseApiResponse) -> Void){
        let url = "\(baseUrl)/v1/Post"

        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        let parameters: Parameters = [
            "userName" : userDetails.name ?? "",
            "userId" : userDetails.userId ?? "",
            "location" : userDetails.place ?? "",
            "status" : userDetails.status ?? ""
        ]
        
        Alamofire.request(url, method:.post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseObject(completionHandler: { (response: DataResponse<BaseApiResponse>) in
            switch(response.result){
            case .success:
                completionHandler(response.result.value!)
            case .failure(let error):
//                print("Error ",error)
                let apiErrorResponse = BaseApiResponse()
                apiErrorResponse?.isSuccess = false
                apiErrorResponse?.msg = "Error API Failure!"
                completionHandler(apiErrorResponse!)
            }
            
        })
        
    }
    
    
    
    
    func postDummyRequestWith1(gefenceStatus: String, userName: String, userId: String, completionHandler: @escaping (BaseApiResponse) -> Void){
       
        let apiResponse = BaseApiResponse()
        
        if userName == "" || userName == nil || userId == "" || userId == nil {
            apiResponse?.msg = "Error! Invalid User Details"
            apiResponse?.isSuccess = false

        }else{
            apiResponse?.msg = "Data Added Successfully"
            apiResponse?.isSuccess = true

        }
        
        completionHandler(apiResponse!)
    }
   
    
}





