//
//  Forecast.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/19.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import ObjectMapper

class Forecast: Mappable  {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}
