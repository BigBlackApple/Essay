//
//  ViewController.swift
//  Essay
//
//  Created by Frank_s on 16/12/9.
//  Copyright © 2016年 Frank_s. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let g = GradientLayer(frame: view.bounds)
//        view.addSubview(g)
//        
//        let s = ShapeLayer(frame: view.bounds)
//        view.addSubview(s)
        
        
//        let b = FSCircleButton(frame: view.bounds)
//        
//        b.animateTap = true
//        b.borderColor = UIColor.green
//        b.displayShading = true
//        b.isHighlighted = true
//        
//        view.addSubview(b)
//        
        //self.view.backgroundColor = UIColor(red: 1, green: 0.176, blue: 0.333, alpha: 1)
        self.view.backgroundColor = UIColor.black
        let button1 = FSCircleButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        button1.center = CGPoint(x: 160, y: 200)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        
        button1.setTitleColor(UIColor(white: 1, alpha: 1.0), for: UIControlState())
        button1.setTitleColor(UIColor(white: 1, alpha: 1.0), for: UIControlState.selected)
        button1.setTitleColor(UIColor(white: 1, alpha: 1.0), for: UIControlState.highlighted)
        
        
        button1.setTitle("Start", for: UIControlState())
        button1.setTitle("Start", for: UIControlState.selected)
        button1.setTitle("Start", for: UIControlState.highlighted)
        
        button1.borderColor = UIColor.red
        
        self.view.addSubview(button1)
        
        
    }



    @IBAction func push(_ sender: Any) {
        
        let v = CollectionViewController()
            //RefreshTableViewController()
        
        self.show(v, sender: nil)
    }
}

