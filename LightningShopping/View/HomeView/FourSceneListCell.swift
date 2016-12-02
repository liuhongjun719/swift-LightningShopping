//
//  FourSceneListCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/23.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class FourSceneListCell: UICollectionViewCell {
    var topImage: UIButton!
    var bottomLeftImageView: UIImageView!
    var bottomMiddleImageView: UIImageView!
    var bottomRightImageView: UIImageView!
    
    var bottomLeftView: UIButton!
    var bottomMiddleView: UIButton!
    var bottomRightView: UIButton!
    
    var leftTitle: UILabel!
    var middleTitle: UILabel!
    var rightTitle: UILabel!
    
    
    var leftPrice: UILabel!
    var middlePrice: UILabel!
    var rightPrice: UILabel!
    
    
    var sepratorView: UIView!
    
    //保存传递过来的数据
    var data: JSON?
    //点击图片
    typealias ClickItemOfFourSceneListCellBlock = (_ tag: Int, _ data: JSON) -> Swift.Void
    var clickItemOfFourSceneListCellBlock: ClickItemOfFourSceneListCellBlock?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        print("-=---------uuuuuuu")
        topImage = UIButton()
        topImage.addTarget(self, action: #selector(FourSceneListCell.fourSceneListAction(sender:)), for: .touchUpInside)

        topImage.tag = 300
        sepratorView = UIView()
        sepratorView.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        
        bottomLeftImageView = UIImageView()
        bottomLeftImageView.layer.borderColor =  UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0).cgColor
        bottomLeftImageView.layer.borderWidth = 0.5
        
        
        bottomMiddleImageView = UIImageView()
        bottomMiddleImageView.layer.borderColor =  UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0).cgColor
        bottomMiddleImageView.layer.borderWidth = 0.5
        
        bottomRightImageView = UIImageView()
        bottomRightImageView.layer.borderColor =  UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0).cgColor
        bottomRightImageView.layer.borderWidth = 0.5
        
        
        bottomLeftView = UIButton()
        bottomLeftView.tag = 301
        bottomLeftView.addTarget(self, action: #selector(FourSceneListCell.fourSceneListAction(sender:)), for: .touchUpInside)

        bottomMiddleView = UIButton()
        bottomMiddleView.tag = 302
        bottomMiddleView.addTarget(self, action: #selector(FourSceneListCell.fourSceneListAction(sender:)), for: .touchUpInside)

        bottomRightView = UIButton()
        bottomRightView.tag = 303
        bottomRightView.addTarget(self, action: #selector(FourSceneListCell.fourSceneListAction(sender:)), for: .touchUpInside)

        
        
        //title
        leftTitle = UILabel()
        leftTitle.textAlignment = .center
        leftTitle.font = UIFont.systemFont(ofSize: 12)
        
        middleTitle = UILabel()
        middleTitle.textAlignment = .center
        middleTitle.font = UIFont.systemFont(ofSize: 12)
        
        rightTitle = UILabel()
        rightTitle.textAlignment = .center
        rightTitle.font = UIFont.systemFont(ofSize: 12)
        
        
        //price
        leftPrice = UILabel()
        leftPrice.textAlignment = .center
        leftPrice.font = UIFont.systemFont(ofSize: 10)
        leftPrice.textColor = UIColor.red
        
        middlePrice = UILabel()
        middlePrice.textAlignment = .center
        middlePrice.font = UIFont.systemFont(ofSize: 10)
        middlePrice.textColor = UIColor.red
        
        rightPrice = UILabel()
        rightPrice.textAlignment = .center
        rightPrice.font = UIFont.systemFont(ofSize: 10)
        rightPrice.textColor = UIColor.red


        
        
        self.addSubview(topImage)
        self.addSubview(bottomLeftView)
        self.addSubview(bottomMiddleView)
        self.addSubview(bottomRightView)
        
        
        self.addSubview(sepratorView)
        
        
        
        bottomLeftView.addSubview(bottomLeftImageView)
        bottomMiddleView.addSubview(bottomMiddleImageView)
        bottomRightView.addSubview(bottomRightImageView)
        
        
        bottomLeftView.addSubview(leftTitle)
        bottomMiddleView.addSubview(middleTitle)
        bottomRightView.addSubview(rightTitle)
        
        
        bottomLeftView.addSubview(leftPrice)
        bottomMiddleView.addSubview(middlePrice)
        bottomRightView.addSubview(rightPrice)
        
        
        topImage.backgroundColor = UIColor.white
        bottomLeftView.backgroundColor = UIColor.white
        bottomMiddleView.backgroundColor = UIColor.white
        bottomRightView.backgroundColor = UIColor.white
        
//        bottomLeftImageView.backgroundColor = UIColor.purple
//        bottomMiddleImageView.backgroundColor = UIColor.green
//        bottomRightImageView.backgroundColor = UIColor.blue
        

        
        //top
        topImage.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(self).dividedBy(2)
            make.top.equalTo(self)
        }
        
        //seprator
        sepratorView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(10)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        
        //three back view
        bottomLeftView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(topImage.snp.bottom)
            make.left.equalTo(topImage)
            make.width.equalTo((self.frame.size.width-40)/3)
            make.bottom.equalTo(sepratorView).offset(-10)
        }
        bottomMiddleView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bottomLeftView)
            make.left.equalTo(bottomLeftView.snp.right).offset(10)
            make.width.equalTo(bottomLeftView)
            make.height.equalTo(bottomLeftView)
        }
        

        bottomRightView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bottomMiddleView)
            make.left.equalTo(bottomMiddleView.snp.right).offset(10)
            make.width.equalTo(bottomMiddleView)
            make.height.equalTo(bottomMiddleView)
        }
        
        
        
        //image
        bottomLeftImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bottomLeftView)
            make.left.equalTo(bottomLeftView)
            make.right.equalTo(bottomLeftView)
            make.height.equalTo(bottomLeftView).multipliedBy(0.75)
        }
        
        bottomMiddleImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bottomMiddleView)
            make.left.equalTo(bottomMiddleView)
            make.right.equalTo(bottomMiddleView)
            make.height.equalTo(bottomMiddleView).multipliedBy(0.75)
        }
        
        
        bottomRightImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bottomRightView)
            make.left.equalTo(bottomRightView)
            make.right.equalTo(bottomRightView)
            make.height.equalTo(bottomRightView).multipliedBy(0.75)
        }
        
        
        //title
        leftTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bottomLeftImageView.snp.bottom).offset(3)
            make.width.equalTo(bottomLeftImageView)
            make.height.equalTo(bottomLeftView).multipliedBy(0.11)
            make.left.equalTo(bottomLeftImageView)
            make.right.equalTo(bottomLeftImageView)
        }
        
        middleTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bottomMiddleImageView.snp.bottom).offset(3)

            make.width.equalTo(bottomMiddleImageView)
            make.height.equalTo(bottomMiddleView).multipliedBy(0.11)
            make.left.equalTo(bottomMiddleImageView)
            make.right.equalTo(bottomMiddleImageView)
        }
        
        rightTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bottomRightImageView.snp.bottom).offset(3)

            make.width.equalTo(bottomRightImageView)
            make.height.equalTo(bottomRightView).multipliedBy(0.11)
            make.left.equalTo(bottomRightImageView)
            make.right.equalTo(bottomRightImageView)
        }
        
        //price
        leftPrice.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(leftTitle.snp.bottom)
            make.width.equalTo(bottomLeftImageView)
            make.height.equalTo(bottomLeftView).multipliedBy(0.1)
            make.left.equalTo(bottomLeftImageView)
            make.right.equalTo(bottomLeftImageView)
        }
        
        middlePrice.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(middleTitle.snp.bottom)
            make.width.equalTo(bottomMiddleImageView)
            make.height.equalTo(bottomMiddleView).multipliedBy(0.1)
            make.left.equalTo(bottomMiddleImageView)
            make.right.equalTo(bottomMiddleImageView)
        }
        
        
        rightPrice.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(rightTitle.snp.bottom)
            make.width.equalTo(bottomRightImageView)
            make.height.equalTo(bottomRightView).multipliedBy(0.1)
            make.left.equalTo(bottomRightImageView)
            make.right.equalTo(bottomRightImageView)
        }
        
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 获取数据
    public func fourSceneList(data: JSON) {
        self.data = data
        let itemList = data["itemList"].arrayValue
        
        
        topImage.af_setImage(for: .normal, url: URL(string: data["imgUrl"].stringValue)!)
        
        
        bottomLeftImageView.af_setImage(withURL: URL(string: itemList[0]["imgUrl"].stringValue)!)
        
        
        leftTitle.text = itemList[0]["itemName"].stringValue
        leftPrice.text = String.init(format: "¥%.2f", itemList[0]["itemPrice"].float! / 100)
        
        
        
        
        bottomMiddleImageView.af_setImage(withURL: URL(string: itemList[1]["imgUrl"].stringValue)!)
        middleTitle.text = itemList[1]["itemName"].stringValue
        middlePrice.text = String.init(format: "¥%.2f", (itemList[0]["itemPrice"].float! / 100))
        
        
        
        
        bottomRightImageView.af_setImage(withURL: URL(string: itemList[2]["imgUrl"].stringValue)!)
        rightTitle.text = itemList[2]["itemName"].stringValue
        middlePrice.text = String.init(format: "¥%.2f", itemList[0]["itemPrice"].float! / 100)
    }
    
    func fourSceneListAction(sender: UIButton) {
        switch sender.tag {
        case 300:
            clickItemOfFourSceneListCellBlock!(sender.tag, nil)
            break
        case 301:
            clickItemOfFourSceneListCellBlock!(sender.tag, (self.data?["itemList"].arrayValue[0])!)
            break
        case 302:
            clickItemOfFourSceneListCellBlock!(sender.tag, (self.data?["itemList"].arrayValue[1])!)
            break
        case 303:
            clickItemOfFourSceneListCellBlock!(sender.tag, (self.data?["itemList"].arrayValue[2])!)
            break
        default:
            break
            
        }
        
    }

    
    
}
