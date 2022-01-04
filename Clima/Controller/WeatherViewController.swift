//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//UI TextField Delegate allows the management of editing and validation of text in a text field object
class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self //set the delegate as current class... textfield should report the user actions back to the ViewController
        weatherManager.delegate = self
    }

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
    
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.temparature)
    }
    
}

