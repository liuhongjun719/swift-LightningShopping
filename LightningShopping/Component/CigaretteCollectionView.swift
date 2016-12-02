//
//  CigaretteCollectionView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/17.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJExtension
import ObjectMapper
import Alamofire

class CigaretteCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var collectionView: UICollectionView! = nil



    var modelArray: [ModelItem]?
    
    
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
        collectionView.bounces = true
        collectionView.register(CatListHeaderReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier:"Header")
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionFooter", withReuseIdentifier:"UICollectionReusableView")
        
        
        
        
        collectionView.register(CigaretteCell.self, forCellWithReuseIdentifier: "CigaretteCell")
        
        self.addSubview(collectionView)
        
//        let url = "http://www.52shangou.com/market/api/specialPrice/deliveryItems.jsonp?setId=15102&shopIds=14072"
//        Alamofire.request(url).validate().responseObject(keyPath: "entry"){ (response: DataResponse<EntryItem>) in
//            let entryResponse = response.result.value
//            print("cd.............:\(entryResponse?.cd?.actDesc)")
//            
//            self.modelArray = (entryResponse?.items)!
//            print("item-----------:\(self.modelArray?[0].bigPicUrl)")
//
//            self.collectionView.reloadData()
//        }
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - parse data
    public func parseDetailJson(data: JSON) {
//        self.entryData = data["entry"]["items"]
        collectionView.reloadData()
    }
    
    func parseData(data: [ModelItem]) {
        self.modelArray = data
        collectionView.reloadData()
    }
    

    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.modelArray == nil {
            return 0
        }
        return self.modelArray!.count

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "CigaretteCell";
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CigaretteCell;
//        cell.data = (self.entryData?[indexPath.row])!
        if let item = self.modelArray?[indexPath.row] {
            cell.data = item
        }

        return cell;
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.init(width: UIScreen.main.bounds.size.width, height: 40)
        }
        return CGSize.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.init(width: UIScreen.main.bounds.size.width, height: 60)
        }
        return CGSize.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //        print("pppppppppppp----------------")
        var resuableView: UICollectionReusableView?
        if kind == "UICollectionElementKindSectionHeader"  {
            if indexPath.section == 0 {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader" , withReuseIdentifier: "Header", for: indexPath) as? CatListHeaderReusableView
                view?.headerTitle.textColor = UIColor.black
                view?.headerTitle.text = "  您可能还想买"
                view?.headerTitle.textAlignment = .left
                view?.headerTitle.backgroundColor = UIColor.white
                resuableView = view
            }
        }else if kind == "UICollectionElementKindSectionFooter" {
            
            if indexPath.section == 0 {
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
