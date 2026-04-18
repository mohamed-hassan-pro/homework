# Basketball Points Counter App

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

## 📖 Project Overview
The Basketball Points Counter App is a dynamic, interactive utility designed to keep track of scoring during a sports match. Providing side-by-side management for two teams, it effectively demonstrates basic but crucial reactive state interactions.

## ✨ Key Features
*   **Dual Team Scoring:** Cleanly compartmentalized side-by-side scoring UI to manage Team A and Team B without clutter.
*   **Multi-Point Additions:** Distinct buttons provided for standard basketball scores incrementing by 1, 2, or 3 points simultaneously per team.
*   **Global Reset:** A unified clear button explicitly programmed to revert scores for both teams back to zero concurrently.

## 🧠 Lessons Learned
*   **State Management Basics:** Extensively applied `StatefulWidget` and `setState()` paradigms to ensure the user interface strictly reflexes internal data mutations.
*   **Component Modularity:** Advanced structural thinking by extracting a dynamic `TeamSection` to handle identical layout constraints efficiently, avoiding code duplication.
*   **Stateful Architectures:** Mastered isolating data into logic wrappers (`PointsModel`) passed downwards safely to child widgets while interacting seamlessly with state.

## 📂 Folder Structure
```text
lib/
├── basketball_points_counter_screen.dart
├── main.dart
├── points_model.dart
└── team_section.dart
```

## 📸 Screenshots
<p align="center">
  <img src="https://via.placeholder.com/250x500.png?text=App+Screenshot" width="250">
</p>
