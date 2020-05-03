# WeatherMe

This file explains the WeatherMe app and how it works

<img src="WeatherMe/GitHub%20Demo%20Images/temp.GIF" width="400">

## As  per the instructions for the Task. The app has following key qualities
* Simple App - uses Open Weather Map API
* **Current Tempreature** page fetches and displays current temprature at  users  current location
* **5 Day Tempratures** page fetches and displays 5 day forecast for users current location (3 hourly forecasts)
* User can access the *Forecast Page* from the *Current Temprature Page*. 
* Both pages are in  Top Level tabs, and  uses the navigation pattern.


## Additionally
* uses Auto Layout - Adaptable to screen sizes on iPhone 11 to iPhone SE in Portrait mode
* uses proper threading - fetching Weather data in background, dealing with UI on main
* displays good architecture around parsing the API response into model objects to populate UI - using MVVM - unit testable with happy path and edge and corner cases.
* uses modern Swift Practices - Diffable Data and empty data screen for example
* use story board or nib
* use third party libraries
* use forced unwrap or implicit unrapped optionals

### Expected Behaviour
* Firest time App  Launch askes the user for allowing location permission **(Screen G)**
* On Launch the user sees Current Weather **(Screen A)**
* User can choose to tap the Tab Bar *More*, or Button *Weather Forecast* to see the forecast List
* On The forecast screen List of forecast weather is displayed **(Screen B)**
* While the data is being fetched, *spinner* blocks the screen **(Screen C)**
* when the data is acquired, the list shows Temprature in F, per **3 hours** in span of **5 days** per album per cell
* If No Forecast data are present, then a screen displays a message letting user know abou the same **(Screen D)**
* In case some error prevents normal behaviour, a custom alert lets the user know with a friendly message **(Screen E)**
* In case the user denies permission for location current cuntents of screen show a friendly message **(Screens F,G)**

## Key Features
* Reusable **custom components** - label, image, view, button, alert
* **MVVM** - seperating Model from views using View Model
* Continous Integration (**CI**) Unsing Git support in XCode and GitHub for remote
* Album Detail on Navigation Stack, opens as a card with more details
* **Unit Testing** - happy path and oytherwise
* **diffable data and snapshot**
* empty state UI in case of no response data
* support for *dark mode*
* constants store string constants to avoid stringly errors
* UI development follows *Apples Human Interface Guidelines*

## Development Style
The app was developed using a simulation of multi iteration *Agile development*, with Features split into stories, with unit testing.

* Design Mocks were based on user requirememnts (Screen I and J)
* Architecture was made around API response - Data Modeling - Parsing response into model - Finally using model with MVVM to show info in UI
* Forecast Screen was made with Diffable Data Source (wrt WWDC 2019) - following task guideline requirements per cell with Temp Weather Map Logo Image and date and time info
* Current Weather View was made with inspiration from Apple Weather and Dark Sky app - following task guideline requirements of showing current teprature for  users location and button to see forecast, it also shows other helpful info.

## Image For Reference
### Screen A - Current  Weather Page
<img src="WeatherMe/GitHub%20Demo%20Images/CurrentWeather.PNG" width="400">

### Screen B - Forecast Page
<img src="WeatherMe/GitHub%20Demo%20Images/Forecast.PNG" width="400">

### Screen C - Loading View
<img src="WeatherMe/GitHub%20Demo%20Images/Forecast-Loading.PNG" width="400">

### Screen D - Empty State View
<img src="WeatherMe/GitHub%20Demo%20Images/Forecast-PermissionDenied.PNG" width="400">

### Screen E - Custom Alert
<img src="WeatherMe/GitHub%20Demo%20Images/Alert.PNG" width="400">

### Screen F - Missing Permission Current Weather
<img src="WeatherMe/GitHub%20Demo%20Images/Current-PermissionDenied.PNG" width="400">

### Screen G - Missing Permission Forecast Weather
<img src="WeatherMe/GitHub%20Demo%20Images/Forecast-PermissionDenied.PNG" width="500">

### Screen H - Location Permission Request
<img src="WeatherMe/GitHub%20Demo%20Images/LocationPermission.PNG" width="500">

### Screen I - Current Page Mock
<img src="WeatherMe/GitHub%20Demo%20Images/CurrentPageMock.PNG" width="500">

### Screen J - Forecast Page Mock
<img src="WeatherMe/GitHub%20Demo%20Images/ForecastPageMock.PNG" width="500">
