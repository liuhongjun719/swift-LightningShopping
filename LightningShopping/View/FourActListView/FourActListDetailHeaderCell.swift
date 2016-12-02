//
//  FourActListDetailHeaderCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/29.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class FourActListDetailHeaderCell: UICollectionViewCell {
    var image: UIImageView!
    
    
    var data: [String : JSON] {
        get {
            return self.data
        }
        
        set {
            image.af_setImage(withURL: URL(string: (newValue["activityBigPic"]?.stringValue)!)!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        image = UIImageView()
        self.addSubview(image)

        image.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self)
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    public func loadData(data: [String : JSON]) {
////        let imageUrl = "\(data["activityBigPic"])"
//        image.af_setImage(withURL: URL(string: (data["activityBigPic"]?.stringValue)!)!)
//    }
}
