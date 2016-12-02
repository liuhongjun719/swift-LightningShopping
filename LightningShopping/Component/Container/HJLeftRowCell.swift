//
//  HJLeftRowCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/11.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit

class HJLeftRowCell: UITableViewCell {
    
    var leftTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        if selected {
            leftTitle.backgroundColor = UIColor.init(red: 255/255.0, green: 158/255.0, blue: 15/255.0, alpha: 1.0)
            leftTitle.textColor = UIColor.white
        }else {
            leftTitle.backgroundColor = UIColor.white
            leftTitle.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)

        }
    }


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        print("-----UITableViewCellStyle-----")
        self.selectionStyle = .none
        leftTitle = UILabel()
        leftTitle.layer.cornerRadius = 10
        leftTitle.layer.masksToBounds = true
        leftTitle.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        leftTitle.font = UIFont.systemFont(ofSize: 13)
        leftTitle.textAlignment = .center
        self.addSubview(leftTitle)
        
        leftTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.left.equalTo(5)
            make.right.equalTo(-5)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    func clipView() {
//        //        UIBezierPath
//        let path = UIBezierPath.init(roundedRect: leftTitle.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize.init(width: 10, height: 10))
//        let layer = CAShapeLayer()
//        layer.path = path.cgPath
////        layer.fillColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 0.5).cgColor
//        leftTitle.layer.addSublayer(layer)
//    }
    
    



}
