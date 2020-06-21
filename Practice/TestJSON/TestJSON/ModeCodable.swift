//
//  ModeCodable.swift
//  TestJSON
//
//  Created by YoujinMac on 2020/06/12.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import Foundation

let jsonData = """
[
{
  "latitude": 30.0,
  "longitude": 40.0,
  "elevation": 50.0
},
{
  "latitude": 60.0,
  "longitude": 120.0,
  "elevation": 20.0
}
]
""".data(using: .utf8)!

struct Coordinate: Codable {
    
    var latitiude: Double
    var logitude: Double
    var elevation: Double
    
    private enum CodingKeys: String, CodingKey {
        case lattitude
        case logitude
        case additionalInfo
    }
    
}

