//
//  FourActListDetailViewController.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/28.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


//public struct DefaultDataResponse {
//    public let data: NSDictionary!
//    public let tag: Int
//
//    init(tag: Int, data: NSDictionary) {
//        self.tag = tag
//        self.data = data
//    }
//}

class FourActListDetailViewController: ParentViewController {
    
    var tag: Int!
    var data: JSON!
    var homeScrollToTopIndicator: HomeScrollToTopIndicator!
    var url: String!

    
    var fourActListDetailCollectionView: FourActListDetailCollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("tag===============:\(tag)")
        if tag == 100 {
            self.view.backgroundColor = UIColor.init(red: 241/255.0, green: 104/255.0, blue: 24/255.0, alpha: 1.0)
            url = "http://www.52shangou.com/market/api/specialprice/activityPage.jsonp?callback=jsonp1&setId=15397&shopIds=14072"
        }else if tag == 101 {
            self.view.backgroundColor = UIColor.init(red: 222/255.0, green: 30/255.0, blue: 186/255.0, alpha: 1.0)
            url = "http://www.52shangou.com/market/api/specialprice/activityPage.jsonp?callback=jsonp1&setId=15097&shopIds=14072"
        }else if tag == 102 {
            self.view.backgroundColor = UIColor.init(red: 40/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
            url = "http://www.52shangou.com/market/api/specialprice/activityPage.jsonp?callback=jsonp1&setId=15098&shopIds=14072"
        }
        
        
        fourActListDetailCollectionView = FourActListDetailCollectionView(frame: self.view.frame)
        self.view.addSubview(fourActListDetailCollectionView)
        fourActListDetailCollectionView.scrollBlock = {(isHidden) in
            self.homeScrollToTopIndicator.isHidden = isHidden
        }
        
        //进入商品详情界面
        fourActListDetailCollectionView.didSelectItem = {(data) in
            let fourActListGoodsDetailViewController = FourActListGoodsDetailViewController()
            fourActListGoodsDetailViewController.data = data
            fourActListGoodsDetailViewController.isFromSearchGoods = false
            self.navigationController?.pushViewController(fourActListGoodsDetailViewController, animated: true)
        }
        
        

        
        //scroll to top button
        homeScrollToTopIndicator = HomeScrollToTopIndicator(frame: CGRect.init(x: self.view.frame.size.width-50, y: self.view.frame.size.height-120, width: 40, height: 40))
        homeScrollToTopIndicator.scrollToTopBlock = {() in
            self.fourActListDetailCollectionView.collectionView.scrollToItem(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
        }
        self.view.addSubview(homeScrollToTopIndicator)
        
        
        
        
        
        
        
        Alamofire.request(url)
            .responseString { response in
                self.fourActListDetailCollectionView.parseJson(data: response.result.value! as String)
            }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
