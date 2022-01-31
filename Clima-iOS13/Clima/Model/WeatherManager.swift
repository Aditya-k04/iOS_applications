//
//  WeatherManager.swift
//  Clima
//
//  Created by Aditya Khadke on 25/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager , weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6fbfbff5a30e598cf8715c99ee83d33b&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
    }
    func fetchWeather(latitude: CLLocationDegrees , longitute: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitute)"
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString : String ) {
        //        1.create a URL
        
        if  let url = URL(string: urlString) {
            
            //        2.create a URLSession
            let session = URLSession(configuration: .default)
            
            
            //        3.give the session a Task
            
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self ,weather: weather)
                        
                    }

                }
                
            }
            
            
            //        4.start the task
            task.resume()
            
        }
        
        
        
    }

    
    func parseJSON(weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, tempreture: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
                        return nil
            
        }
    }
    

    
    
    
}
