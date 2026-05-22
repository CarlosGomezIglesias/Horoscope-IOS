//
//  Horoscope.swift
//  Horoscope-IOS
//
//  Created by Tardes on 22/5/26.
//

import UIKit

struct Horoscope {
    let id: String
    let name: String
    let dates: String
    
    func getImage()->UIImage{
        /*let image = UIImage(named: "horoscope-icons/\(id)-icon")
        if (image != nil) {
            return image!
        } else {
            print("Falta la imagen del horoscopo con id: \(id)")
            return UIImage(systemName: "photo.artframe")!
        }*/
        
        return UIImage(named: "horoscope-icons/\(id)-icon")!
    }
    
    static private let list: [Horoscope] = [
        Horoscope(id: "aries", name: "Aries", dates: "10/03 - 19/04"),
        Horoscope(id: "taurus", name: "Tauro", dates: "20/04 - 20/05"),
        Horoscope(id: "gemini", name: "Géminis", dates: "21/05 - 20/06"),
        Horoscope(id: "cancer", name: "Cáncer", dates: "21/06 - 22/07"),
        Horoscope(id: "leo", name: "Leo", dates: "23/07 - 22/08"),
        Horoscope(id: "virgo", name: "Virgo", dates: "23/08 - 22/09"),
        Horoscope(id: "libra", name: "Libra", dates: "23/09 - 22/10"),
        Horoscope(id: "scorpio", name: "Escorpio", dates: "23/10 - 21/11"),
        Horoscope(id: "sagittarius", name: "Sagitario", dates: "22/11 - 21/12"),
        Horoscope(id: "capricorn", name: "Capricornio", dates: "22/12 - 19/01"),
        Horoscope(id: "aquarius", name: "Acuario", dates: "20/01 - 18/02"),
        Horoscope(id: "pisces", name: "Piscis", dates: "19/02 - 20/03"),
    ]
    static func getAll() -> [Horoscope] {
        return list
    }
}
