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
        // Do any additional setup after loading the view, typically from a nib.
        
        // FSNetWorkManager().postRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func push(_ sender: Any) {
        
        let v = RefreshTableViewController()
        
        self.show(v, sender: nil)
    }
}

