//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Giftbot on 2020/02/22.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentWheatherReq()
     
//        timeWindowWheatherReq()
    }
    
    // 현재시간 날씨
    func presentWheatherReq() {
        print("----------------[ 현재시간 날씨 ]-----------------")
    
        let lon: String = "127.1234"
        let lat: String = "36.1234"
        
        let presentWheather = PresentWheatherURL(lon: lon, lat: lat)
        
        guard let url = URL(string: presentWheather.url()) else { return print("url 접근 실패") }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return print(error!.localizedDescription)  }
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode), response.mimeType == "application/json" else { return print("response 실패") }
            guard let data = data else { return print("No data") }
            
            // 전체 데이터
            guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return print("todo 실패") }
            
            // 날씨 데이터
            guard let weather = todo["weather"] as? [String: Any] else { return print("weather 실패") }
            guard let hourly = weather["hourly"] as? [Any] else { return print("hourly가져오기 실패") }
            
            // 날씨 내부 데이터 hourly[0] 내부 접근
            guard let hourlConent = hourly[0] as? [String: Any] else { return print("hourl의 내부 접근 실패") }
            print("\n grid -> ", hourlConent["grid"], "\n gridType ->", type(of: hourlConent["grid"]))
            
            guard let grid = hourlConent["grid"] as? [String: String] else { return print("grid 실패") }
            print("\n grid -> ", grid)
            
//            print("city -> ",hourlConent["grid"]["city"]!)
            print(type(of: grid))
            
        }
        task.resume()
        
        
    }
    
    // 시간대별 날씨
    func timeWindowWheatherReq() {
        print("----------------[ 시간대별 날씨 ]-----------------")
        
        let lon: String = "127.1234"
        let lat: String = "36.1234"
        
        let timeWindowWheather = TimeWindowWheatherURL(lat: lat, lon: lon)
        
        guard let url =  URL(string: timeWindowWheather.url()) else { return print("url 접근 실패") }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return print(error!.localizedDescription) }
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode), response.mimeType == "application/json" else { return print("response 실패") }
            guard let data = data else { return print("No data") }
            guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return print("todo 실패") }
            print("\n todo -> ", todo)
        }
        task.resume()
    }
    
    
}

