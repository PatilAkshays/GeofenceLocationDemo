//
//  GeofenceEngine.swift
//  LocationDemo
//
//  Created by Manish Ingale on 28/08/21.
//

import Foundation
import CoreLocation
import UIKit

class GeofenceEngine: NSObject {
    static var shared = GeofenceEngine()
    
    var delegate: GeofenceManagerProtocol?
    
    //Location Manager
    lazy fileprivate var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter = 100
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        return locationManager
    }()
    
    
    //initilization
    private override init(){
        super.init()

    }
    
    //Location Permissins
    func locationPermissions(){
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .restricted, .denied:
                
                NotificationCenter.default.post(name: .locationSetting, object: nil)
            case .notDetermined:
                locationManager.requestAlwaysAuthorization()
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
            @unknown default:
                break
            }
        }else{
            NotificationCenter.default.post(name: .locationSetting, object: nil)
        }
    }
    
    
    
    //For Update Geofence Details
    open func passGeofenceDetailsWith(location: Locations) {
        let locationArea = CLLocationCoordinate2DMake(location.lattitude ?? 18.5204, location.longitude ?? 73.8567)
        
        let geoFenceRegion: CLCircularRegion = CLCircularRegion.init(center: locationArea, radius: location.radius ?? 20, identifier: location.name ?? "Pune")
        
        /*

        //MARK: To Stop Prvious Monitoring Regions
        let monitoredRegions = locationManager.monitoredRegions
        for region in monitoredRegions{
            locationManager.stopMonitoring(for: region)
        }
        */
        
        locationManager.startMonitoring(for: geoFenceRegion)

    }
    
    //We Can Fetched From Local Database
    func userDetails(place: String, status: String) -> UserDetails {
        let userDetails = UserDetails.init(name: "Jhon", userId: "hdvcdc", place: place, status: status)
        return userDetails
    }
    
}


//MARK: CLLocation Delegte method
extension GeofenceEngine: CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Enter In: \(region.identifier)")
        
        delegate?.onGeofenceEventDetected(event: self.userDetails(place:"\(region.identifier)", status: .enter))
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exit In: \(region.identifier)")

        delegate?.onGeofenceEventDetected(event: self.userDetails(place:"\(region.identifier)", status: .exit))
    }
    
}



