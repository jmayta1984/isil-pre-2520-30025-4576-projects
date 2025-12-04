//
//  GoogleMapHelper.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 26/11/25.
//

import GoogleMaps

class GoogleMapHelper {
    static let shared = GoogleMapHelper()
    
    private init () {
        GMSServices.provideAPIKey("AIzaSyA-vQx2B0cAVRep0CLD-1CS-H2pOB0xxts")
    }
}
