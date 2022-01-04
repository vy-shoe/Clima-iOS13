//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

//UI TextField Delegate allows the management of editing and validation of text in a text field object
class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager() //responsible for getting current GPS location of the phone
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        searchTextField.delegate = self //set the delegate as current class... textfield should report the user actions back to the ViewController
        weatherManager.delegate = self
        
    }
    
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) //tell searchfield that editing is done and keyboard is dismissed
    }
    
    // User pressed "Return/Go"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) //tell searchfield that editing is done and keyboard is dismissed
        return true
    }
    
    //If user clicks go or search, validation on text will occur
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" { //allow textfield to end editing
            return true
        } else {
            textField.placeholder = "Type Something" //remind user to type in search bar
            return false
        }
    }
    
    //View Controller can empty textfield once user has returned/ended editing, prevents repetition
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Use textfield to get the weather for that city and save before clearing
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = "" //removes the text once searched
    }
}


//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            self.descriptionLabel.text = weather.description
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
