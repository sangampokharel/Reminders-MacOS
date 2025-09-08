# Reminders – macOS
A simple and elegant macOS application built with SwiftUI and Core Data for managing categorized notes and todos. Easily create custom categories, assign colors, and track notes or todos with date selection and persistent storage.

# ScreenShots

<img width="100%" height="730" alt="Screenshot 2025-09-08 at 11 01 48" src="https://github.com/user-attachments/assets/a9a2b01a-48f0-4a77-bb6b-e972f649c35d" />
<img width="100%" height="756" alt="Screenshot 2025-09-08 at 11 02 59" src="https://github.com/user-attachments/assets/f095cb5e-258e-4a92-92de-840b09d43fab" />

# Features
# Category Management:
- Add new categories with a custom title and selectable color (e.g., Entertainment, Medical, Groceries).

- Sidebar displays your categories for quick navigation.

- Delete categories easily—removing a category deletes its associated notes.

# Notes & Todos

- Each category holds a list of notes or todos.

- Add new notes with a title, assign today's date or use a custom date picker.

- Mark each note as completed or not completed with a single click.

- Delete individual notes/todos.

- Status of todos persists across application launches thanks to Core Data.

# Persistence

- All categories, notes, completion status, and color preferences are saved using Core Data for robust local storage.

- Fully works offline and retains your data between app launches.

# User Interface
# Sidebar:
- Displays all your categories with icons and assigned colors for easy visual organization.

# Main Area:
- Presents the notes/todos for the selected category, allowing creation, editing, completion toggling, and deletion.

# Date Picker:
- When adding or editing a note, select today’s date quickly or pick a custom date.

# Getting Started
- Open the project in the latest version of Xcode.

- Build and run the app on macOS 12.0+.

- Use the sidebar to manage categories.

- Add and organize notes in each category, mark tasks complete, edit details, or delete as needed.

# Technical Highlights
- SwiftUI used for the modern, declarative UI.

- Core Data for all persistence needs—including entities for Category and Note/Todo.

- Leverages data bindings and state management for smooth interaction and instant updates.

- Designed for extensibility; future versions can add search, sorting, or reminders.

# Requirements
- macOS 15.0+
- Xcode 16+
- Swift 5.5+

