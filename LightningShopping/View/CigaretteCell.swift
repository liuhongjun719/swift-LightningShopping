//
//  CigaretteCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/17.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON


class CigaretteCell: UICollectionViewCell {
    var goodsImage: UIImageView!
    var goodsName: UILabel!
    var goodsPrice: UILabel!
    var sepratorView: UIView!
    
    
    var data: ModelItem! {
        didSet {
            let imageUrl = "http://imgsize.52shangou.com/img/" + "\(data.bigPicUrl!)"
            goodsImage.af_setImage(withURL: URL(string:imageUrl)!)
            goodsPrice.text = String.init(format: "￥%i", data.price!)//调整小数
            goodsName.text = String.init(format: "%@%@%@", data.brand!, data.name!, data.property!)
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        goodsImage = UIImageView()
        self.addSubview(goodsImage)
        
        goodsName = UILabel()
        goodsName.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(goodsName)
        
        
        goodsPrice = UILabel()
        goodsPrice.font = UIFont.systemFont(ofSize: 20)
        goodsPrice.textColor = UIColor.red
        self.addSubview(goodsPrice)
        
        
        sepratorView = UIView()
        sepratorView.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        self.addSubview(sepratorView)
        
        
        
        sepratorView.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(1)
        }
        
        goodsImage.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.bottom.equalTo(sepratorView.snp.top).offset(-10)
            make.width.equalTo(self.frame.size.height)
            make.top.equalTo(self)
        }
        
        goodsPrice.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(goodsImage.snp.right).offset(10)
            make.height.equalTo(20)
            make.bottom.equalTo(sepratorView.snp.top).offset(-5)
            make.width.equalTo(80)
        }
        
        
        goodsName.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(goodsImage.snp.right).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.height.equalTo(30)
            make.top.equalTo(self).offset(10)
        }
        

        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
