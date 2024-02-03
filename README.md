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
![Screenshot_2024 02 03_18 11 08 702](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/5abb8a10-1c8f-4ab8-a0da-cadeade21649)
![Screenshot_2024 02 03_18 10 57 036](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/288dd074-672e-4747-8b57-55e7dc9a090a)
![Screenshot_2024 02 03_18 10 51 402](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/36d7a353-7262-46be-960d-105e56199912)
![Screenshot_2024 02 03_18 10 42 802](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/89e85186-0c29-42c5-83d2-66299a94b261)
![Screenshot_2024 02 03_18 10 37 169](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/b5d2ef48-59d6-4c63-9e9d-fd33fc81afdb)
![Screenshot_2024 02 03_18 10 22 202](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/703dbe79-555b-4deb-ab20-b9aa71d4d65e)
![Screenshot_2024 02 03_18 10 17 702](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/f60b20f8-88c0-4613-88ca-39b784aa09bd)
![Screenshot_2024 02 03_18 10 07 069](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/b938605a-0107-4fbd-bc15-a73978d67552)
![Screenshot_2024 02 03_18 09 59 971](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/b8fed59b-ac14-44b7-9a84-a826fee944a2)
![Screenshot_2024 02 03_18 09 55 239](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/613de804-ef8e-4ad7-9302-3d15ac4df2ec)
![Screenshot_2024 02 03_18 09 49 769](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/fa6c1ed5-0f7a-4eba-b5d1-60911d2ac35a)
![Screenshot_2024 02 03_18 09 43 502](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/fee46852-29ee-470e-8d48-ed5afe9a6a40)
![Screenshot_2024 02 03_18 09 27 902](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/5678386c-03b0-43fe-adec-6547325d5672)
![Screenshot_2024 02 03_18 08 34 536](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/de663972-c93f-4026-aed5-f6c15d48e45b)
![Screenshot_2024 02 03_18 08 17 236](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/679f5688-8d51-4a33-a275-da0148f35adb)
![Screenshot_2024 02 03_18 12 27 402](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/885452dc-adb5-451f-a4c5-df19413dd09d)
![Screenshot_2024 02 03_18 12 18 769](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/504fbff6-a62d-4d58-9041-52cea7e50548)
![Screenshot_2024 02 03_18 12 01 603](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/88853cbc-6074-4d87-b2b2-4e58b9d3b892)
![Screenshot_2024 02 03_18 11 34 569](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/4ac647b9-e78d-4667-8942-f7ab0878bc0f)
![Screenshot_2024 02 03_18 11 29 469](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/58d4010f-7cdd-46af-9fe2-a57b39dbf39a)
![Screenshot_2024 02 03_18 11 18 836](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/09d8093a-0f58-463d-ba44-9d10cd82cb2a)
