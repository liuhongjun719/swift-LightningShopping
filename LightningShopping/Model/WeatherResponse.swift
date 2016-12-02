//
//  WeatherResponse.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/19.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import ObjectMapper

class WeatherResponse: Mappable {
    var location: String?
    var threeDayForecast: [Forecast]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}
