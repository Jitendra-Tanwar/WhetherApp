//
//  ApiCalls.swift
//  WhetherApp
//
//  Created by jitendra on 30/04/22.
//

import Foundation

class ApiCalls {
    
    static var shared = ApiCalls()
    
    private init() {
        
    }
    
    func getWeatherData(complition: @escaping ([WhetherDetailModal]) -> ()) {
        
        let request = URLRequest(url: URL(string: "https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=470c8555338be15ea713889016b3b4c0")!)
        
        URLSession.shared.dataTask(with: request) { data, response, apiError in
            if apiError == nil {
                
                do {
                    let dataFormatted = try JSONSerialization.jsonObject(with: data!)
                    if let jsonFormatted = dataFormatted as? [String:Any], let listData = jsonFormatted["list"] as? NSArray {
                        var arrList = [WhetherDetailModal]()
                        listData.forEach({arrList.append(WhetherDetailModal($0 as? [String:Any] ?? [:]))})
                        complition(arrList)
                    }
                    print(dataFormatted)
                }
                catch {
                    complition([])
                    print(error.localizedDescription)
                }
            }
            else {
                complition([])
                print(apiError!.localizedDescription)
            }
        }.resume()
        
    }
    
}
