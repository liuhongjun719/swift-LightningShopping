//
//  FourActListFooterReusableView.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/28.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit

class FourActListFooterReusableView: UICollectionReusableView {
    var footerImageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        footerImageView = UIImageView()
        footerImageView.image = UIImage.init(named: "hasNoMore")
        self.addSubview(footerImageView)
        
        
        footerImageView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(80)
            make.height.equalTo(self)
            make.center.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
