//
//  swiftdatamodel.swift
//  spaceX
//
//  Created by Akhil Gubbala on 04/03/25.
//


import SwiftData

@Model
class LocalLaunch {
    var flightNumber: Int
    var missionName: String
    var launchDateUTC: String
    var rocketName: String
    var launchSiteName: String
    var launchSuccess: Bool?
    var details: String?
    
    init(flightNumber: Int, missionName: String, launchDateUTC: String, rocketName: String, launchSiteName: String, launchSuccess: Bool?, details: String?) {
        self.flightNumber = flightNumber
        self.missionName = missionName
        self.launchDateUTC = launchDateUTC
        self.rocketName = rocketName
        self.launchSiteName = launchSiteName
        self.launchSuccess = launchSuccess
        self.details = details
    }
}




