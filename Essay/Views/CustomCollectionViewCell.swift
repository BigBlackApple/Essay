//
//  CustomCollectionViewCell.swift
//  Essay
//
//  Created by Frank_s on 16/12/15.
//  Copyright © 2016年 Frank_s. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var name: String = "" {
    
        willSet {
        
            label.text = newValue
        }
    }
    
    var imageName: String = "" {
    
        willSet {
        
            imageView.image = UIImage(named: newValue)
        }
    }
    
    
    
    let imageView = UIImageView()
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.frame = CGRect(x: 10.0, y: 0.0, width: 70.0, height: 70.0)
        imageView.backgroundColor = UIColor.red
        self.addSubview(imageView)
        
        label.frame = CGRect(x: 10.0, y: 80.0, width: 70.0, height: 30.0)
        label.textAlignment = .center
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
