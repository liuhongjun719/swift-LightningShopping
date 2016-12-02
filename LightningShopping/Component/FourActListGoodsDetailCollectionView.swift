//
//  FourActListGoodsDetailCollectionView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/9.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON

class FourActListGoodsDetailCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView! = nil
    var entryDetailData: JSON?
    var entryRelationsData: JSON?
    
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
        collectionView.backgroundColor = UIColor.white
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.bounces = false
        collectionView.register(CatListHeaderReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier:"Header")
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionFooter", withReuseIdentifier:"UICollectionReusableView")

        
        
        
        collectionView.register(GoodsDetailImageCell.self, forCellWithReuseIdentifier: "GoodsDetailImageCell")
        collectionView.register(GoodsDetailAddressCell.self, forCellWithReuseIdentifier: "GoodsDetailAddressCell")
        collectionView.register(GoodsDetailWantBuyCell.self, forCellWithReuseIdentifier: "GoodsDetailWantBuyCell")
        
        self.addSubview(collectionView)
        
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - parse data
    public func parseDetailJson(data: JSON) {
        self.entryDetailData = data["entry"]
//        print("JSON888888---------: \(self.entryDetailData)")
        collectionView.reloadData()
    }
    
    
    public func parseRelationsJson(data: JSON) {
        self.entryRelationsData = data["entry"]["items"]
        print("JSON7777777---------: \(self.entryRelationsData?.arrayValue.count)")
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section < 2 {
//            guard self.entryDetailData != nil else {
//                return 0
//            }
            if self.entryDetailData != nil {
                return 1
            }
            return 0

        }
        else if section == 2 {
            if self.entryRelationsData == nil {
                return 0
            }
            return self.entryRelationsData!.arrayValue.count
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let identifier = "GoodsDetailImageCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! GoodsDetailImageCell;
            cell.data = self.entryDetailData!
            return cell;
        }else if indexPath.section == 1 {
            let identifier = "GoodsDetailAddressCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! GoodsDetailAddressCell;
            cell.data = self.entryDetailData!
            return cell;
        }else {
            let identifier = "GoodsDetailWantBuyCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! GoodsDetailWantBuyCell;
            cell.data = self.entryRelationsData!.arrayValue[indexPath.row]
            return cell;
        }
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {//
            return CGSize(width: self.frame.size.width, height: 400)
        }else if indexPath.section == 1 {//
            return CGSize(width: self.frame.size.width, height: 100)
        }else if indexPath.section == 2 {
            return CGSize(width: (self.frame.size.width)/3, height: (self.frame.size.width)/3 + 80)
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
            return CGSize.init(width: UIScreen.main.bounds.size.width, height: 60)
        }
        return CGSize.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print("pppppppppppp----------------")
        var resuableView: UICollectionReusableView?
        if kind == "UICollectionElementKindSectionHeader"  {
            if indexPath.section == 2 {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader" , withReuseIdentifier: "Header", for: indexPath) as? CatListHeaderReusableView
                view?.headerTitle.textColor = UIColor.black
                view?.headerTitle.text = "  您可能还想买"
                view?.headerTitle.textAlignment = .left
                view?.headerTitle.backgroundColor = UIColor.white
                resuableView = view
            }
        }else if kind == "UICollectionElementKindSectionFooter" {
            
            if indexPath.section == 2 {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionFooter" , withReuseIdentifier: "UICollectionReusableView", for: indexPath)
                view.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)

                resuableView = view
            }
            
            
        }


        return resuableView!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
