//  WeatherApp
//
//  Created by Decagon on 03/04/2022.
//

import UIKit

class WeatherPageViewController: UIViewController {
    
    @IBOutlet weak var upperPartCurrent: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var currentWeatherMin: UILabel!
    @IBOutlet weak var currentWeatherLower: UILabel!
    @IBOutlet weak var currentWeatherMax: UILabel!
    @IBOutlet weak var dayOne: UILabel!
    @IBOutlet weak var dayTwo: UILabel!
    @IBOutlet weak var dayThree: UILabel!
    @IBOutlet weak var dayFour: UILabel!
    @IBOutlet weak var dayFive: UILabel!
    @IBOutlet weak var dayOneWeather: UILabel!
    @IBOutlet weak var dayTwoWeather: UILabel!
    @IBOutlet weak var dayThreeWeather: UILabel!
    @IBOutlet weak var dayFourWeather: UILabel!
    @IBOutlet weak var dayFiveWeather: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet var dayOneWeatherIcon: UIImageView!
    @IBOutlet var dayTwoWeatherIcon: UIImageView!
    @IBOutlet var dayThreeWeatherIcon: UIImageView!
    @IBOutlet var dayFourWeatherIcon: UIImageView!
    @IBOutlet var dayFiveWeatherIcon: UIImageView!
    
    var viewModel = WeatherPageViewModel()
    var details : CurrentDayWeatherData?
    var fiveDays : FiveDaysWeatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchCurrentDayData()
        viewModel.fetchFiveDayData()
    }
}




