# 📱 FeedFlow

FeedFlow is a Twitter-like social media feed iOS application that demonstrates clean **MVVM architecture**, **UI modularity**, and **plugin-based feed item handling** using **SwiftUI + Combine** — without third-party libraries.

---

## 🚀 Problem Statement

Build a scalable social media feed that can handle:
- Complex UI states
- Real-time updates (Simulated)
- Offline capabilities (Local JSON)

While maintaining:
- Clean **MVVM separation**
- **UI modularity** with reusable components
- **Testable ViewModels** without UI dependencies

---

## 🧑‍💻 Features
- MVVM Architecture using **SwiftUI + Combine**
- Modular Feed Items:
  - Text Posts
  - Image Posts
  - Video Preview (Plugin-ready)
- Pull-to-Refresh & Infinite Scrolling
- Dynamic height adjustment for variable content
- Plugin Mechanism to extend feed item types
- Responsive Layout for small screens
- Like button animations with state management
- Local JSON-based data (`posts.json`)
- Local Assets for Offline Demo

---

## 📐 Architecture - MVVM + Combine

- **Model**: Defines `Post`, `PostType` (Enum for feed item types)
- **ViewModel**: Manages posts list, like toggling, refresh/load logic
- **View**: SwiftUI Views bind to ViewModel using Combine's `@Published` & `@ObservedObject`
- **PluginFeedItemView**: Dynamically handles multiple feed item types (Text, Image, VideoPreview)

No third-party libraries are used for architecture or data binding.

---

## 📝 How to Run

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/priya-551/FeedFlow.git
    cd FeedFlow
    ```

2. **Open in Xcode**:
    - Open `FeedFlow.xcodeproj` with **Xcode 16.4+**

3. **Ensure Assets**:
    - These images must be added in **Assets.xcassets**:
        - `feedFlowLogo`, `feedFlowImage`, `ammaMenuImage`, `priyaAvatar`, `ammaAvatar`
    - Make sure `posts.json` is bundled with the project.

4. **Run on Simulator**:
    - Preferred Simulators: iPhone 15 / iPhone 14.
    - Supports small screen resolutions (responsive layout).

---

## 🤝 Contributing

This project is beginner-friendly!  
Feel free to fork and contribute with:
- New Feed Item Types (Polls, Reels, etc.)
- Backend Integration (Firebase, APIs)
- Dark Mode Enhancements
- UI Animation Improvements

---

## 🙋‍♀️ Author

**Priya Reddy**  
[LinkedIn Profile](https://www.linkedin.com/in/priya551/)  
Aspiring iOS Developer | Passionate about intuitive mobile experiences.



## 🌟 Star this Repo if you like the project!



**HAPPY CODING**


## License
This project is open-source under the [MIT License](LICENSE).

