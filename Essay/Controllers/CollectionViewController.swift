//
//  CollectionViewController.swift
//  Essay
//
//  Created by Frank_s on 16/12/15.
//  Copyright © 2016年 Frank_s. All rights reserved.
//

import UIKit

// ps
// 

class CollectionViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    var collectionView: UICollectionView?
    /// 布局
    let layout: UICollectionViewFlowLayout = {
    
        let l = UICollectionViewFlowLayout()
        // 设置布局方向
        l.scrollDirection = .vertical
        // 设置每个item 的size
        l.itemSize = CGSize(width: 110.0, height: 150.0)
        return l
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.blue
        view.addSubview(self.collectionView!)
        
        collectionView?.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cID")
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cID", for: indexPath) as! CustomCollectionViewCell
        
        cell.name = "hehe"
    
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90.0, height: 130.0)
    }


}
