//
//  Weather.swift
//  WeatherForecast
//
//  Created by YoujinMac on 2020/02/24.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

class Weather {
    let skyCode: String
    
    let cloudy = "cloudy"
    let lightning = "lightning"
    let rainy = "rainy"
    let sunny = "sunny"
    
    init(skyCode: String) {
        self.skyCode = skyCode
    }
    func skyType() -> String {
        switch skyCode {
        case "SKY_O01":
            return "맑음"
        case "SKY_O02":
            return "구름조금"
        case "SKY_O03":
            return "구름많음"
        case "SKY_O04":
            return "구름많고 비"
        case "SKY_O05":
            return "구름많고 눈"
        case "SKY_O06":
            return "구름많고 눈비"
        case "SKY_O07":
            return "흐림"
        case "SKY_O08":
            return "흐리고 비"
        case "SKY_O09":
            return "흐리고 눈"
        case "SKY_O10":
            return "흐리고 눈비"
        case "SKY_O11":
            return "흐리고 낙뢰"
        case "SKY_O12":
            return "뇌우/비"
        case "SKY_O13":
            return "뇌우/눈"
        case "SKY_O14":
            return "뇌우/눈비"
        default:
            return "기타"
        }
        
    }
    
    func skyTypeBackground() -> String {
        //cloudy, lightning, rainy, sunny
        switch skyCode {
        case "SKY_O01":
            //"맑음"
            return sunny
        case "SKY_O02":
//            "구름조금"
            return sunny
        case "SKY_O03":
//            "구름많음"
            return cloudy
        case "SKY_O04":
//           "구름많고 비"
            return rainy
        case "SKY_O05":
//            "구름많고 눈"
            return rainy
        case "SKY_O06":
//            "구름많고 눈 또는 비"
            return rainy
        case "SKY_O07":
//            "흐림"
            return cloudy
        case "SKY_O08":
//            "흐리고 비"
            return rainy
        case "SKY_O09":
//            return "흐리고 눈"
            return rainy
        case "SKY_O10":
//           "흐리고 비 또는 눈"
            return rainy
        case "SKY_O11":
//            "흐리고 낙뢰"
            return lightning
        case "SKY_O12":
//            "뇌우/비"
            return lightning
        case "SKY_O13":
//            "뇌우/눈"
            return lightning
        case "SKY_O14":
//            "뇌우/눈,비"
            return lightning
        default:
            return sunny
        }
    }
}

