//
//  NewEveryDayCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/26.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class NewEveryDayCell: UICollectionViewCell {
    
    var topImage: UIButton!
    var bottomLeftImage: UIButton!
    var bottomRightImage: UIButton!
    var savedData: JSON?
    
    //点击图片
    typealias ClickItemOfNewEveryDayCellBlock = (_ tag: Int, _ data: JSON) -> Swift.Void
    var clickItemOfNewEveryDayCellBlock: ClickItemOfNewEveryDayCellBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        topImage = UIButton()
        topImage.tag = 300
        topImage.backgroundColor = UIColor.white
        self.addSubview(topImage)
        
        bottomLeftImage = UIButton()
        bottomLeftImage.tag = 301
        bottomLeftImage.backgroundColor = UIColor.white
        self.addSubview(bottomLeftImage)
        
        bottomRightImage = UIButton()
        bottomRightImage.tag = 302
        bottomRightImage.backgroundColor = UIColor.white
        bottomRightImage.addTarget(self, action: #selector(NewEveryDayCell.clickItem), for: .touchUpInside)
        self.addSubview(bottomRightImage)
        
        
        
        //snp
        topImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(self).multipliedBy(0.55)
            
        }
        
        bottomLeftImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(topImage.snp.bottom)
            make.left.equalTo(self).offset(10)
            make.width.equalTo((self.frame.size.width-20)/2)
            make.bottom.equalTo(self).offset(-10)
        }
        
        
        bottomRightImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(topImage.snp.bottom)
            make.left.equalTo(bottomLeftImage.snp.right)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(bottomLeftImage)
        }

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Method
    public func newEveryDay(data: JSON) {
        self.savedData = data
        topImage.af_setImage(for: .normal, url: URL(string:data["0"]["img"].stringValue)!)
        bottomLeftImage.af_setImage(for: .normal, url: URL(string:data["1"]["img"].stringValue)!)
        bottomRightImage.af_setImage(for: .normal, url: URL(string:data["2"]["img"].stringValue)!)

    }
    
    
    //MARK: - Action
    func clickItem(sender: UIButton) {
        clickItemOfNewEveryDayCellBlock!(sender.tag, self.savedData!)
    }
}
