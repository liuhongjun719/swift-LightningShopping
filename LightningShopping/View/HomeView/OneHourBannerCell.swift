//
//  OneHourBannerCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/26.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class OneHourBannerCell: UICollectionViewCell {
    var focusHeader: HJFocusView!
    override init(frame: CGRect) {
        super.init(frame: frame)

        //HJFocusView
        focusHeader = HJFocusView(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        focusHeader.backgroundColor = UIColor.white

        self.addSubview(focusHeader)
//        focusHeader.addTimer()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Method
    public func oneHourBanner(data: JSON) {
        focusHeader.getHeaderData(data: data)
        
    }
}
