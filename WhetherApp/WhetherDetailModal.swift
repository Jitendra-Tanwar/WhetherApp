//
//  WhetherDetailModal.swift
//  WhetherApp
//
//  Created by jitendra on 30/04/22.
//

import UIKit

struct WhetherDetailModal {
    
    
    var cloudsAll: Int = 0
    var dt: Int64 = 0
    var dtText: String = ""
    
    var feelsLike = ""
    var groundLevel: Int = 0
    var humidity: Int = 0
    var pressure: Int = 0
    var seaLevel: Int = 0
    var temp: Double = 0
    var tempKf: Double = 0
    var tempMax: Double = 0
    var tempMin: Double = 0
    var pop: Int = 0
    var sysPop: String = ""

    var visibility: Int = 0

    var weatherDesc: String = ""
    var weatherIcon: String = ""
    var weatherId: Int32 = 0
    var weatherMain: String = ""

    
    var windDeg: Int = 0
    var windGust: Double = 0
    var windSpeed: Double = 0
    
    init() {}
    
    init(_ json: [String:Any]) {
        
        if let clouds = json["clouds"] as? [String:Any], let value = clouds["all"] as? Int {
            cloudsAll = value
        }
        
        if let value = json["dt"] as? Int64 {
            dt = value
        }
        if let value = json["dt_txt"] as? String {
            dtText = value
        }
        if let main = json["main"] as? [String:Any], let value = main["feels_like"] as? String {
            feelsLike = value
        }

        if let main = json["main"] as? [String:Any], let value = main["grnd_level"] as? Int {
            groundLevel = value
        }
        if let main = json["main"] as? [String:Any], let value = main["humidity"] as? Int {
            humidity = value
        }
        if let main = json["main"] as? [String:Any], let value = main["pressure"] as? Int {
            pressure = value
        }
        if let main = json["main"] as? [String:Any], let value = main["sea_level"] as? Int {
            seaLevel = value
        }
        if let main = json["main"] as? [String:Any], let value = main["temp"] as? Double {
            temp = value
        }
        if let main = json["main"] as? [String:Any], let value = main["temp_kf"] as? Double {
            tempKf = value
        }
        if let main = json["main"] as? [String:Any], let value = main["temp_max"] as? Double {
            tempMax = value
        }
        
        if let main = json["main"] as? [String:Any], let value = main["temp_min"] as? Double {
            tempMin = value
        }
        if let value = json["pop"] as? Int {
            pop = value
        }
        
        if let main = json["sys"] as? [String:Any], let value = main["pod"] as? String {
            sysPop = value
        }
        if let value = json["visibility"] as? Int {
            visibility = value
        }
        
        
        if let weather = json["weather"] as? NSArray{
            if weather.count > 0 {
                if let main = weather[0] as? [String:Any], let value = main["description"] as? String {
                    weatherDesc = value
                }
                if let main = weather[0] as? [String:Any], let value = main["icon"] as? String {
                    weatherIcon = value
                }
                if let main = weather[0] as? [String:Any], let value = main["id"] as? Int32 {
                    weatherId = value
                }
                if let main = weather[0] as? [String:Any], let value = main["main"] as? String {
                    weatherMain = value
                }
            }
        }
            
        
        
        if let main = json["wind"] as? [String:Any], let value = main["deg"] as? Int {
            windDeg = value
        }
        if let main = json["wind"] as? [String:Any], let value = main["gust"] as? Double {
            windGust = value
        }
        if let main = json["wind"] as? [String:Any], let value = main["speed"] as? Double {
            windSpeed = value
        }
    }

}
