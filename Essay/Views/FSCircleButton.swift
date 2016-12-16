//
//  FSCircleButton.swift
//  Essay
//
//  Created by Frank_s on 16/12/13.
//  Copyright © 2016年 Frank_s. All rights reserved.
//

import UIKit
import QuartzCore



class FSCircleButton: UIButton {


    /// 边界颜色
    var borderColor = UIColor.white {
        didSet {
            self.layoutSubviews()
        }
    }
 
    /// 触发tap 方法
    override var isHighlighted: Bool {
        willSet {
            if isHighlighted {
                self.layer.borderColor = self.borderColor.withAlphaComponent(1).cgColor
                self.triggerAnimateTap()
            }else {
                self.layer.borderColor = self.borderColor.withAlphaComponent(0.7).cgColor
            }
        }
    }
    
    /// 是否点击动画
    var animateTap = true
    /// 是否显示阴影
    var displayShading: Bool {
    
        willSet {
            self.setNeedsDisplayShading(displayShading: newValue)
        }
    }
    /// 边界宽度
    var borderSize: CGFloat = 3.0
    
    
    
    /// 高亮view
    private var highLightView: UIView! = {
    
        let v = UIView()
        v.alpha = 0
        v.backgroundColor = UIColor(white: 1, alpha: 0.5)
        return v
    }()
    /// 顶部渐变layer
    private var gradientLayerTop: CAGradientLayer = {
        
        let gt = CAGradientLayer()
        gt.colors = [UIColor.black.cgColor,UIColor.black.withAlphaComponent(0.01).cgColor]
        return gt
    }()
    /// 底部渐变layer
    private var gradientLayerBottom: CAGradientLayer = {
        
        let gb = CAGradientLayer()
        gb.colors = [UIColor.lightGray.withAlphaComponent(0.01).cgColor,UIColor.black.cgColor]
        return gb
    }()
    
    override init(frame: CGRect) {
        
        self.displayShading = false
        
        super.init(frame: frame)
        
        self.clipsToBounds = true
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.lineBreakMode = .byWordWrapping
        
        
        gradientLayerTop.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height/4)
        gradientLayerBottom.frame = CGRect(x: 0.0, y: frame.size.height * 3/4, width: frame.size.width, height: frame.size.height/4)
        
        highLightView.frame = frame
        self.addSubview(highLightView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 阴影
    
    private func setNeedsDisplayShading(displayShading: Bool) {
            
        if displayShading {
            self.layer.addSublayer(self.gradientLayerTop)
            self.layer.addSublayer(self.gradientLayerBottom)
        }else{
            self.gradientLayerTop.removeFromSuperlayer()
            self.gradientLayerBottom.removeFromSuperlayer()
        }
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.updateMaskToBounds(maskBounds: self.bounds)
        
    }
    ///  设置 图层遮罩
    ///
    /// * parameter maskBounds  :
    
    private func updateMaskToBounds(maskBounds: CGRect) {
    
        let maskLayer = CAShapeLayer()
        // 椭圆
        let maskPath = CGPath(ellipseIn: maskBounds, transform: nil)
        maskLayer.bounds = maskBounds
        maskLayer.path = maskPath
        maskLayer.fillColor = UIColor.black.cgColor
        let point = CGPoint(x: maskBounds.size.width/2, y: maskBounds.size.height/2)
        maskLayer.position = point
        // 图层遮罩
        self.layer.mask = maskLayer
        self.layer.cornerRadius = maskBounds.height / 2.0
        self.layer.borderColor = self.borderColor.withAlphaComponent(0.7).cgColor
        self.layer.borderWidth = self.borderSize
        
        self.highLightView.frame = self.bounds
        
    }
    
    /// 点击触发动画
    
    func triggerAnimateTap() {
        
        if !self.animateTap {
            
            return
        }
        
        self.highLightView.alpha = 1
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            
            self.highLightView.alpha = 0.0
            
        }, completion: nil)
        
        blink()
    }

    /// 设置 图片 动画
    ///
    /// * parameter image    : 图片
    /// * parameter animated : 是否开启动画
    
    func setImage(image: UIImage!, animated: Bool) {
        
        super.setImage(nil, for: .normal)
        super.setImage(image, for: .selected)
        super.setImage(image, for: .highlighted)
        
        if animated {
            
            let tmpImageView = UIImageView(frame: self.bounds)
            tmpImageView.image = image
            tmpImageView.alpha = 0
            tmpImageView.backgroundColor = UIColor.clear
            tmpImageView.contentMode = UIViewContentMode.scaleAspectFit
            self.addSubview(tmpImageView)
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
                
                tmpImageView.alpha = 1
                
            }, completion: { (finished) -> Void in
                self.setImage(image: image, tmpImageView: tmpImageView)
            })
        } else {
            super.setImage(image, for: .normal)
        }
    }
    
    
}

fileprivate extension FSCircleButton {
    
    /// 设置 图片 移除临时 image view
    ///
    /// * parameter image        : 图片
    /// * parameter tmpImageView : image view
    
    func setImage(image: UIImage, tmpImageView : UIImageView) {
        super.setImage(image, for: .normal)
        tmpImageView.removeFromSuperview()
    }
    
    /// shape layer 动画
    
    func blink() {
        
        let pathFrame = CGRect(x: -self.bounds.midX, y: -self.bounds.midY, width: self.bounds.width, height: self.bounds.height)
        let path = UIBezierPath(roundedRect: pathFrame, cornerRadius: self.layer.cornerRadius)
        let shapePosition = self.superview?.convert(self.center, from: self.superview)
        
        let circleShape = CAShapeLayer()
        circleShape.path = path.cgPath
        circleShape.position = shapePosition!
        circleShape.fillColor = UIColor.clear.cgColor
        circleShape.opacity = 0
        circleShape.strokeColor = self.borderColor.cgColor
        circleShape.lineWidth = 2.0
        self.superview?.layer.addSublayer(circleShape)
        // 动画 缩放
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        scaleAnimation.fromValue = NSValue(caTransform3D: CATransform3DMakeScale(2.0, 2.0, 1.0))
        // 动画 透明度
        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 1
        alphaAnimation.toValue = 0
        // 动画组合
        let animation = CAAnimationGroup()
        animation.animations = [scaleAnimation,alphaAnimation]
        animation.duration = 0.7
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        circleShape.add(animation, forKey: nil)
    }

    
}
