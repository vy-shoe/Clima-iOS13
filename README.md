#  Clima

## Project Goal

Using Application Programming Interfaces (APIs) to grab live data from a Weather API online

The weather app has an elegant UI that is dark-mode enabled. It can check the weather for the current location based on the GPS data from the iPhone as well as by searching for a city manually. 

## What I've applied

* Dark-mode enabled app.
* Vector images as image assets.
* The UITextField to get user input. 
* The delegate pattern.
* Swift protocols and extensions. 
* Swift guard keyword. 
* Swift computed properties.
* Swift closures and completion handlers.
* URLSession to network and make HTTP requests.
* JSON Parsing with the native Encodable and Decodable protocols. 
* Grand Central Dispatch to fetch the main thread.
* Core Location to get the current location from the phone GPS. 

### Condition Codes
```
switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
```

>This is a companion project to The App Brewery's Complete App Development Bootcamp. (https://www.appbrewery.co/)

![App Brewery Banner](Documentation/AppBreweryBanner.png)
