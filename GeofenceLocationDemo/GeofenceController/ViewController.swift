//
//  ViewController.swift
//  LocationDemo
//
//  Created by Akshay Patil on 25/08/21.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    @IBOutlet weak var geofenceAreaStatusLabel: UILabel!
    var geofenceViewModel = GeofenceViewModel()
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Confirm Circle Entry Exit Delegate
        GeofenceEngine.shared.delegate = self
     
       
        //Observer
        NotificationCenter.default.addObserver(self, selector: #selector(locationSetting(notification:)), name: .locationSetting, object: nil)

        //Check Location Permissions
        GeofenceEngine.shared.locationPermissions()

        // Do any additional setup after loading the view.
    }
    

    //Observer Action
    @objc func locationSetting(notification: NSNotification) {
        self.showAlertWithSetting(title: "Location Access", msg: "Please go to the Setting & Enable the location Service.")
    }
    

    //MARK: Default Geofence Location Details
    func defaultGeofenceLocationDetails(){
        
        let location = Locations.init(name: "Pune, Maharastra", lattitude: 18.5204, longitude: 73.8567, radius: 20)

        GeofenceEngine.shared.passGeofenceDetailsWith(location: location)
    }
    

    
    //MARK: Update Geofence Details
    @IBAction func OnClickOfUpdateNavBarButtonAction(_ sender: Any) {
        
        //Present Enter Geofence details View
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let addLatLongVC = storyBoard.instantiateViewController(withIdentifier: "AddLatLongVC") as! AddLatLongVC
        addLatLongVC.delegate = self
        self.present(addLatLongVC, animated: true, completion: nil)
    }
    
}





//MARK: Enterd Geofence Details
extension ViewController: GeofenceLatLongDelegate {
  
    func passLatLongWith(location: String, Latitude: Double, Longitude: Double, radius: Double) {
        self.title = "Region: \(location)"

        //Mark: Geofence Location Details
        let locationModel = Locations.init(name: location, lattitude: Latitude, longitude: Longitude, radius: radius)
        
        //Mark: Passing Geofence Parameter
        GeofenceEngine.shared.passGeofenceDetailsWith(location: locationModel)
    }
}

//MARK: Geofence Engine Entry Exit Point Protocol
extension ViewController: GeofenceManagerProtocol {
    
    func onGeofenceEventDetected(event: UserDetails) {

        if event.status == .enter {
            geofenceViewModel.didEnterRegion(details: event)
            self.geofenceAreaStatusLabel.text = "Enter In: \(event.place ?? "-")"

        }else{
            geofenceViewModel.didExitRegion(details: event)
            self.geofenceAreaStatusLabel.text = " Exit In: \(event.place ?? "-")"

        }
    }
}







/*
 
 var locationArray = [Locations.init(name: "Pune, Maharastra", lattitude: 18.5204, longitude: 73.8567), Locations.init(name: "Mumbai, Maharastra", lattitude: 19.0760, longitude: 72.8777), Locations.init(name: "Chennai", lattitude: 13.0827, longitude: 80.2707), Locations.init(name: "Bengaluru", lattitude: 12.9716, longitude: 77.5946)]

 

 */
