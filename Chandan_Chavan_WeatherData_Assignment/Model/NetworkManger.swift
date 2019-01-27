//
//  NetworkManger.swift
//  Chandan_Chavan_WeatherData_Assignment
//
//  Created by Rushikesh Nikam on 25/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import Foundation
enum Result<String> {
    case Success
    case Failure(String)
}
class NetworkManger: NSObject {
    var queue = OperationQueue()
     let url = "https://s3.eu-west-2.amazonaws.com/interview-question-data/metoffice/"
    static let sharedInstance = NetworkManger()
    override init() {}
     
    func getWeatherDataFromServer(metrics:String,location:String ,completion:@escaping(_ response:NSDictionary?,_ error :Error? )->Void) -> Void {
        
        let config = URLSessionConfiguration.default
     DispatchQueue.global(qos: .background).async {
          print("In background with ")
          let url = URL(string: "\(self.url)\(metrics)-\(location).json")
          let session = URLSession(configuration: config)
          let request = URLRequest(url: url!)
          let task = session.dataTask(with: request) { (data, response, error) in
               
               if error != nil{
                    completion(nil,error)
               }
               if let response = response as? HTTPURLResponse
               {
                    let result = self.handleNetworkResponse(response: response)
                    switch result
                    {
                    case .Success :
                         guard let responseData = data else {
                              completion(nil,error)
                              return
                         }
                         do
                         {
                              print("ResponseData: \(responseData)")
                              let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                              completion(jsonData as? NSDictionary,nil)
                              if let data = jsonData as? [String:Any]
                              {
                                   completion(data as NSDictionary,nil)
                              }
                              
                         }
                         catch
                         {
                              print("Error : \(error)")
                              completion(nil,error)
                         }
                    case .Failure(_):
                         completion(nil ,error)
                    }
               }
               
          }
          task.resume()
     }
     
    }
 
    func handleNetworkResponse(response:HTTPURLResponse) -> Result<String> {
        print("Rsponse status code \(response.statusCode)")
        switch response.statusCode {
        case 200...299:
            return .Success
        case 400...600 : return .Failure("Please Check Your Network")
        default: return .Failure("Please Check Your Network")
        }
        
    }
}
