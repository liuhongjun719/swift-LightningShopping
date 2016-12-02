//
//  CigarettePurchasingAgentViewController.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/17.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import MJExtension
import ObjectMapper
import AlamofireObjectMapper

class CigarettePurchasingAgentViewController: ParentViewController {
    
    var collectionView: CigaretteCollectionView?
    var entryData = [ModelItem]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "香烟代购"
        let url = "http://www.52shangou.com/market/api/specialPrice/deliveryItems.jsonp?setId=15102&shopIds=14072"
        
        //collectionView
        collectionView = CigaretteCollectionView(frame: self.view.frame)
        self.view.addSubview(collectionView!)
        
        
//        Alamofire.request(url).validate().responseJSON { response in
////            self.homeCollectionView.endRefreshing()
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
////                self.collectionView?.parseDetailJson(data: json)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        
        
        
        
        //Object
        Alamofire.request(url, method: .get).validate().responseObject(keyPath: "entry"){ (response: DataResponse<EntryItem>) in
            let entryResponse = response.result.value
             self.collectionView?.parseData(data: (entryResponse?.items)!)
        }
        
        
        
        


        
        
        

//        let user = Mapper<ModelItem>().map(JSONString: "")

        
        
//        Alamofire.request(url).validate().responseJSON { response in
//            //            self.homeCollectionView.endRefreshing()
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                let user = Mapper<ModelItem>().map(JSONString: json.dictionary!["entry"]!["items"][0].stringValue)
//                print("user===============:\(user)")
//            case .failure(let error):
//                print(error)
//            }
//        }

        
  
        
        
        
        

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 248/255.0, green: 248/255.0, blue: 248/255.0, alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 255/255.0, green: 233/255.0, blue: 19/255.0, alpha: 1.0)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let model = self.entryData[0]
//        print("item000000-----------:\(model.bigPicUrl)")

    }
    


}
