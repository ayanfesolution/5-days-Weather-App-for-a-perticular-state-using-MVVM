//  WeatherApp
//
//  Created by Decagon on 03/04/2022.
//

import UIKit

class WeatherPageViewController: UIViewController {

    var currentDay: CurrentDayWeatherData?
    let apiOne : WeatherApiOne = WeatherApiOne.sharedInstance
    let apiTwo : WeatherApiTwo = WeatherApiTwo.sharedInstance
    var fiveDaysData: FiveDaysWeatherData?

    func fetchCurrentDayData() {
        apiOne.dataParser{ [weak self] result in
            switch result{
               case .success(let results):
                self?.currentDay = results
                print(self?.currentDay!)
            case .failure(let errors):
                print(errors)
            }
        }
    }
    func fetchFiveDayData() {
        apiTwo.dataParser{ [weak self] result in
            switch result {
            case .success(let fiveDaysWeather):
                self?.fiveDaysData = fiveDaysWeather
                print(self?.fiveDaysData)
            case .failure(let errors):
                print(errors)
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCurrentDayData()
        fetchFiveDayData()
//        print(currentDay)
  }


}

