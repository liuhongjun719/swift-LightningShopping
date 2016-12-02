//
//  CatListCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/26.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class CatListCell: UICollectionViewCell {
    var titleLabel: UILabel!
    var categoryImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        titleLabel.isUserInteractionEnabled = true
        self.addSubview(titleLabel)
        
        categoryImageView = UIImageView()
        categoryImageView.isUserInteractionEnabled = true
        self.addSubview(categoryImageView)
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(10)
            make.width.equalTo(self)
            make.height.equalTo(15)
        }
        
        categoryImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom)
//            make.width.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-5)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func catList(data: JSON) {
        titleLabel.text = data["catName"].stringValue
        categoryImageView.af_setImage(withURL: URL(string: data["imgUrl"].stringValue)!)
    }
}
