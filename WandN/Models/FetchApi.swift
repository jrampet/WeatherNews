//
//  FetchApi.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import Foundation

class FetchApi{
    
    func request(url:String,completion: @escaping (_ data: Data)->()){

         URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data,response,error in
            if let data = data, error == nil{
                completion(data)
            }else{
                print("Error in api")
            }
           
            
        }).resume()
       
    }
    
    
}
/*
 func request(url:String)->Data?{
     var returnData : Data?
     let semaphore = DispatchSemaphore(value: 0)
      URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data,response,error in
         if let data = data, error == nil{
             returnData = data
             semaphore.signal()
         }
        
         
     }).resume()
     semaphore.wait()
     return returnData
 }
 */

/*
 func request(url:String,completion: @escaping (_ data: Data)->()){

      URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data,response,error in
         if let data = data, error == nil{
             completion(data)
         }else{
             print("Error in api")
         }
        
         
     }).resume()
    
 }

 */
