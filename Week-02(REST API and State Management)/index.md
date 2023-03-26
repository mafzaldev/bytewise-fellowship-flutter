# Week 02 (REST API and State Management)

In this week, I learnt about how REST API works and how can I manage my application state using Provider.

## REST API

The instructor provided me some resources to learn about REST API. I learnt about REST API and how to use it in Flutter. I also learnt about how to use REST API in Flutter using the `http` package. I learnt how to test REST API endpoints using Postman.

### JSON Introduction

I learnt about the key elements of REST API, like:

- HTTP Methods
- HTTP Status Codes
- JSON Object
- JSON Values (Int, String, Boolean, Array, Object)
- JSON Structure (Key-Value Pair)
- JSON Object with Array
- JSON Object with nested JSON Object

### JSON to Dart model

I learnt how to convert JSON data to Dart models using the different methods like:

- [https://javiercbk.github.io/json_to_dart/](https://javiercbk.github.io/json_to_dart/)
- [https://app.quicktype.io/](https://app.quicktype.io/)
- [https://plugins.jetbrains.com/plugin/12562-jsontodart-json-to-dart-](https://plugins.jetbrains.com/plugin/12562-jsontodart-json-to-dart-)

### GET request handling in Flutter

I learnt how to handle GET requests in Flutter, like:

- building List with JSON Data using FutureBuilder
- building List with JSON Data using FutureBuilder with custom model
- building List with Complex JSON Data using FutureBuilder Without Model
- building List with even Complex JSON Data (Images, Conditional Rendering) using FutureBuilder

Furthermore, I learnt how to host your custom GET API endpoint on [https://webhook.site/](https://webhook.site//)

### Fake Authentication App

I learnt how to handle POST requests in Flutter, like creating an app, where user can use text field to enter username and password to perform a fake signup and login activity using POST request with JSON data

### COVID-19 Tracker App

I learnt how to build a COVID-19 Tracker App using a REST API and flutter, with different features. I used **disease.sh** API with the following endpoints:

- [World Stats](https://disease.sh/v3/covid-19/all)
- [Countries List](https://disease.sh/v3/covid-19/countries)

I used different packages to display the data in the app, like:

- [http](https://pub.dev/packages/http)
- [animated_text_kit](https://pub.dev/packages/animated_text_kit)
- [pie_chart](https://pub.dev/packages/pie_chart)
- [flutter_spinkit](https://pub.dev/packages/flutter_spinkit)
- [shimmer](https://pub.dev/packages/shimmer)

I designed 4 different screens for the app, as follows:

- **Splash Screen**: The app starts with a splash screen, where the app logo is displayed with a rotating animation.
- **World Stats Screen**: The app displays the world stats in a card, where the user can see the total cases, recovered cases, and deaths around the world.
- **Countries List Screen**: The app displays a list of all the countries, where the user can see the total cases, recovered cases, and deaths in each country. The user can also search for a specific country. The user can tap on a country to see the country details This screen shows a shimmer effect while the country data is loading.
- **Country Details Screen**: The app displays the country details in a card, where the user can see the total cases, recovered cases, and deaths in the country. The user can also see the country flag and country name.

---

## State Management (Provider and MVVM)

In this section, firstly I revisited the state management concepts, like:

- **Stateless Widgets**: Widgets that don't have any state, these are immutable. These widgets are used to display the UI.
- **Stateful Widgets**: Widgets that have state, these are mutable. These widgets are used to manage the state of the application.

### Why do we need state management?

Due to any state change in the application, the UI needs to be updated. If we don't use any state management, then we need to rebuild the entire Widget tree, which is not a good practice and can cause inefficiency. So, we need to use state management to manage the state of the application. Among all the state management techniques, **Provider** is the easy to get started with and is the most popular state management technique.

### Provider

Provider is a state management technique, which is used to manage the state of the application. It is a wrapper around InheritedWidget, which is used to pass data to the widgets in the widget tree. It is a very easy to get started with and is the most popular state management technique.
