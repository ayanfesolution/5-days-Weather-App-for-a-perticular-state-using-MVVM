//
//  WeatherPageViewModel.swift
//  WeatherApp
//
//  Created by Decagon on 05/04/2022.
//

import Foundation

protocol DataDelegate {
    func fetchCurrentDayData(_ data: CurrentDayWeatherData)
    func fetchFiveDayData(_ data: FiveDaysWeatherData)
}


class WeatherPageViewModel {
    
    var delegate: DataDelegate?
    var currentDay: CurrentDayWeatherData?
    let apiOne : WeatherApiOne = WeatherApiOne.sharedInstance
    let apiTwo : WeatherApiTwo = WeatherApiTwo.sharedInstance
    var fiveDaysData: FiveDaysWeatherData?
    
    func fetchCurrentDayData() {
        apiOne.dataParser{ [weak self] result in
            switch result{
            case .success(let results):
                DispatchQueue.main.async {
                    self?.delegate?.fetchCurrentDayData(results)
                }
            case .failure(let errors):
                print(errors)
            }
        }
    }
    func fetchFiveDayData() {
        apiTwo.dataParser{ [weak self] result in
            switch result {
            case .success(let fiveDaysWeather):
                DispatchQueue.main.async {
                    self?.delegate?.fetchFiveDayData(fiveDaysWeather)
                }
            case .failure(let errors):
                print(errors)
            }
        }
    }
}
