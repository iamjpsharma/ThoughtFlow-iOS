# ThoughtFlow - AI-Powered Journal App  

ThoughtFlow is a modern journal app designed for capturing thoughts, reflections, and ideas. It prioritizes privacy with offline storage and a simple, intuitive user experience. The app is designed to evolve with AI-powered features in future updates, making it a personal growth companion.  

---

## 🚀 **Scope**  
ThoughtFlow focuses on offering a distraction-free journaling experience with plans for advanced organization, analytics, and AI-powered insights.

---

## 🚀 **Tech Stack**

- [x] **SwiftUI**: The modern framework for building user interfaces on iOS. We use SwiftUI for building declarative UIs, ensuring a smooth and consistent user experience.
- [x] **Core Data**: A powerful framework for data management and persistence. We use Core Data to store and retrieve app data efficiently.
- [x] **GitHub Actions**: For Continuous Integration (CI) to automate builds, testing, and code coverage on every push.
- [ ]  **Combine**: To manage asynchronous events and data flow in the app.
- [ ] **Test-Driven Development (TDD)**: We follow TDD for writing unit and UI tests, ensuring higher code quality and maintainability.
- [ ] **CocoaPods** (or SwiftPM): For managing third-party libraries and dependencies used in the app (if applicable).
- [ ] **Swift Concurrency (async/await)**: Apple's latest feature for simplifying asynchronous programming. We use async/await to write cleaner, more readable code for tasks like networking, background operations, and more.
- [ ] **CoreML**: For integrating machine learning models into the app. CoreML allows easy on-device predictions, ensuring faster, privacy-conscious AI capabilities.
- [ ] **Swift Package Manager (SPM)**: The official dependency manager for Swift. It simplifies the integration of third-party libraries and tools directly into your Xcode project without external dependencies like CocoaPods or Carthage.
- [ ] **App Clips**: A small part of an app that’s discoverable and usable without installation. We use App Clips for delivering fast experiences for specific tasks within the app.
- [ ] **WidgetKit**: For creating home screen widgets, enabling users to interact with your app’s content right from the home screen without opening the app.
- [ ] **Intents & SiriKit**: For creating voice-based interactions through Siri, enabling users to perform tasks hands-free or with simple voice commands.


## 📋 **Features**  

### ✅ Current Features  
- [x] **Empty State**: Display an icon and message when no entries are available. 
- [x] **Offline Journaling**: Local data storage using Core Data.  
- [ ] **Simple and Intuitive UI**: A clean, minimalist interface.  
- [x] **Entry Management**: Add, view, and delete journal entries.  
- [x] **Detail View**: View the details of a journal entry, including title, content, and timestamp.  
 

---

## 🛠️ **Development Path**  

### **Project Structure**
- **PersistenceController**: Handles Core Data stack and manages the local database.
- **ContentView**: Displays a list of journal entries or an empty state when there are no entries.
- **JournalDetailView**: Displays detailed information about a single journal entry.

### **Tech Stack**  
- **Core Data**: Local persistence for storing journal entries.
- **SwiftUI**: For building a modern and responsive user interface.
- **Xcode Previews**: Used to streamline UI development.

---

## 🌟 **Future Features**  

### **Phase 1: Enhanced Entry Management**  
- [ ] **Rich Text Editing**: Allow users to format their journal content with bold, italics, and bullet points.  
- [ ] **Tags and Categories**: Add tags or categories to journal entries for better organization.  
- [ ] **Search Functionality**: Enable searching for entries by title, content, or date.  

### **Phase 2: AI Integration**  
- [ ] **Sentiment Analysis**: Use on-device machine learning to analyze the mood of journal entries.  
- [ ] **Smart Suggestions**: Provide prompts based on past entries or user preferences.  
- [ ] **Insights Dashboard**: Visualize trends in user mood and activity over time.  

### **Phase 3: Customization Options**  
- [ ] **Themes and Fonts**: Offer theme customization, including light/dark mode and custom fonts.  
- [ ] **Reminder Notifications**: Gentle reminders to journal regularly.  

### **Phase 4: Cross-Device Sync**  
- [ ] Explore options to enable iCloud-based syncing across Apple devices.  

---

## 📈 **Milestones**  

### Version 1.0  
- [ ] Core journaling features with stable Core Data integration.  

### Version 1.5  
- [ ] Tags, search functionality, and improved entry organization.  

### Version 2.0  
- [ ] AI-powered features like sentiment analysis and insights dashboard.  

---

## 🤝 **Contributing**  
If you'd like to contribute or share ideas, feel free to create a pull request or open an issue.

---

## 📬 **Feedback & Support**  
We'd love to hear your thoughts! Share feedback or reach out for support to make ThoughtFlow better for everyone.  

---

With ThoughtFlow, journaling becomes a journey of self-discovery and reflection. 🌟
