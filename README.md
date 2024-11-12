
# SnapEats - Food Ordering Application

SnapEats is a Flutter-based food ordering application that provides an intuitive interface for browsing menus, selecting categories, viewing detailed menu items, and customizing orders with various modifiers. The project is structured using Clean Architecture and Bloc for state management, ensuring a scalable and maintainable codebase.

## Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Project Setup](#project-setup)
- [Usage](#usage)
- [Screens](#screens)
- [Technologies and Packages](#technologies-and-packages)

## Features

- **Menu Navigation**: View and explore menus organized by categories.
- **Category Filtering**: Filter items based on selected categories.
- **Detailed Menu Items**: View descriptions, prices, and customizable options for each item.
- **Customizable Orders**: Choose add-ons and modifiers for each menu item.
- **Responsive UI**: A user-friendly interface that adapts to different screen sizes.
- **Data Loading**: Loads menu data dynamically from JSON files for easy updates.
## Project Structure

The project follows Clean Architecture principles, organized into the following layers:

```vbnet
lib
├── features
│   ├── data
│   │   ├── datasources
│   │   ├── models
│   │   └── repository
│   ├── domain
│   │   ├── repository
│   │   └── usecases
│   └── presentation
│       ├── bloc
│       ├── views
│       └── widgets
├── utils
│   ├── app_colors.dart
│   ├── app_constants.dart
│   ├── app_images.dart
│   └── app_styles.dart
└── main.dart
``` 

-   **Core**: Contains utility classes and error handling.
-   **Data**: Handles data models, data sources, and repository implementations.
-   **Domain**: Manages business logic, including entities and use cases.
-   **Presentation**: Manages the UI, widgets, and Bloc for state management.

## Installation

### Prerequisites

Make sure you have Flutter installed. You can check [Flutter’s installation guide](https://flutter.dev/docs/get-started/install) for more details.

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/snap-eats.git 
   ```
2. **Navigate to the project directory**:
   ```bash
   cd snap-eats
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Run the application**:
   ```bash
   flutter run
   ```
 
## Project Setup

To set up the project correctly, follow these steps:

1.  **JSON Data Files**:
    
    -   Ensure that JSON data files (e.g., `menu_data.json`) are located in the `assets/json` folder. These files are used to load menu and category data for the app.
2.  **Configure `pubspec.yaml`**:
    
    -   Open `pubspec.yaml` and verify that the `assets` section includes paths to the JSON files:
   ```yaml
flutter:
  assets:
    - assets/json/menu_data.json
   ```

3. **Running the App on Emulator or Physical Device**:
    
    -   Make sure you have an emulator running or connect a physical device.
    -   Run the app by executing:
    
        ```yaml
        flutter run
        ```
        
4. **State Management Setup (Bloc)**:
    
    -   Bloc is already configured for this project. If you need to add new features or states, refer to the `presentation/bloc` folder to manage additional business logic.

## Usage

Once you have the app up and running, you can navigate through various screens:

-   **Home Screen**: Browse and filter menu categories.
-   **Menu Screen**: View detailed menu items, including prices and descriptions.
-   **Customization**: Select modifiers or add-ons for menu items.

## Screens

-   **Home Screen**: Displays a list of categories with a filter option.
-   **Menu Screen**: Shows available menu items with details like descriptions and prices.
-   **Order Summary**: Summarizes selected items, modifiers, and total price.

## Technologies and Packages

This project uses the following technologies and packages:

-   **Flutter**: Framework for building the UI.
-   **Flutter Bloc**: State management for handling UI state and business logic.
-   **flutter_sizer**: For responsive sizing and layout.
-   **flutter_svg**: For displaying SVG images.


## Contact

[](https://github.com/RaveenRPY/syeta-hiring-mobile-challenge#contact)

For any inquiries, reach out to  **[raveen.rpy@gmail.com](mailto:raveen.rpy@gmail.com)**.
\
\
\
\
**Copyright (c) 2024, Raveen P. Yatalamaththa**
