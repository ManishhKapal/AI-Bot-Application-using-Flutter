## AI Chat & Art Companion (Flutter with ChatGPT & DALL-E)

This application provides a fun and interactive way to chat with an AI and generate creative text formats or images based on your prompts. Built with Flutter, it integrates the powerful capabilities of ChatGPT and DALL-E through their APIs.

### Features

* Chat with an AI powered by ChatGPT for engaging conversations.
* Generate creative text formats like poems, code, scripts, musical pieces, etc. based on your prompts.
* Use DALL-E to create unique images based on your descriptions.

**Important:**

This application requires your own OpenAI API key for access.

### Prerequisites

* Flutter development environment set up (including Flutter SDK and Dart).
* An OpenAI account with access to ChatGPT and DALL-E APIs.

### Installation

1. Clone this repository.
2. Navigate to the project directory in your terminal.
3. Run `flutter pub get` to install dependencies.

### Configuration

1. Create a file named `secret.dart` inside the `lib` folder of your project.
2. Inside `secret.dart`, find the variable `openAIKey` and replace the placeholder value with your actual OpenAI API key obtained from your account.

**Important Note:**

* **Do not commit** the `secret.dart` file to version control systems like Git. Consider using a `.gitignore` file to exclude it.
* **Treat your API key with care** and avoid sharing it publicly.

### Running the App

1. Connect an Android device to your development machine or start an emulator.
2. Run `flutter run` in the terminal to start the app.

### Disclaimer

ChatGPT and DALL-E are powerful tools, But their outputs may not always be accurate or factual. It's recommended to use them responsibly and critically evaluate the generated content.

### Contributing

Feel Free to contribute to this project by creating pull requests with new features, bug fixes, or improvements.

### License

This project is licensed under the MIT License. See the LICENSE file for details.
