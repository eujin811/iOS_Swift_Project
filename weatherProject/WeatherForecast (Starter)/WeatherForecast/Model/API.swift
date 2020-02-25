//
//  API.swift
//  WeatherForecast
//
//  Created by YoujinMac on 2020/02/24.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation


let APIKey = "l7xxb14fe9c2bca24c2ead78b567b3e4edec"
let APIVersion = "2"

let presentWheatherURL = "https://apis.openapi.sk.com/weather/current/hourly"
let timeWindowWheatherURL = "https://apis.openapi.sk.com/weather/forecast/3days"

class PresentWheatherURL {
    let lon: String
    let lat: String
    
    init(lon: String, lat: String) {
        self.lon = lon
        self.lat = lat
        
    }
    
    func url() -> String {
        let url = presentWheatherURL+"?appKey="+APIKey+"&version="+APIVersion+"&lat="+lat+"&lon="+lon
        
        return url
    }
}

/*
 timeWindowWheatherURL
 https://apis.openapi.sk.com/weather/forecast/3days?appKey=l7xxb14fe9c2bca24c2ead78b567b3e4edec&version=2&lat=36.1234&lon=127.1234&foretxt=N
 */

class TimeWindowWheatherURL {
    let lat: String
    let lon: String
    
    init(lat: String, lon: String) {
        self.lat = lat
        self.lon = lon
    }
    
    func url() -> String {
        let url = timeWindowWheatherURL+"?appKey="+APIKey+"&version="+APIVersion+"&lat="+lat+"&lon="+lon+"&foretxt=N"
        
        return url
    }
}

