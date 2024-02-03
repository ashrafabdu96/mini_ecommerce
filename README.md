# Mini E-Commerce Flutter App

## Description

This is a mini e-commerce application built with Flutter for the front end and PHP/MySQL for the backend. The app allows users to browse products, add items to the cart, and place orders. The server-side is set up using XAMPP to host a local MySQL database.

## Features

- User authentication
- Product listing with details
- Shopping cart functionality
- Order placement and tracking

## Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- XAMPP: [Install XAMPP](https://www.apachefriends.org/index.html)

## Getting Started

1. Clone the repository:

    ```bash
    git@github.com:ashrafabdu96/mini_ecommerce.git
    ```

2. Start the XAMPP server and import the provided MySQL database script.

3. Update the backend URL in the Flutter app:

    Open `lib/core/constants/api_links.dart` and modify the `kLinkServer` variable put your ip localhost:

    ```dart
    class ApiLinks {
    //in my case
      static const String kLinkServer = "http://172.28.0.1/ecommerce";
    }
    ```

4. Install dependencies:

    ```bash
    cd mini_ecommerce
    flutter pub get
    ```

5. Run the Flutter app:

    ```bash
    flutter run
    ```

## Backend project
- `backend/`: git@github.com:ashrafabdu96/ecommerce.git 
- `database/`: ecommerce/sqlfiles/e_commerce.sql

## Technologies Used

- Flutter (Dart)
- PHP
- MySQL
- XAMPP
## Screenshots



![Screenshot_2024 02 03_18 08 17 236](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/8f8586fa-2648-45ff-ac45-5d7b28b7558e)


