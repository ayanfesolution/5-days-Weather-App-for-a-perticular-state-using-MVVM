//
//  common.swift
//  WeatherApp
//
//  Created by Decagon on 05/04/2022.
//

import Foundation


struct API {
    static let key = "9365f221ba960bfa051d48840b5562be"
}

struct Cities {
    static let location = "osun"
}

struct Units {
    static let celcius = "metric"
}

public func covertDate(_ date: String?) -> String {
    var fixDate = ""
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    if let originalDate = date {
        if let newDate = dateFormatter.date(from: originalDate) {
            dateFormatter.dateFormat = "EEEE"
            fixDate = dateFormatter.string(from: newDate)
        }
    }
    return fixDate
}


