//
//  Extension + ViewController.swift
//  WeatherApp
//
//  Created by Decagon on 07/04/2022.
//

import Foundation
import UIKit


extension WeatherPageViewController: DataDelegate {
    
    
    func fetchFiveDayData(_ data: FiveDaysWeatherData) {
        self.fiveDays = data
        print(self.fiveDays)
        self.dayOne.text = covertDate(fiveDays?.list[0].date)
        self.dayTwo.text = covertDate(fiveDays?.list[9].date)
        self.dayThree.text = covertDate(fiveDays?.list[17].date)
        self.dayFour.text = covertDate(fiveDays?.list[25].date)
        self.dayFive.text = covertDate(fiveDays?.list[33].date)
        self.dayOneWeather.text = "\(Int((fiveDays?.list[4].main.temp)!))˚"
        self.dayTwoWeather.text = "\(Int((fiveDays?.list[12].main.temp)!))˚"
        self.dayThreeWeather.text = "\(Int((fiveDays?.list[20].main.temp)!))˚"
        self.dayFourWeather.text = "\(Int((fiveDays?.list[28].main.temp)!))˚"
        self.dayFiveWeather.text = "\(Int((fiveDays?.list[36].main.temp)!))˚"
    }
    func fetchCurrentDayData(_ data: CurrentDayWeatherData) {
        self.details = data
        print(self.details)
        self.upperPartCurrent.text = "\(Int(details!.main.temp))˚"
        self.currentWeatherLower.text = "\(Int(details!.main.temp))˚"
        self.currentWeatherMin.text = "\(Int(details!.main.tempMin))˚"
        self.currentWeatherMax.text = "\(Int(details!.main.tempMax))˚"
        switch  details!.weather[0].main {
        case "Clouds":
            self.currentWeatherLabel.text = "CLOUDY"
            self.currentWeatherImage.image = UIImage(named: "sea_cloudy")
            self.dayOneWeatherIcon.image = UIImage(named: "partlysunny")
            self.dayTwoWeatherIcon.image = UIImage(named: "partlysunny")
            self.dayThreeWeatherIcon.image = UIImage(named: "partlysunny")
            self.dayFourWeatherIcon.image = UIImage(named: "partlysunny")
            self.dayFiveWeatherIcon.image = UIImage(named: "partlysunny")
            self.view.backgroundColor = #colorLiteral(red: 0.3725490196, green: 0.5176470588, blue: 0.5921568627, alpha: 1)
            self.lowerView.backgroundColor = #colorLiteral(red: 0.3836271763, green: 0.5209360719, blue: 0.5797471404, alpha: 1)
        case "Rain":
            self.currentWeatherLabel.text = "RAINY"
            self.currentWeatherImage.image = UIImage(named: "sea_rainy")
            self.dayOneWeatherIcon.image = UIImage(named: "rain")
            self.dayTwoWeatherIcon.image = UIImage(named: "rain")
            self.dayThreeWeatherIcon.image = UIImage(named: "rain")
            self.dayFourWeatherIcon.image = UIImage(named: "rain")
            self.dayFiveWeatherIcon.image = UIImage(named: "rain")
            self.view.backgroundColor = #colorLiteral(red: 0.45107162, green: 0.4469693899, blue: 0.4510948062, alpha: 1)
            self.lowerView.backgroundColor = #colorLiteral(red: 0.45107162, green: 0.4469693899, blue: 0.4510948062, alpha: 1)
            
        case "Clear":
            self.currentWeatherLabel.text = "SUNNY"
            self.currentWeatherImage.image = UIImage(named: "sea_sunnypng")
            self.dayOneWeatherIcon.image = UIImage(named: "clear")
            self.dayTwoWeatherIcon.image = UIImage(named: "clear")
            self.dayThreeWeatherIcon.image = UIImage(named: "clear")
            self.dayFourWeatherIcon.image = UIImage(named: "clear")
            self.dayFiveWeatherIcon.image = UIImage(named: "clear")
            self.view.backgroundColor = #colorLiteral(red: 0.9467127919, green: 0.730097115, blue: 0.07246615738, alpha: 1)
            self.lowerView.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.5725490196, blue: 0.8745098039, alpha: 1)
        default:
            return
        }
    }
}
