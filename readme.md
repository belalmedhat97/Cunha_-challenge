# Cunha challenge

app that retrieves information from MarcketStack API (https://marketstack.com) and displays the data of Entity (stock, currency) using MVVM Arc with SwiftUI. 

## App Structure 

**App target**

1. Scenes --> screens of the main app and every scene contains (view, view model, model) of the screen

2. Network --> contains (network requests, url configurations  and routes) 

3. Helper --> contains a enums for Error handling ( network and main errors)

4. Extensions --> contains extensions from (InString, InDate) to convert date to string and string to date


**Test target**

1. View models --> contains tests for the 2 view models classes in the app (Entity and Entity details)

2. TestHelperComponents --> contains (json stubs, json mock reader and newtork mock)

3. Extesnions --> contains tests for extensions


## App details 

the app has 2 screens 

1. **Entity screen** which has a search bar to search for a Entity that can be a (company, stock or currency)

![alt text](https://yourimageshare.com/ib/VmI6L6RPdg.webp)
![alt text](https://yourimageshare.com/ib/iNB5ia4bH3.webp)


2. **Entity Details Screen** which present details of the selected entity and present the charts for the prices within range of time 

![alt text](https://yourimageshare.com/ib/uo4wSvsdtK.webp)
![alt text](https://yourimageshare.com/ib/71yWLsNG52.webp)

### API
| Name | Route | description |
| :-----------: | :-----------: | :-----------: | 
| Tickers | http://api.marketstack.com/v1/tickers?access_key=key&search=apple | used to search for entities ( currency, stocks, company) |
| Historical Data | http://api.marketstack.com/v1/eod?access_key=key&symbols=AAPL&date_from=2023-08-25&date_to=2023-09-04 | used to search for historical data to represeent it on charts within date range |

### Frameworks
| Frameworks |
| :-----------: |
| SwiftUI |
| Combine | 
| Charts |
### Packages
| Pacakges |
| :-----------: |
| SwiftLint |




