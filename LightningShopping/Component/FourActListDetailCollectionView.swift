//
//  FourActListDetailCollectionView.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/29.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON

class FourActListDetailCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView! = nil
    
    //创建block变量
    typealias ScrollViewDidScrollBlock = (_ isHidden: Bool) -> Swift.Void
    var scrollBlock:ScrollViewDidScrollBlock!
    
    
    //saved data
    var activityVoData: [String : JSON]! //1
    var hotItemData: Array<Any> = Array()//2
    var categoryItemData: Array<Any> = Array()//3
    
    
    var ruleString: String!
    
    //点击item
    typealias DidSelectItem = (_ data: JSON) -> Swift.Void
    var didSelectItem:DidSelectItem!
    


    //MARK: - UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .vertical;
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout);
        collectionView.backgroundColor = UIColor.clear
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(CatListHeaderReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier:"Header")
        
        collectionView.register(FourActListDetailFooterReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionFooter", withReuseIdentifier:"FourActListDetailFooterReusableView")
        
     
        collectionView.register(FourActListDetailHeaderCell.self, forCellWithReuseIdentifier: "FourActListDetailHeaderCell")
        collectionView.register(FourActListDetailCell.self, forCellWithReuseIdentifier: "FourActListDetailCell")
        collectionView.register(FourActListDetailItemCell.self, forCellWithReuseIdentifier: "FourActListDetailItemCell")

        self.addSubview(collectionView)
        
        
        ruleString = "  活动规则\n\n1.同一用户不限购买次数，可以重复购买\n2.活动商品仅支持在线支付订单\n3.活动商品已属于特价产品，不与满减活动共享\n4.活动商品仅支持送货上门订单\n5.活动商品不受起送金额的限制\n6.活动商品一旦生成订单，不管是否付款、是否交易成功，均视为当日已经参加过活动\n本次活动最终解释权归闪电购所有\n"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - parse data
    public func parseJson(data: String) {
        var responseString = data
        responseString = responseString.replacingOccurrences(of: "jsonp1(", with: "")
        responseString = responseString.replacingOccurrences(of: ");", with: "")
        var json = JSON.parse(responseString)//将字符串转成json串
        self.activityVoData = json["entry"]["activityVo"].dictionaryValue
        self.hotItemData = json["entry"]["hotItem"].arrayValue
        self.categoryItemData = json["entry"]["categoryItem"][0]["itemList"].arrayValue
        print("self.activityVoData========:\(self.activityVoData["rule"])")

        collectionView.reloadData()
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            if self.activityVoData == nil {
                return 0
            }
            return 1
        }else if section == 1 {
            if self.hotItemData.count == 0 {
                return 0
            }
            return self.hotItemData.count
        }else if section == 2 {
            if self.categoryItemData.count == 0 {
                return 0
            }
            return self.categoryItemData.count
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let identifier = "FourActListDetailHeaderCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FourActListDetailHeaderCell;
//            print("count-------------:\(self.activityVoData?.count)")
            cell.data = self.activityVoData!
            return cell;
        }else if indexPath.section == 1 {
            let identifier = "FourActListDetailCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FourActListDetailCell;
            cell.data = self.hotItemData[indexPath.row] as! JSON
            return cell;
        }else {
            let identifier = "FourActListDetailItemCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FourActListDetailItemCell;
            cell.data = self.categoryItemData[indexPath.row] as! JSON
            cell.changeGooodsNumberBlock = {()in
            self.collectionView.reloadData()
                
            }
            return cell;
        }
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {//
            return CGSize(width: self.frame.size.width, height: 200)
        }else if indexPath.section == 1 {//
            return CGSize(width: self.frame.size.width, height: 140)
        }else if indexPath.section == 2 {
            return CGSize(width: (self.frame.size.width)/2, height: 240)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 2 {
            return CGSize.init(width: UIScreen.main.bounds.size.width, height: 40)
        }

        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 2 {
            return CGSize.init(width: UIScreen.main.bounds.size.width, height: 200)
        }
        return CGSize.zero
    }
    

    

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print("pppppppppppp----------------")
        var resuableView: UICollectionReusableView?
        if kind == "UICollectionElementKindSectionHeader"  {
            if indexPath.section == 2 {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader" , withReuseIdentifier: "Header", for: indexPath) as? CatListHeaderReusableView
                view?.headerTitle.textColor = UIColor.white
                view?.headerTitle.text = "- 全部商品 -"
                resuableView = view
            }
        }
        else if kind == "UICollectionElementKindSectionFooter" {
            
            if indexPath.section == 2 {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionFooter" , withReuseIdentifier: "FourActListDetailFooterReusableView", for: indexPath) as? FourActListDetailFooterReusableView
                    view?.rule.text = ruleString
                resuableView = view
            }
            
 
        }
        return resuableView!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        print("didSelectItemAt============:\(indexPath.row)")
        if indexPath.section == 2 {
            let data =  self.categoryItemData[indexPath.row] as! JSON
            didSelectItem(data)
        }
        
    }
    
    

    
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 500 {
            scrollBlock(false)
        }else {
            scrollBlock(true)
        }
    }
    
    


}
