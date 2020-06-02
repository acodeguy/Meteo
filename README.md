# Meteo 
### An iOS weather app built in native Swift, using TDD and the Meta Weather API
[![Build Status](https://travis-ci.org/acodeguy/Meteo.svg?branch=master)](https://travis-ci.org/acodeguy/Meteo) [![Maintainability](https://api.codeclimate.com/v1/badges/0fa4f67f306395df8fb1/maintainability)](https://codeclimate.com/github/acodeguy/Meteo/maintainability)

## Background
Having only learned to create apps using Apple's flavour of MVC, it became necessary to learn more ways. This app is tes-driven, using Model-View-Presenter as its design pattern, to increase testability by separating its concerns more than MVC often allows. 

## Getting Started
Clone this repo to your hard drive using `git clone https://github.com/acodeguy/Meteo.git`.
Navigate into the newly-cloned directory an open the Xcode project file in Xcode.
There are no third-party dependencies of any kind, so Cocoapods, though great, is not needed here.



## User Stories
#1
```
As a User
So that I can know what to wear outside
I want to be able to see the current weather conditions in my current location
```
#2
```
As a User
So that I can know the weather conditions forecasted
I want to be able to see the weather for the next ten days
```
#3
```
As a User
So that I can see the weather world-wide
I want to be able to add other locations to my favourites
```

## Testing
The tests can be run in Xcode by pressing Cmd + U.
There are currently unit tests, using test doubles where necessary.
