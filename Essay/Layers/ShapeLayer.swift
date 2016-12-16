//
//  ShapeLayer.swift
//  Essay
//
//  Created by Frank_s on 16/12/16.
//  Copyright © 2016年 Frank_s. All rights reserved.
//

import UIKit

/// 
/*
 CALayer 在初始化时 需要给定一个frame，这个frame 值一般都与其给定的view的bounds值一致，它本身是有形状的，而且是矩形
 
 CAShapeLayer 在初始化时也需要给一个frame，但是它本身是没有形状的，它的形状的来源于 你 给定的一个path，然后它去取CGPath值
 
 ps：
 CAShapeLayer 依附于一个给定的path，即使path不完整也会自动收尾相接
 strokeStart 以及 strokeEnd 代表 这个path 中所占用的百分比
 CAShapeLayer 动画仅仅限于沿着边缘的动画效果，实现不了填充效果
 
 CAShapeLayer  的 path 属性 配合 UIBezierPath 可以绘制不同的形状
 */
class ShapeLayer: UIView {
    
    let shape: CAShapeLayer = {
    
        let s = CAShapeLayer()
        // 边缘线的颜色
        s.strokeColor = UIColor.green.cgColor
        // 闭环填充颜色
        s.fillColor = UIColor.clear.cgColor
        // 边缘线的类型
        s.lineCap = kCALineCapSquare
        // 线宽
        s.lineWidth = 10.0
        // 绘制起点
        s.strokeStart = 0.0
        // 绘制终点
        s.strokeEnd = 0.0
        return s
    
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        let path = UIBezierPath(arcCenter: CGPoint(x: frame.size.height/2.0, y: frame.size.height/2.0), radius: frame.size.height/2.0, startAngle: 0.0, endAngle: CGFloat(M_PI*2.0), clockwise: true)
        
        shape.path = path.cgPath
        shape.bounds = self.bounds
        self.layer.addSublayer(shape)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
