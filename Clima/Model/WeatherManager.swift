//
//  WeatherManager.swift
//  Clima
//
//  Created by Vaishu Adi on 1/3/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=02a56a025404e58b5ff57e3b1e8f6e58&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        //1. Create a URL (optional)
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            //Completion handler is if the task is taking too long, function for what to do
            // when the sessioin finishes its tasks, it will trigger the completionHandler
//            let task = session.dataTask(with: url, completionHandler:  handle(data: response: error: ))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return //exit out of ifunction, dont continue bc it failed
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            let weather = WeatherModel(conditionID: id, cityName: name, temparature: temp)
            print (weather)
        } catch {
            print(error)
        }
        
    }

    
//    func handle(data: Data?, response: URLResponse?, error: Error?) {
//        if error != nil {
//            print(error!)
//            return //exit out of function, dont continue bc it failed
//        }
//        if let safeData = data {
//            //convert data into string
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString)
//        }
//    }
}
