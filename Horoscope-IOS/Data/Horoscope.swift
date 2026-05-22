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
        Horoscope(id: "aries", name: "Aries", dates: "21 de marzo al 19 de abril"),
        Horoscope(id: "taurus", name: "Tauro", dates: "20 de abril al 20 de mayo"),
        Horoscope(id: "gemini", name: "Géminis", dates: "21 de mayo al 20 de junio"),
        Horoscope(id: "cancer", name: "Cáncer", dates: "21 de junio al 22 de julio"),
        Horoscope(id: "leo", name: "Leo", dates: "23 de julio al 22 de agosto"),
        Horoscope(id: "virgo", name: "Virgo", dates: "23 de agosto al 22 de septiembre"),
        Horoscope(id: "libra", name: "Libra", dates: "23 de septiembre al 22 de octubre"),
        Horoscope(id: "scorpio", name: "Escorpio", dates: "23 de octubre al 21 de noviembre"),
        Horoscope(id: "sagittarius", name: "Sagitario", dates: "22 de noviembre al 21 de diciembre"),
        Horoscope(id: "capricorn", name: "Capricornio", dates: "22 de diciembre al 19 de enero"),
        Horoscope(id: "aquarius", name: "Acuario", dates: "20 de enero al 18 de febrero"),
        Horoscope(id: "pisces", name: "Piscis", dates: "19 de febrero al 20 de marzo"),
    ]
    static func getAll() -> [Horoscope] {
        return list
    }
}
