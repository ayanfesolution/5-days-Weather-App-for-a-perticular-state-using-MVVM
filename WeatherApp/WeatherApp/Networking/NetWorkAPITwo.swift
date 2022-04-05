//
//  NetWorkAPITwo.swift
//  WeatherApp
//
//  Created by Decagon on 04/04/2022.
//

import Foundation

struct WeatherApiTwo {
    // Shared Instance
    static let sharedInstance = WeatherApiTwo()
    
    func dataParser(completion: @escaping (Result<FiveDaysWeatherData, UserError>) -> Void) {
        let session = URLSession.shared
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(Cities.location)&appid=\(API.key)&units=\(Units.celcius)"
        
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
                let fiveDaysForecast = try? decoder.decode(FiveDaysWeatherData.self, from: data)
                completion(.success(fiveDaysForecast!))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        task.resume()
    }
    

//    func fetchData(completionHandler:@escaping ([FiveDaysWeatherData]) -> Void) {
//
//        guard let url =  URL(string:"api.openweathermap.org/data/2.5/forecast?q=Osun&appid=\(API.key)") else {
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
//        let fiveDaysWeatherData = try? decoder.decode([FiveDaysWeatherData].self, from: data)
//            completionHandler(fiveDaysWeatherData!)
//            print(fiveDaysWeatherData)
//
//    })
//    dataTask.resume()
//
//
//
//}

    private init() {}
}
