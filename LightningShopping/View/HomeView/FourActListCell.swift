//
//  FourActListCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/26.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class FourActListCell: UICollectionViewCell {
    var headerLabel: UILabel!
    var leftImage: UIButton!
    var rightTopImage: UIButton!
    var rightBottomLeftImage: UIButton!
    var rightBottomRightImage: UIButton!
    var sepratorView: UIView!
    var savedData: JSON!
    
    typealias FourActListBlock = (_ tag: Int, _ data: JSON) -> Swift.Void
//    var leftBlock: FourActListBlock!
//    var rightTopBlock: FourActListBlock!
//    var rightBottomLeftBlock: FourActListBlock!
    
    var fourActListBlock: FourActListBlock!


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        headerLabel = UILabel()
        headerLabel.text = "今日疯抢"
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.systemFont(ofSize: 12)
        headerLabel.backgroundColor = UIColor.white
        self.addSubview(headerLabel)
        
        
        leftImage = UIButton()
        leftImage.tag = 100;
        leftImage.backgroundColor = UIColor.white
        leftImage.addTarget(self, action: #selector(FourActListCell.fourActListAction), for: .touchUpInside)
        self.addSubview(leftImage)
        
        rightTopImage = UIButton()
        rightTopImage.tag = 101
        rightTopImage.backgroundColor = UIColor.white
        rightTopImage.addTarget(self, action: #selector(FourActListCell.fourActListAction), for: .touchUpInside)
        self.addSubview(rightTopImage)
        
        rightBottomLeftImage = UIButton()
        rightBottomLeftImage.tag = 102
        rightBottomLeftImage.backgroundColor = UIColor.white
        rightBottomLeftImage.addTarget(self, action: #selector(FourActListCell.fourActListAction), for: .touchUpInside)

        self.addSubview(rightBottomLeftImage)
        
        rightBottomRightImage = UIButton()
        rightBottomRightImage.backgroundColor = UIColor.white
        self.addSubview(rightBottomRightImage)
        
        sepratorView = UIView()
        sepratorView.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        self.addSubview(sepratorView)
        
        //header
        headerLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self)
            make.left.right.equalTo(self)
            make.height.equalTo(self.frame.size.height/6)
        }
        
        
        //seprator
        sepratorView.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(10)
            make.bottom.equalTo(self)

        }
        
        
        //image
        leftImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(headerLabel.snp.bottom)
            make.left.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.4)
            make.bottom.equalTo(sepratorView.snp.top)
        }
        
        rightTopImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(leftImage)
            make.left.equalTo(leftImage.snp.right)
            make.right.equalTo(self)
            make.height.equalTo((self.frame.size.height - self.frame.size.height/6-10)/2)
        }
        
        rightBottomLeftImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(rightTopImage.snp.bottom)
            make.left.equalTo(leftImage.snp.right)
            make.width.equalTo((self.frame.size.width - self.frame.size.width*0.4)/2)
            make.bottom.equalTo(leftImage)
        }
        
        rightBottomRightImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(rightTopImage.snp.bottom)
            make.left.equalTo(rightBottomLeftImage.snp.right)
            make.right.equalTo(self)
            make.bottom.equalTo(leftImage)
        }
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Method
    public func fourActList(data: JSON) {//error？
        savedData = data
        leftImage.af_setImage(for: .normal, url: URL(string:data["0"]["imgUrl"].stringValue)!)
        rightTopImage.af_setImage(for: .normal, url: URL(string:data["1"]["imgUrl"].stringValue)!)
        rightBottomLeftImage.af_setImage(for: .normal, url: URL(string:data["2"]["imgUrl"].stringValue)!)
        rightBottomRightImage.af_setImage(for: .normal, url: URL(string:data["3"]["imgUrl"].stringValue)!)
        
    }
    
    
    
    
    
    //MARK: - Action
//    func clickLeftImage()  {
//        leftBlock((savedData.object(forKey: "0") as! NSDictionary))
//    }
//    func clickRightTopImage()  {
//        rightTopBlock((savedData.object(forKey: "1") as! NSDictionary))
//    }
//    
//    func clickRightBottomLeftImage()  {
//        rightBottomLeftBlock((savedData.object(forKey: "2") as! NSDictionary))
//    }
    
    
//    func  fourActListAction(sender: UIButton) {
//        fourActListBlock(sender.tag, (savedData.object(forKey: "\(sender.tag-100)") as! NSDictionary))
//    }
    
    
    func  fourActListAction(sender: UIButton) {
        fourActListBlock(sender.tag, savedData["\(sender.tag-100)"])
    }

    
}





