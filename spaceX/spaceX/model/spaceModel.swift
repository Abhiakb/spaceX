import Foundation

struct Rocket: Codable {
    let rocketName: String
    let rocketType: String
    
    enum CodingKeys: String, CodingKey {
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
    }
}

struct LaunchSite: Codable {
    let siteName: String
    
    enum CodingKeys: String, CodingKey {
        case siteName = "site_name"
    }
}

struct Launch: Codable, Identifiable {
    let id: Int 
    let missionName: String
    let launchDateUTC: String
    let rocket: Rocket
    let launchSite: LaunchSite
    let launchSuccess: Bool?
    let links: Links
    let details: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "flight_number" // Map flight_number to id
        case missionName = "mission_name"
        case launchDateUTC = "launch_date_utc"
        case rocket
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case links
        case details
    }
}

struct Links: Codable {
    let missionPatch: String?
    let missionPatchSmall: String?
    
    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
    }
}
struct SpaceXRocket: Identifiable, Codable {
    let id: Int
    let rocketID: String
    let rocketName: String
    let description: String
    let firstFlight: String
    let costPerLaunch: Int
    let flickrImages: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case description
        case firstFlight = "first_flight"
        case costPerLaunch = "cost_per_launch"
        case flickrImages = "flickr_images"
    }
}
