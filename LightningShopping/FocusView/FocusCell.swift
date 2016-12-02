//
//  FocusCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/27.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class FocusCell: UICollectionViewCell {
    var headerImage: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)

        headerImage = UIButton()
        self.addSubview(headerImage)
        
        headerImage.snp.makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    public func setHeaderData(data: NSDictionary) {
//        headerImage.af_setImage(for: .normal, url: URL(string: data.object(forKey: "imgUrl") as! String)!)
//    }
    
    public func setHeaderData(data: JSON) {
        headerImage.af_setImage(for: .normal, url: URL(string: data["imgUrl"].stringValue)!)
    }
    
    
}
