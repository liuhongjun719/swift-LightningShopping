//
//  HandleView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/10.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit

class HandleView: NSObject {
    func clipView(view: UIView, roundingCorners: UIRectCorner, cornerRadii: CGSize, fillColor: UIColor, strokeColor: UIColor, lineWidth: CGFloat)
    {
        let rounded = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerRadii)
        let shape = CAShapeLayer()
        shape.path = rounded.cgPath
        shape.fillColor = fillColor.cgColor
        shape.strokeColor = strokeColor.cgColor
        shape.lineWidth = lineWidth
        view.layer.mask = shape
    }

}
