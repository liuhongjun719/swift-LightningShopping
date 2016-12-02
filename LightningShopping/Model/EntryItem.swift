//
//  EntryItem.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/19.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import ObjectMapper

class EntryItem: Mappable {
    var items: [ModelItem]?
    var cd: CdItem?
    

    
    required init?(map: Map) {
        
    }
    public func mapping(map: Map) {
        items    <- map["items"]
        cd    <- map["cd"]
        


    }

}
