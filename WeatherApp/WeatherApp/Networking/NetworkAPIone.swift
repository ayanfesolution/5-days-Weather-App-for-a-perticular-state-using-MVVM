//
//  NetworkAPIone.swift
//  WeatherApp
//
//  Created by Decagon on 03/04/2022.
//

import Foundation

enum UserError: Error {
    case dataNotAvailable
    case noNetWorkAccess
    case inValidURL
    case cannotProcessData
    case invalidResponse
}


struct WeatherApiOne {
    // Shared Instance
    static let sharedInstance = WeatherApiOne()
    
    func dataParser(completion: @escaping (Result<CurrentDayWeatherData, UserError>) -> Void) {
        let session = URLSession.shared
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(Cities.location)&appid=\(API.key)&units=\(Units.celcius)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.inValidURL))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.cannotProcessData))
                return
            }
            guard response is HTTPURLResponse else{
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.dataNotAvailable))
                return
            }
            let decoder = JSONDecoder()
            do {
                let currentDay = try? decoder.decode(CurrentDayWeatherData.self, from: data)
                completion(.success(currentDay!))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        task.resume()
    }
    
    
//func fetchData(completionHandler:@escaping (CurrentDayWeatherData?) -> Void) {
//
//    guard let url =  URL(string:"https://api.openweathermap.org/data/2.5/weather?q=Osun&appid=9365f221ba960bfa051d48840b5562be") else {
//      return
//    }
//
//    let session = URLSession.shared
//    let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
//        if (error != nil) {
//            print(error!)
//        } else {
//            let httpResponse = response as? HTTPURLResponse
//            print(httpResponse!)
//        }
//        guard let data = data else {
//            print("No Network Access")
//            return
//        }
//
//        let decoder = JSONDecoder()
//        let currentDay = try? decoder.decode(CurrentDayWeatherData.self, from: data)
//        completionHandler(currentDay!)
//        print(currentDay!)
//    })
//    dataTask.resume()
//
//
//
//}

    private init() {}
}
