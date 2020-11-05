//
//  WeatherApi.swift
//  TableViewSwiftUI
//
//  Created by Admin on 04.11.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherApi : ObservableObject {
   // var informationType : String = "current"
    @Published var datas = [dataMassive]()
    
    @Published var cityNameAr : Array<String> = []
    @Published var cityTempAr : Array<String> = []
    
    var arrayTest = ["text"]
    
    func parserSS(currCity: String) {
       // let cityTemp : String = currCity
        
        let urlS : String = "http://api.weatherapi.com/v1/current.json?key=02c112edbe3d4c7b85e184519200411&q=\(currCity)"
        
        AF.request(urlS, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(/*let value */ _):
                
                let json = try! JSON(data: response.data!)
                
                self.cityNameAr.append(json["location"]["name"].stringValue)
                self.cityTempAr.append(json["current"]["temp_c"].stringValue)
     
                for i in json {
                   // print(i.1)
                    //self.cityNameAr.append(i.1["name"].stringValue)
                    //self.cityTempAr.append(i.1["temp_c"].stringValue)
                    
                    //self.datas.append(dataMassive(id: i.1["tz_id"].stringValue, name: i.1["name"].stringValue, temp: i.1["temp_c"].stringValue))
                  //  self.arrayTest.append(i.1["name"].stringValue)
                   // print(self.arrayTest[1])
                    
                }
             //   print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    
}

struct dataMassive : Identifiable {
    var id : String
    var name : String
    var temp : String
}

