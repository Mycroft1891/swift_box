import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "e72ca729af228beabd5d20e3b7749713"
    
    let locationManager = CLLocationManager()
    let weather = WeatherDataModel()
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    //MARK: - Networking
    
    func getWeatherData(url: String, parameters: [String:String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            
            if response.result.isSuccess {
                
                print("Success, got data")
                
                let weatherJSON : JSON = JSON(response.result.value!)
                self.updateWeatherData(json: weatherJSON)
                
            } else {
                
                print("Error: \(String(describing: response.result.error))")
                
                self.cityLabel.text = "Connection Issues"
            }
        }
    }
    
    
    //MARK: - JSON Parsing
    
    func updateWeatherData(json: JSON) {
        
        if let _ = json["main"]["temp"].int {
            
            weather.temperature     = json["main"]["temp"].intValue
            weather.city            = json["name"].stringValue
            weather.condition       = json["weather"][0]["id"].intValue
            weather.weatherIconName = weather.updateWeatherIcon(condition: weather.condition)
            updateUIWithWeatherData()
            
        } else {
            
            cityLabel.text = "Weather unavailable"
        }
    }
    
    
    //MARK: - UI Updates
    
    func updateUIWithWeatherData() {
        
        cityLabel.text          = weather.city
        temperatureLabel.text   = String(weather.temperature) + "°"
        weatherIcon.image       = UIImage(named: weather.weatherIconName)
    }
    
    
    //MARK: - Location Manager Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            print("longitude: \(location.coordinate.longitude), latidude: \(location.coordinate.latitude)")
            
            let longitude   = String(location.coordinate.longitude)
            let latidude    = String(location.coordinate.latitude)
            
            let params : [String : String] = [
                "lat" : latidude,
                "lon" : longitude,
                "APPID" : APP_ID,
                "units" : "metric"
            ]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print(error)
        
        cityLabel.text = "Unable to get Location"
    }
    
    
    //MARK: - Change City Delegate methods
    
    func userEnteredNewCityName(city: String) {
        let params : [String: String] = [
            "q" : city,
            "APPID" : APP_ID,
            "units" : "metric"
        ]
        getWeatherData(url: WEATHER_URL, parameters: params)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
        }
    }
    
}
