# Eden (Task)

# An Assessment Project.
An app that displays an order and updates its status in real-time.

## 🖼️ Screenshots ##
<p float="left">
  <img src= "https://github.com/maykhid/eden_task/blob/main/assets/images/app_ui.jpg" width="434.5" height="424.5" />
  
</p>

![](https://github.com/maykhid/eden_task/blob/main/assets/images/demo.gif)


## ✨✨ Features
* User authentication with Firebase Auth via Google or GitHub.
* Real-time order tracking with seamless updates.
* Clean and intuitive UI with a focus on user experience.

## 🛠 Essential Plugins / Packages Used
- Bloc (For State Management) 
- Equatable (For checking the equality of Objects)
- Get-It (For Dependency Injection)
- Ably flutter (Live updates)
- Firebase auth
- Google sign-in

## 🦾 Getting Started
You have to have Flutter installed on your machine. Clone this repository and run `flutter pub get`.
I am currently running `Flutter version beta, 3.15.0-15.2.pre` with `Dart version 3.2.0`. Register on <a href="https://azure.microsoft.com/en-us/services/cognitive-services/translator/#overview" target="_blank"> Ably</a> to get your API key.

## 📖 Brief
The task is to build a simple order-tracking app using Flutter, incorporating Firebase Auth for user authentication and Ably Realtime for real-time updates. The app enables users to sign in with either Google or GitHub via Firebase Auth.

## 🛠 Technical Note
The app connects to Ably and listens for updates as soon as the app is launched and attached to the ``eden`` channel. Updates sent from Ably are received in real-time and will update the UI but using the pre-determined data makes the app work as intended without any hiccups ``{
  "name": "Eden",
  "data": "ORDER PLACED"
}``, the ``data`` value should be any of these ``ORDER PLACED``, ``ORDER ACCEPTED``, ``ORDER PICK UP IN PROGRESS``, ``ORDER ON THE WAY TO CUSTOMER``, ``ORDER ARRIVED`` and ``ORDER DELIVERED`` (so the app can work as intended).

## ⚠️ Issues
On some devices, authentication might not work especially when you sign in with GitHub you might get this error:
```Unable to process the request due to missing initial state. This may happen if browser sessionStorage is inaccessible or accidentally cleared. Some specific scenarios are - 1) Using IDP-Initiated SAML SSO. 2) Using signInWithRedirect in a storage-partitioned browser environment.``` This is an active Firebase issue, you can follow it <a href="https://github.com/firebase/firebase-js-sdk/issues/4256" target="_blank"> here</a>, try another sign-in method when that occurs.

