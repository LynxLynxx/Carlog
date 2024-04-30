# CARLOG

Carlog is an app to track your cars history. You can add mileage, costs, refuel, repairs etc. 

## User account
User can have an account with free and pro plan. Free plan allows user to have 1 car in his fleet, and ads will be shown on save actions etc.


## Pages
 - Overview
    - Current mileage with section to edit mileage
    - Reminders section, with horizontal scroll where u can add a reminder, edit remider,
    - Timeline
 - Analytics
    - Pie graph with expanses
    - Listview with percantage of cost for every type of expanse
 - Cars
    - Car can have two fuel tanks (Gas and LPG)
 - Settings
    - Logout
    - Type of expanses (default ones, and user can add more)

## Features:

### User's cars
User can have multiple cars for his account. Car can be selected on appbar menu. something like this: 

![alt text](readme_assets/image.png)

### Car expenses
For the first iteration app will allow to add pictures to your expenses logs, and next there will be scaning option, and maybe AI to take data from the picture, like what kind of expense it is how much it costs etc.

Expanses that are possible:
- fuel
- repairs
- technical inspection
- car maintaince
- ac service
- others


### Analitics
Page that will display analytics about selected car like:
- expanses
- milleage
- fuel costs

### History
It shows recent car expenses in timeline. User can filter by type of expanse.

### Cars page
Where user can add cars, delete cars, or edit information about the car. At creation of the car user can add information like, current milleage, volume of the fuel tank, picture of the car, model of the car, and personal name of the car. 


### Add Expanse Page
User can select what kind of expense it is. Expanse have information like:

- name, 
- cost,
- to which car this expanse is for (default will be selected from home page)
- day of the expanse (defualt Datetime.now())
- millage of the car (optional)
- image(s) of the expanse (eg. picture of the invoice)
- is this expanse repeatable if yes at what milleage or at what time (for push notification)


### Push notifications (Notification Page)
User can recive push notification for expanses that were marked as repatable, push notification will be send 1 week before expanse exparation date and 1 day, also 100 km before exparation. 

## Figma design


## Future features
- pro plan: 
    - track user trips and marks them as business or personal
    - pro plan if user want to have more than 1 car
    - ads are disabled


## Contribution
If you want to contribute to this app please contant me at: ryszard.schossler@gmail.com with mail title: Contribution to Carlog App.# Carlog
