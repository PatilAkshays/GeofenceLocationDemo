//
//  GeofenceManagerProtocol.swift
//  LocationDemo
//
//  Created by Manish Ingale on 28/08/21.
//

import Foundation

protocol GeofenceManagerProtocol {
    func onGeofenceEventDetected(event: UserDetails)
}
