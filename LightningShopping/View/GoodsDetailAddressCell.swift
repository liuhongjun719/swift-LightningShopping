//
//  GoodsDetailAddressCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/9.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON

class GoodsDetailAddressCell: UICollectionViewCell {
    var leftImage: UIImageView!
    var shopName: UILabel!
    var dayTime: UILabel!
    var rightIndicator: UIImageView!
    var sepratorView: UIView!

    var data: JSON {
        get {
            return self.data
        }
        
        set {
            let imageUrl = "\(newValue["shopFavicon"])"
            leftImage.af_setImage(withURL: URL(string: imageUrl)!)
            shopName.text = String.init(format: "%@", newValue["shopName"].stringValue)
            dayTime.text = "营业时间: " + "\(newValue["dayStartTime"].stringValue)" + " ~ " + "\(newValue["dayEndTime"].stringValue)"            
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftImage = UIImageView()
        leftImage.layer.cornerRadius = 30
        leftImage.layer.masksToBounds = true
        self.addSubview(leftImage)
        
        shopName = UILabel()
        self.addSubview(shopName)
        
        dayTime = UILabel()
        dayTime.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        dayTime.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(dayTime)
        
        rightIndicator = UIImageView()
        self.addSubview(rightIndicator)
        
        sepratorView = UIView()
        sepratorView.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        self.addSubview(sepratorView)
        
        
        sepratorView.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(10)
        }
        
        leftImage.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.width.height.equalTo(60)
            make.centerY.equalTo(self)
        }
        
        shopName.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(leftImage.snp.right).offset(10)
            make.top.equalTo(leftImage)
            make.height.equalTo(30)
            make.right.equalTo(self).offset(-40)
        }
        
        dayTime.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(shopName)
            make.top.equalTo(shopName.snp.bottom)
            make.height.equalTo(30)
            make.right.equalTo(self).offset(-40)
        }
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
