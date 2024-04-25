# comic_glance: Comic books browsing project

ComicGlance is an open-source comic books browsing application that exemplifies clean architecture principles while leveraging the power of [Bloc](https://pub.dev/packages/flutter_bloc) for state management. The app utilizes [Comic Vine API](https://comicvine.gamespot.com/api/) to provide users with an immersive movie discovery experience. With dependency injection powered by [get_it](https://pub.dev/packages/get_it), remote API calls managed by [dio](https://pub.dev/packages/dio) and [retrofit](https://pub.dev/packages/retrofit), and local data storage utilizing [hive](https://pub.dev/packages/hive).

Jump to the [Getting Started](#getting-started) section below to set up the application on your local machine.

<details open>
<summary>Tap to show/hide screenshots</summary>

<div>
<img src="https://github.com/abdelrahmann190/comic_glance/raw/main/screenshots/1.jpg" width="250">
<img src="https://github.com/abdelrahmann190/comic_glance/raw/main/screenshots/2.jpg" width="250">
<img src="https://github.com/abdelrahmann190/comic_glance/raw/main/screenshots/3.jpg" width="250">
<img src="https://github.com/abdelrahmann190/comic_glance/raw/main/screenshots/4.jpg" width="250">
</div>
</details>

## Features

- **Browse Comic books:** Dive into an expansive collection of comic books organized by popularity, top ratings.

- **Specific search feature:** Search for any comic book issue, volume, character and a lot more using the search feature.

- **Comics Details:** Access comprehensive information for comic book, including brief describtion, publishers, characters, and more.

- **Favorites:** Bookmark comics as favorites for quick access and reference.

- **Users registration:** User registration and authentication using firebase.

- **Responsive Design:** ComicGlance's interface adapts seamlessly to various devices and screen sizes, powered by [`responsive_sizer`]('https://pub.dev/packages/responsive_sizer').

- **Offline Access:** Enjoy access to recently viewed movies even without an active internet connection.


## Architecture and Libraries Used

ComicGlance embraces a variety of architectural principles and libraries to enhance development and maintainability:

### Architecture

The project includes 2 main folders:

- **Core folder:** This folder contains all the utilities that are shared across the entire app, including networking, error handling, theming, routing and other data.

- **Features folder:** This folder contains all the features that are included in the app, each feature is broken down into 3 layers (data, logic and ui).

- **Data Layer:** This contains the models and the repositores for each feature.

- **Logic Layer:** Contains the state managment logic to wire between the data layer and the ui layer.

- **UI Layer:**  This layer is responsible for managing all the presentation and user interface elements.

### State Management

- **Bloc:** Implements the Bloc state management library.

### Dependency Injection

get_it is used for dependency injection, ensuring the application is decoupled and modular.

### Networking

Dio is employed to facilitate remote API calls, enhancing the efficiency of data retrieval.

Retrofit is used also to manage and simplify API calls, reducing boilerplate code.

### Local Database

Hive is utilized for local database storage, enabling seamless offline access to previously viewed movies.

### offline state checker

connectivity_wrapper is a library that provides a wrapper over the main app that checks if the user is online and if not it shows a warning that internet connection is lost.

### Functional Programming with the Freezed Library

We utilize the freezed library to define an algebraic data type called ApiResult, which encapsulates the results of API calls. This data type is structured with two constructors: success and failure. By employing pattern matching, we can efficiently handle each API call result:

Success: If the API call is successful, the success constructor is used to hold and process the resulting data.
Failure: If the API call fails, the failure constructor allows us to manage the error effectively.
This approach simplifies error handling and enhances the clarity of the code by distinctly separating the successful outcome from the handling of errors, making the logic straightforward and maintainable.

### Code Generation

Freezed and json_serializable are employed for code generation, simplifying the creation of data classes and reducing boilerplate code.

### Authentication

Using firebase we have user registration system using email and password.

### Other Libraries

- `cached_network_image` for handling the loading of online images.
- `shared_preferences` for storing local tokkens.
- `chips_choice` used for prevewing search options as multible choices.
- `flutter_secure_storage` Used to protect and hide the api tokken.
- `gap` Used for spacing between UI objects.
- `cached_network_image` for image caching.
- `flutter_dotenv` for managing environment variables.


## Getting Started
To set up ComicGlace Application on your local machine, follow these steps:

1. **Clone the Repository:** Open a terminal and run the following command to clone the project repository:

   ```bash
   git clone https://github.com/abdelrahmann190/comic_glance.git

2. Create a `.env` file in the root directory of the project.`

3. Install project dependencies:
   ```bash
   flutter get pub
   ```

4. Generate necessary code using `build_runner`:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

Now you're ready to explore ComicGlance Application!.

Feel free to explore the various features and functionalities outlined in the README.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- The Comic Vine API provides the comic books data that powers the application.

---
