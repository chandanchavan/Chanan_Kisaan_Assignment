//
//  WeatherData.swift
//  Chandan_Chavan_WeatherData_Assignment
//
//  Created by Rushikesh Nikam on 27/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class WeatherData:Object{
    @objc dynamic var rainfall:Rainfall?
    @objc dynamic var tMax:Tmax?
    @objc dynamic var tMin:Tmin?
    @objc dynamic var id = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(rainfall:Rainfall,tMax:Tmax,tMin:Tmin) {
        self.init()
        self.rainfall = rainfall
        self.tMin = tMin
        self.tMax = tMax
    }
    class func saveAll(_ weatherDataArray: [WeatherData]) {
        let realm = try! Realm()
        do{
            try realm.write {
                realm.add(weatherDataArray)
            }
        }catch{
            print("Failed to save data...")
        }
    }
    class func getAll() -> [WeatherData] {
        let realm = try! Realm()
        let allData = realm.objects(WeatherData.self)
        return Array(allData)
    }
    
}
class Tmax:Object{
    @objc dynamic var value:Float = 0
    @objc dynamic var year:Int = 0
    @objc dynamic var month:Int = 0
    
    convenience init(json:JSON) {
        self.init()
        if json["value"].exists(){
            value = json["value"].floatValue
        }
        if json["year"].exists(){
            year = json["year"].intValue
        }
        if json["month"].exists(){
            month = json["month"].intValue
        }
    }
}
class Tmin :Object{
    @objc dynamic var value:Float = 0
    @objc dynamic var year:Int = 0
    @objc dynamic var month:Int = 0
    
    convenience init(json:JSON) {
        self.init()
        if json["value"].exists(){
            value = json["value"].floatValue
        }
        if json["year"].exists(){
            year = json["year"].intValue
        }
        if json["month"].exists(){
            month = json["month"].intValue
        }
    }
}
class Rainfall:Object{
    @objc dynamic var value:Float = 0
    @objc dynamic var year:Int = 0
    @objc dynamic var month:Int = 0
    
    convenience init(json:JSON) {
        self.init()
        if json["value"].exists(){
            value = json["value"].floatValue
        }
        if json["year"].exists(){
            year = json["year"].intValue
        }
        if json["month"].exists(){
            month = json["month"].intValue
        }
    }
}


