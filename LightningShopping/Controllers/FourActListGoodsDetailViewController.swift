//
//  FourActListGoodsDetailViewController.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/9.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FourActListGoodsDetailViewController: ParentViewController {

    var detailUrl: String!
    var relationsUrl: String!
    
    
    
    var itemId: String!
    
    var data: JSON?
    
    var isFromSearchGoods: Bool?//从FourActListDetailViewController界面进来时 还是 从SearchGoodsViewController界面过来，因为里面的字段名字不同
    
    
    
    
    var fourActListGoodsDetailCollectionView: FourActListGoodsDetailCollectionView! = nil
    
    var tabBottomView: TabBottomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailUrl = String.init(format: "http://www.52shangou.com/itemcenter/buyer/open/item/detail.jsonp?itemId=%@", (data?["id"].stringValue)!)
        
        if self.isFromSearchGoods == true {//SearchGoodsViewController
            relationsUrl = String.init(format: "http://www.52shangou.com/itemcenter/buyer/open/item/detail/relations.jsonp?catId=%@&shopId=%@&shopIds=%@&itemId=%@", data!["catId"].stringValue, data!["shopId"].stringValue, data!["shopId"].stringValue, (data?["id"].stringValue)!)
            print("dddddddd--------:\(data)")

        }else {//FourActListDetailViewController
            relationsUrl = String.init(format: "http://www.52shangou.com/itemcenter/buyer/open/item/detail/relations.jsonp?catId=%@&shopId=%@&shopIds=%@&itemId=%@", data!["itemCatId"].stringValue, data!["shopId"].stringValue, data!["shopId"].stringValue, (data?["id"].stringValue)!)

        }
        
//        "http://www.52shangou.com/itemcenter/buyer/open/item/detail.jsonp?itemId=100066421&callback=jsonp_08384426864795387&v=08669156201649457"
//        
//        
//        "http://www.52shangou.com/itemcenter/buyer/open/item/detail/relations.jsonp?catId=2474&shopId=14072&shopIds=14072&itemId=5366322&callback=jsonp_041361168399453163&v=005355202662758529"
//        
//        "http://www.52shangou.com/itemcenter/buyer/open/item/detail/relations.jsonp?catId=2583&shopId=14072&shopIds=14072&itemId=5369415&callback=jsonp_019923851802013814&v=05891895114909858"
        
        print("relationsUrl---------:\(relationsUrl)")
        
        
        
        fourActListGoodsDetailCollectionView = FourActListGoodsDetailCollectionView(frame: self.view.frame)
        self.view.addSubview(fourActListGoodsDetailCollectionView)
        
        tabBottomView = TabBottomView(frame: CGRect.init(x: 0, y:  UIScreen.main.bounds.size.height-50, width: UIScreen.main.bounds.size.width, height: 50))
        self.view.addSubview(tabBottomView)
        
        


        
        
        Alamofire.request(detailUrl).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
            self.fourActListGoodsDetailCollectionView.parseDetailJson(data: json)
            case .failure(let error):
                print(error)
            }
        }
        
        
        Alamofire.request(relationsUrl).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
            self.fourActListGoodsDetailCollectionView.parseRelationsJson(data: json)
            case .failure(let error):
                print(error)
            }
        }
        
        
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
