// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fiveDaysWeatherData = try? newJSONDecoder().decode(FiveDaysWeatherData.self, from: jsonData)

import Foundation


// MARK: - FiveDaysWeatherData
struct FiveDaysWeatherData: Codable {
    let list: [List]
}
// MARK: - List
struct List: Codable {
    let date: String
    let main: MainClass
    let weather: [Weather2]
    enum CodingKeys: String, CodingKey{
        case date = "dt_txt"
        case main
        case weather
    }
}
// MARK: - Main
struct MainClass: Codable {
    let temp: Double
}
// MARK: - Weather
struct Weather2: Codable {
    let main: String
}
