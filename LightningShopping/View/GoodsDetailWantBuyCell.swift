//
//  GoodsDetailWantBuyCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/9.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON

class GoodsDetailWantBuyCell: UICollectionViewCell {
    
    var topImage: UIImageView!
    var itemName: UILabel!
    var goodsVolume: UILabel!
    var changeGoodsNumberView: ChangeGoodsNumberView!

    
    
    var data: JSON {
        get {
            return self.data
        }
        
        set {
            let imageUrl = "http://imgsize.52shangou.com/img/" + "\(newValue["bigPicUrl"])"
            topImage.af_setImage(withURL: URL(string: imageUrl)!)
            itemName.text = String.init(format: "%@", newValue["itemName"].stringValue)
            
            goodsVolume.text = String.init(format: "%@", newValue["property"].stringValue) + " / \(newValue["unit"].stringValue)"
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        topImage = UIImageView()
        self.addSubview(topImage)
        
        itemName = UILabel()
        itemName.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(itemName)
        
        goodsVolume = UILabel()
        goodsVolume.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        goodsVolume.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(goodsVolume)
        
        changeGoodsNumberView = ChangeGoodsNumberView(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height/6))
        self.addSubview(changeGoodsNumberView)
        
        
        
        
        
        changeGoodsNumberView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(frame.size.height/6)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-10)
        }
        
        goodsVolume.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(15)
            make.left.equalTo(changeGoodsNumberView)
            make.right.equalTo(changeGoodsNumberView)
            make.bottom.equalTo(changeGoodsNumberView.snp.top).offset(-5)
        }
        
        itemName.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(20)
            make.left.equalTo(changeGoodsNumberView)
            make.right.equalTo(changeGoodsNumberView)
            make.bottom.equalTo(goodsVolume.snp.top).offset(-5)
        }
        
        
        topImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self)
            make.left.equalTo(changeGoodsNumberView)
            make.right.equalTo(changeGoodsNumberView)
            make.bottom.equalTo(itemName.snp.top).offset(-5)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
