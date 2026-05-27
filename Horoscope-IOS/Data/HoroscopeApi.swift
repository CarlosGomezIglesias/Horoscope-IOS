//
//  HoroscopeApi.swift
//  Horoscope-IOS
//
//  Created by Tardes on 27/5/26.
//

import Foundation

class HoroscopeApi {
    
    static func getPrediction (forSign sign: String, withPeriod period:String) async->String{
        
        guard let url = URL(string: "https://freehoroscopeapi.com/api/v1/get-horoscope/\(period)?sign=\(sign)") else {
            print("Invalid URL")
            return "Unexpected error"
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            let dataObject = jsonObject["data"]! as! [String: String]
            return dataObject["horoscope"]!
            
            /*if let str = String(data: data, encoding: .utf8) {
                print("Successfully decoded: \(str)")
            }*/
            //let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as! [String: [String: String]]
            //return jsonObject["data"]!["horoscope"]!
        }catch{
            print("Invalid data")
            return "There is an error fetching horoscope"
        }
        
    }
}

