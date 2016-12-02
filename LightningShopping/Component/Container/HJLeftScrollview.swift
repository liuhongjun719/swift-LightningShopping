//
//  HJLeftScrollview.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/11.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON

class HJLeftScrollview: UIView, UITableViewDelegate, UITableViewDataSource {
    var leftTableView: UITableView!
    
    //加载数据
    var data: JSON?
    
    //点击左侧cell
    typealias ClickLeftRowBlock = (Int, _ data: JSON) -> Swift.Void
    var clickLeftRowBlock: ClickLeftRowBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftTableView = UITableView.init(frame: frame, style: .plain)
        leftTableView.delegate = self
        leftTableView.dataSource = self
        leftTableView.separatorColor = UIColor.clear
        self.addSubview(leftTableView)
        
        leftTableView.register(HJLeftRowCell.self, forCellReuseIdentifier: "HJLeftRowCell")
        leftTableView.selectRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, animated: true, scrollPosition: .none)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data != nil {
            return data!.count
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leftTableView.dequeueReusableCell(withIdentifier: "HJLeftRowCell", for: indexPath) as! HJLeftRowCell
        cell.leftTitle.text = data?.arrayValue[indexPath.row].dictionaryValue["cat"]?["name"].stringValue
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickLeftRowBlock!(indexPath.row, (data?.arrayValue[indexPath.row])!)
    }
    
    
    //MARK: - 加载数据
    func setLeftData(data: JSON) {
        self.data = data
        leftTableView.reloadData()
    }




}
