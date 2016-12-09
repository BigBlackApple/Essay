//
//  NetWorkManager.swift
//  Essay
//
//  Created by Frank_s on 16/12/9.
//  Copyright © 2016年 Frank_s. All rights reserved.
//

import Foundation

class FSNetWorkManager {
    
    func postRequest() {
        
        let url = URL(string: "https://apis.baidu.com/heweather/weather/free?city=beijing")
        let sessionConfig = URLSessionConfiguration.ephemeral
        sessionConfig.timeoutIntervalForRequest = 30.0
        
        var request = URLRequest(url: url!)
        request.addValue("b09c47373b40736d7ff472a6ba097d2f", forHTTPHeaderField: "apikey")
        
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: OperationQueue.main)
        let _ = session.dataTask(with: request, completionHandler: { (data,_,_) in
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
            print(json! ?? "nil")
        
        }).resume()
    
    
    }
    // request study
    func  request() {
        
        
        
    }
    
}
