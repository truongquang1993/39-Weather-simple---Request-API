//
//  HaNoiWeather.swift
//  3900 RequestAPI 01
//
//  Created by Trương Quang on 7/23/19.
//  Copyright © 2019 truongquang. All rights reserved.
//

import Foundation
import UIKit

struct HaNoiWeather: Codable {
    var location: Location
    var current: Current
}

struct Location: Codable {
    
    var name: String?
    var region: String?
    var country: String?
    var lat: Double?
    var lon: Double?
    var tz_id: String?
    var localtime_epoch: Double?
    var localtime: String?
    
}
struct Current: Codable {
    var last_updated_epoch: TimeInterval?
    var last_updated: String?
    var temp_c: Double?
    var temp_f: Double?
    var is_day: Int?
    var condition: Condition
    
    struct Condition: Codable {
        var text: String?
        var icon: String?
        var code: Int?
    }
    
    var wind_mph: Double?
    var wind_kph: Double?
    var wind_degree: Double?
    var wind_dir: String?
    var pressure_mb: Double?
    var pressure_in: Double?
    var precip_mm: Double?
    var precip_in: Double?
    var humidity: Double?
    var cloud: Double?
    var feelslike_c: Double?
    var feelslike_f: Double?
    var vis_km: Double?
    var vis_miles: Double?
    var uv: Double?
    var gust_mph: Double?
    var gust_kph: Double?
}



struct DisplayWeatherInfo {
    var nameLocation: String
    var weather: String
//    var weatherIcon: UIImage
    var temp: Double
    var lastUpdate: String
    
    var changerOfRain: Double
    var humidity: Double
    var wind: Double
    var feelsLike: Double
    var precipitation: Double
    var pressure: Double
    var visibility: Double
    var uvIndex: Double
    
    init(rawData: HaNoiWeather) {
        nameLocation = rawData.location.name ?? "HaNoi"
        weather = "Today: \(rawData.current.condition.text ?? " ")"
        
//        if let url = URL(string: "https:\(rawData.current.condition.icon)") {
//            do {
//                let data = try Data(contentsOf: url)
//                weatherIcon = UIImage(data: data)!
//            } catch {
//                print(error)
//            }
//        }
        
        temp = rawData.current.temp_c ?? 0
        lastUpdate = rawData.current.last_updated_epoch?.convertTimeInterval() ?? "2019"
        changerOfRain = rawData.current.pressure_mb ?? 0
        humidity = rawData.current.humidity ?? 0
        wind = rawData.current.wind_mph ?? 0
        feelsLike = rawData.current.feelslike_c ?? 0
        precipitation = rawData.current.precip_mm ?? 0
        pressure = rawData.current.pressure_in ?? 0
        visibility = rawData.current.vis_km ?? 0
        uvIndex = rawData.current.uv ?? 0
    }
}


