//
//  ViewController.swift
//  Chandan_Chavan_WeatherData_Assignment
//
//  Created by Rushikesh Nikam on 25/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let arrOfContry = ["UK", "England", "Scotland", "Wales"]
        let matrix = ["Tmax","Tmin","Rainfall"]
        for country in arrOfContry
        {
            for metrix in matrix
            {
                NetworkManger.sharedInstance.getWeatherDataFromServer(metrics: metrix, location: country) { (response, error) in
                    if error != nil {
                        self.showErrorPopup(msg: error?.localizedDescription ?? "Please Try Again")
                        return
                    } else if let dictionaryData = response {
                       
                     print(dictionaryData)
                    } else {
                        self.showErrorPopup(msg: error?.localizedDescription ?? "Something went wrong. Please Try Again")
                        return
                    }
                }
            }
        }
        
}
    func showErrorPopup(msg : String) -> Void {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    /*   func  startDownloadWeatherData(country:String) -> Void {
     queue = OperationQueue()
     
     
     let operationMax = BlockOperation {
     self.getWeatherDataFromServer(metrics: "Tmax", location: country, completion: { (respose, error) in
     print("ResponseDataTmax: \(respose) for country \(country)")
     })
     }
     
     operationMax.completionBlock = {print("Operation max completed")}
     queue.addOperation(operationMax)
     
     let operationMin = BlockOperation {
     
     self.getWeatherDataFromServer(metrics: "Tmin", location: country, completion: { (respose, error) in
     print("ResponseDataTmin: \(respose)for country \(country)")
     })
     }
     operationMin.addDependency(operationMax)
     operationMin.completionBlock = {print("Operation min completed")}
     queue.addOperation(operationMin)
     
     let operationRainfall = BlockOperation {
     
     self.getWeatherDataFromServer(metrics: "Rainfall", location: country, completion: { (respose, error) in
     print("ResponseDataRainfall: \(respose)for country \(country)")
     })
     }
     operationRainfall.addDependency(operationMin)
     operationRainfall.completionBlock = {print("Operation Rainfall completed")}
     queue.addOperation(operationRainfall)
     
     
     }*/
}

