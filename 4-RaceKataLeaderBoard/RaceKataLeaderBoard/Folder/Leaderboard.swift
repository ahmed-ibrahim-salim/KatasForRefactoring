//
//  Leaderboard.swift
//  RaceKataLeaderBoard
//
//  Created by magdy khalifa on 21/05/2023.
//

import Foundation

class Leaderboard {
    var races: [Race]
    
    init(races: [Race]) {
        self.races = races
    }
    
    
    func driverRankings() -> [String] {
        let rankings = driverPoints().sorted { $0.value > $1.value }
        return rankings.map { $0.key }
    }
    
    func driverPoints() -> [String: Int] {
        
        var driverPoints = [String: Int]()
        
        for race in races {
            for driver in race.results {
                let name = race.driverName(driver: driver)
                // uses points from race
                driverPoints[name, default: 0] += race.points(driver: driver)
            }
        }
        
        return driverPoints
    }
}

//
class Driver: Hashable {
    var name: String
    var country: String
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
    
    static func == (lhs: Driver, rhs: Driver) -> Bool {
        return lhs.name == rhs.name && lhs.country == rhs.country
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(country)
    }
}

class SelfDrivingCar: Driver {
    var algorithmVersion: Int
    var company: String
    
    init(name: String?, country: String, algorithmVersion: Int, company: String) {
        self.algorithmVersion = algorithmVersion
        self.company = company
        super.init(name: name ?? "", country: country)
    }
}

//
class Race {
    static let points = [25, 18, 15]
    
    var name: String
    var results: [Driver]
    var driverNames: [Driver: String]
    
    init(name: String, results: [Driver]) {
        self.name = name
        self.results = results
        self.driverNames = [Driver: String]()
        
        for driver in results {
            var name = driver.name
            if let selfDrivingCar = driver as? SelfDrivingCar {
                name = "Self Driving Car - \(selfDrivingCar.country) (\(selfDrivingCar.algorithmVersion))"
            }
            driverNames[driver] = name
        }
        
    }
    
    // gets points score based on position
    func points(driver: Driver) -> Int {
        return Race.points[results.firstIndex(of: driver)!]
    }
    
    func driverName(driver: Driver) -> String {
        return driverNames[driver] ?? ""
    }
}
