# Week 03 (Firebase)

In this week, I learnt, how to work with Firebase in Flutter. I learnt how to use Firebase Authentication, Cloud Firestore, and Firebase Storage.

## Firebase Authentication

Firebase Authentication is a service that provides backend services, easy-to-use SDKs, and ready-made UI libraries to authenticate users to your app. It supports authentication using passwords, phone numbers, popular federated identity providers like Google, Facebook and Twitter, and more.
In this example, I used email and password authentication. I designed four screens for this example:

- `SplashScreen` - This screen is shown when the app is launched. It checks if the user is logged in or not. If the user is logged in, it navigates to the `PostsScreen`. If the user is not logged in, it navigates to the `LoginScreen`.
- `LoginScreen` - This screen is shown when the user is not logged in. It has two text fields for email and password. It also has a button to login. If the user is not registered, it navigates to the `SignUpScreen`.
- `SignUpScreen` - This screen is shown when the user is not registered. It has two text fields for email and password. It also has a button to sign up. If the user is already registered, it navigates to the `LoginScreen`.
- `PostsScreen` - This screen is shown when the user is logged in. It has a button to sign out.
