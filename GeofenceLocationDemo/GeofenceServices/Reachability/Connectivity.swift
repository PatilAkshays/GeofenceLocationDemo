//
//  Connectivity.swift
//  LocationDemo
//
//  Created by Akshay Patil on 25/08/21.
//

import Alamofire

class Connectivity{

    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }

}
