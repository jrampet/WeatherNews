//
//  Constants.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import Foundation
enum TemperatureUnit:String{
    case celsius = "°C"
    case Fahrenheit = "°F"
}

enum current{
    case temperature
    func unit()->String{
        return TemperatureUnit.celsius.rawValue
    }
}
struct APIURL{
    static let news = "https://newsapi.org/v2/top-headlines?apiKey=20471105730b410597624ffe369b55c6&country=in"
    static let search = "https://newsapi.org/v2/everything?apiKey=20471105730b410597624ffe369b55c6&q="
}


struct Available{
    static let categories = ["business","entertainment","general","health","science","sports","technology"]
}
struct Count{
    static let categories = 7
    static let countries = 54
}
enum country:String{
    case ArabEmirates = "ae"
    case Argentina = "ar"
    case Austria = "at"
    case Australia = "au"
    case Belgium = "be"
    case Bulgaria = "bg"
    case Brazil = "br"
    case Canada = "ca"
    case Switzerland = "ch"
    case China = "cn"
    case Colombia = "co"
    case Cuba = "cu"
    case Czechia = "cz"
    case Germany = "de"
    case Egypt = "eg"
    case France = "fr"
    case GreatBritain = "gb"
    case Greece = "gr"
    case HongKong = "hk"
    case Hungary = "hu"
    case Indonesia = "id"
    case Ireland = "ie"
    case Israel = "il"
    case India = "in"
    case Italy = "it"
    case Japan = "jp"
    case Korea = "kr"
    case Lithuania = "lt"
    case Latvia = "lv"
    case Morocco = "ma"
    case Mexico = "mx"
    case Malaysia = "my"
    case Nigeria = "ng"
    case Netherland = "nl"
    case Norway = "no"
    case Newzealand = "nz"
    case Philippines = "ph"
    case poland = "pl"
    case Portuagal = "pt"
    case Romania = "ro"
    case Serbia = "rs"
    case RussianFederation = "ru"
    case SaudiArabia = "sa"
    case Swedan = "se"
    case Singapore = "sg"
    case Slovenia = "si"
    case Slovakia = "sk"
    case Thailand = "th"
    case Turkey = "tr"
    case Taiwan  = "tw"
    case Ukraine = "ua"
    case UnitedStates = "us"
    case Venezuela = "ve"
    case SouthAfrica = "za"
}
enum url{
    case singleCity
    case cityAround
}

/*enum category:String{
    case Business = "business"
    case Entertainment = "entertainment"
    case General = "general"
    case Health = "health"
    case Science = "science"
    case Sports = "sports"
    case Technology = "technology"
}
 */
