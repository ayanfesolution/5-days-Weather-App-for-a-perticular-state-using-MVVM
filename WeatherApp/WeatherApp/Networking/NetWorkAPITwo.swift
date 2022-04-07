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
    
    private init() {}
}
