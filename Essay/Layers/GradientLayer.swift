//
//  GradientLayer.swift
//  Essay
//
//  Created by Frank_s on 16/12/16.
//  Copyright © 2016年 Frank_s. All rights reserved.
//

import UIKit

/// 渐变图层
class GradientLayer: UIView {
    
    let gl: CAGradientLayer = {
    
        let g = CAGradientLayer()
        
        g.colors = [UIColor.red.cgColor,UIColor.blue.cgColor,UIColor.brown.cgColor]
        // 颜色渐变的起点
        g.startPoint = CGPoint(x: 0.0, y: 0.0)
        // 颜色渐变的终点
        g.endPoint = CGPoint(x: 1.0, y: 0.0)
        // 不同颜色渐变的发生位置
        g.locations = [0.25,0.5,0.75]
        
        // 以上4个属性都是可以 动画处理
        
        // 图层绘制的梯度样式  就这一种  默认
        g.type = kCAGradientLayerAxial
        
        return g
    
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gl.frame = self.bounds
        gl.position = self.center
        
        self.layer.addSublayer(gl)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
