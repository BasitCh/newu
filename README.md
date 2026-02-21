NewU Breathing App

A pixel-perfect, responsive Flutter Web/Mobile application that provides guided breathing exercises (like Box Breathing) to help users find calm and focus.

## 🚀 Live Demo & Deployment
- **Live URL**: [https://web-ashen-three-89.vercel.app](https://web-ashen-three-89.vercel.app)

The app is fully optimized and ready to deploy to the **Vercel Free Tier** directly from this codebase. Since Vercel requires personal terminal authentication or a GitHub linkage to host a project, you can easily launch it yourself in two simple steps:

1. **Build the production web app:**
   ```bash
   flutter build web --release
   ```
2. **Deploy to Vercel (Ensure Node/Vercel CLI is installed):**
   ```bash
   cd build/web
   npx vercel --prod
   ```

*(Alternatively, you can just drag and drop the `build/web` folder straight into the Vercel Dashboard in your browser!)*

Features Implemented

* **Pixel-Perfect UI:** Accurately implemented based on the provided Figma constraints, including custom typography (Google Fonts - Inter), exact color grading for both Light and Dark themes, and precise layouts.
* **Component-Based Architecture:** Uses modularized, extracted StatelessWidgets (`SectionHeader`, `SelectorPill`, `AdjusterRow`, etc.) to keep presentation logic clean, scalable, and easy to maintain.
* **State Management:** Fully integrated `flutter_bloc` with `freezed` for immutable, predictable state transitions across the breathing timer layout. Dependency Injection via `get_it` and `injectable`.
* **Dynamic Animations:**
  * Uses a seamless `Stack` native implementation for the thin, precise interactive timeline slider.
  * Implements dynamic floating cloud vector graphics that smoothly adapt between light and dark themes using exact opacity adjustments to blend flawlessly with the background.
  * Integrated a confetti `lottie` animation overlaid gracefully behind a green checkmark success tick for the Finish View.
* **Audio Feedback:** Synthesized and integrated a high-quality `.mp3` bell/chime sound effect that rings on successful phase transitions, driven natively by the `audioplayers` package.
* **Clean Code:** Adheres strictly to Clean Architecture principles (Presentation, Domain, Data layers), utilizing abstract classes, Dartz for functional error handling, and eliminating scattered lint/analyzer issues. 

## Getting Started

### Prerequisites

* Flutter SDK (Version ^3.5.3 or higher recommended)
* Dart SDK

### Installation

1. Clone this repository.
2. Run `flutter pub get` to install all necessary dependencies (like `flutter_bloc`, `lottie`, `audioplayers`, and `freezed`).
3. (Optional) Run `dart run build_runner build -d` if you plan to modify bloc events or service locators.

### Running the App

To run the application locally on the web:

```bash
flutter run -d chrome
```

To build a minimized release package for the web:

```bash
flutter build web --release
```
