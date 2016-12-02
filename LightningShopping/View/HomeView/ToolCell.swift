//
//  ToolCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/26.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class ToolCell: UICollectionViewCell {
//    var topImage: UIButton!
//    var firstItem: UIButton!
//    var secondItem: UIButton!
//    var thirdItem: UIButton!
//    var fourthItem: UIButton!
//    var sepratorView: UIView!
    
    var itemImageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        itemImageView = UIImageView()
        self.addSubview(itemImageView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)

        
        itemImageView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.top.equalTo(self).offset(5)
            make.height.equalTo(self).multipliedBy(0.5)
        }
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(itemImageView)
            make.top.equalTo(itemImageView.snp.bottom).offset(5)
            make.height.equalTo(self).multipliedBy(0.2)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Method
    public func tool(data: [String: JSON]) {
        titleLabel.text = data["text"]?.stringValue
        itemImageView.af_setImage(withURL: URL(string:(data["imgUrl"]?.stringValue)!)!)
    }
}
