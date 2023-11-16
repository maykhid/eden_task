# Eden (Task)

# An Assessment Project.
An app that displays an order and updates it's status in realtime.

## 🖼️: Screenshots ##
<p float="left">
  <img src= "https://github.com/maykhid/eden_task/blob/main/assets/images/app_ui.jpg" width="434.5" height="424.5" />
  
</p>

![](https://github.com/maykhid/eden_task/blob/main/assets/images/demo.gif)


## ✨✨ Features
- User authentication.
- Live update.

## 🛠 Essential Plugins / Packages Used
- Bloc (For State Management) 
- Equatable (For checking equality of Objects)
- Get-It (For Dependency Injection)
- Ably flutter (Live updates)
- Firebase auth
- Google sign in

## Getting Started
You have to have Flutter installed in your machine. Clone this repository and run `flutter pub get`.
I am currently running `Flutter version 3.7.6` with `Dart version 2.19.3`.

## 📖 Brief
This project as previously stated is a simple blog app for users to read blog posts. They can share, search and bookmark posts. 

It also includes a Caching mechanism that stores posts locally, this is so that the user has something to read when there is no internet connection (I understand that this might make errors hard to see, so to really see how errors are handled, please make sure to clear app data and run the app without internet connection to see how errors are displayed).

* Edge case:
The user details were not returned when making the `/posts` request call on our API so I had to make another call to get the list of users, then match the returned `userId` against the users id to get the name of the author. I returned both Posts and Users for every request made using a Tuple. This allows for cleaner and less verbose code. I applied this to every other parts where the Users (Authors) were needed.


The app can be used offline also. All functionalities still exist as long as all data needed were stored locally.
