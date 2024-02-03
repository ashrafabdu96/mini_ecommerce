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


![Screenshot_2024 02 03_18 08 34 536](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/85aa491e-ee40-463b-9116-aabfcbc55042)


![Screenshot_2024 02 03_18 09 27 902](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/84db20e0-f99c-4dff-988d-44733f85e940)

![Screenshot_2024 02 03_18 09 43 502](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/6d54c3a5-ae23-4144-aee1-1297a7cdbdc7)
![Screenshot_2024 02 03_18 09 49 769](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/746eb2be-0e0f-41af-bad0-41242fa68321)
![Screenshot_2024 02 03_18 09 49 769](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/78343db3-d830-4276-a6fb-61db060b58bb)

![Screenshot_2024 02 03_18 09 55 239](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/914c48b6-0cc2-4908-8e22-6c32c360dcea)

![Screenshot_2024 02 03_18 09 43 502](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/f0256878-4ea0-4fbe-9cf4-85d8978759f9)
![Screenshot_2024 02 03_18 09 49 769](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/17455289-7d39-49cb-b551-bbfe3ceb5254)![Screenshot_2024 02 03_18 09 59 971](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/045d71eb-4026-47f2-ace3-9654be11bc51)

![Screenshot_2024 02 03_18 10 07 069](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/b0c4df73-c926-48ec-8b3d-ffe0152e168a)
![Screenshot_2024 02 03_18 11 18 836](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/7ea03388-e5ab-48cf-ad41-a23a2b898fea)
![Screenshot_2024 02 03_18 11 08 702](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/a6a26d0c-3daa-4844-aa4d-82f1f0701774)
![Screenshot_2024 02 03_18 10 57 036](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/ad5dafc8-41a6-4a97-a625-b4e43e4102c0)
![Screenshot_2024 02 03_18 10 51 402](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/efbcc6e7-2204-45c0-b581-0d2ac8bb15dc)
![Screenshot_2024 02 03_18 10 42 802](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/3c554ff9-aede-4bf5-b856-b66c2bf58989)
![Screenshot_2024 02 03_18 10 37 169](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/6d828b4b-368f-4769-bf16-9eab24691a9a)
![Screenshot_2024 02 03_18 10 22 202](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/83e775e8-de3d-4c53-8169-c132a471eba8)
![Screenshot_2024 02 03_18 10 17 702](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/c35002aa-8981-4251-a0c0-4356eb7186f7)
![Screenshot_2024 02 03_18 12 27 402](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/1d166249-4738-4904-8e84-3a049b942520)
![Screenshot_2024 02 03_18 12 18 769](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/d6609688-0904-4849-9840-29721cfeedc1)
![Screenshot_2024 02 03_18 12 01 603](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/8568dff0-a33c-4cf0-a4fb-7e64d65281aa)
![Screenshot_2024 02 03_18 11 34 569](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/059230d2-ecf0-4b52-9baa-4e1aab73c051)
![Screenshot_2024 02 03_18 11 29 469](https://github.com/ashrafabdu96/mini_ecommerce/assets/157527434/d20b6ab0-6921-4580-8d69-c7e09ba88ed5)
