# 📖 AI Fortune Teller - MVP Product Requirements Document (PRD)

## 🚀 Overview

**AI Fortune Teller** is a mobile entertainment application targeting female iOS users aged 18–35. It leverages advanced LLM (Large Language Model) technology to deliver personalized fortune-telling experiences. Development will be done using Xcode 16.4.

## 🎯 Goals & Objectives

- Provide an immersive, interactive fortune-telling experience.
- Implement a sustainable revenue model (Token-based payment).
- Ensure rapid MVP deployment with essential features.
- Maintain a balance between rich user experience and manageable development scope.

## 📱 Core Features & Detailed Requirements

### 🔮 1. Fortune Teller Main View (Interactive Chat)

- Full-screen realistic background image of selected fortune teller.
- Real-time chat input box at the bottom.
- Chat bubbles styled to resemble social media live-stream interactions.
- Token indicator showing available tokens and the token cost of current input.
- Loading indicator during API calls.
- Friendly error handling (alert messages for network/API errors).

### 📜 2. Fortune Teller List View

- Scrollable list of fortune tellers.
- Each item includes:
  - Thumbnail image
  - Name
  - Specializations (max 3)
  - Lock/unlock status
  - Price to unlock (IAP)
- Detail View on tap:
  - Full-screen image
  - Detailed biography (age, gender, backstory)
  - Unlock button with IAP integration.

### 💎 3. Shop View (Token Purchase)

- Clearly displayed token packages:
  - 100 Tokens (\$0.99)
  - 500 Tokens (\$3.99)
  - 1000 Tokens (\$6.99)
- Integration with Apple In-App Purchases (IAP).

### ⚙️ 4. Settings View

- App language selection (Localization)
- Audio volume control
- User profile management (Name, basic personal information)
- App version, Last updated info
- Basic in-app feedback system (user ratings/comments)

### 📚 5. Onboarding View

- New user tutorial (3–4 swipable screens)
- Explains token system, fortune teller selection, and core interactions.
- "Start Fortune Telling" button directs to main view.

### 🔑 6. User Authentication (Sign in with Apple)

- Allows users to save progress, purchases, and user data.
- Simple login and logout functionality integrated with Apple's native solution.

### 💬 7. Chat History Persistence

- Stores and loads previous conversation history.
- Uses SwiftData for local storage.

## 📂 Project Structure

```
FortuneTeller
├── Extensions
│   └── Extensions.swift (Reusable Swift extensions)
├── Images
│   ├── tellers
│   ├── icons
│   ├── onboarding
│   └── backgrounds
├── Managers
│   ├── DataManager.swift (Data storage & retrieval)
│   ├── IAPManager.swift (In-App Purchases handling)
│   ├── OpenAIManager.swift (LLM API interaction)
│   └── AuthManager.swift (User authentication)
├── Models
│   ├── FortuneTeller.swift (Character data)
│   ├── Fortune.swift (Fortune-telling result structure)
│   ├── UserData.swift (User details and tokens)
│   └── Message.swift (Chat message structure)
├── ViewModels
│   ├── FortuneTellerViewModel.swift (Handles fortune teller interaction)
│   ├── ShopViewModel.swift (Handles token purchase logic)
│   ├── SettingsViewModel.swift (Manages settings data)
│   └── AuthViewModel.swift (Manages authentication state)
├── Views
│   ├── Main
│   │   └── FortuneTellerMainView.swift
│   ├── TellerList
│   │   ├── FortuneTellerListView.swift
│   │   └── FortuneTellerDetailView.swift
│   ├── Shop
│   │   ├── ShopView.swift
│   │   └── PurchaseTokenView.swift
│   ├── Settings
│   │   └── SettingsView.swift
│   ├── Onboarding
│   │   └── OnboardingView.swift
│   ├── Auth
│   │   └── LoginView.swift
│   └── Components
│       ├── ChatBubbleView.swift
│       └── TokenIndicatorView.swift
├── Localization
│   └── Localizable.strings
└── Assets
```

## 📌 File Responsibilities (Key Files Explained)

- **DataManager.swift**: Manages local data storage (SwiftData).
- **IAPManager.swift**: Integrates and manages Apple's In-App Purchase.
- **OpenAIManager.swift**: Centralized OpenAI API interactions and prompts.
- **AuthManager.swift**: Handles user authentication (Sign in with Apple).
- **FortuneTellerViewModel.swift**: Manages main fortune-telling interactions and chat logic.
- **ShopViewModel.swift**: Logic for displaying available token packages and handling purchases.
- **SettingsViewModel.swift**: Manages app settings data.
- **AuthViewModel.swift**: User authentication state management and logic.
- **OnboardingView\.swift**: Initial tutorial for first-time users.
- **LoginView\.swift**: Sign-in interface for Apple authentication.

## 📈 Monetization Strategy

- **Token-based Model**:
  - Charge users based on token usage (direct correlation with user input length).
  - Ensure sustainable revenue to cover LLM API costs.

## 🚦 Development Prioritization

1. Main interaction & Token system
2. Conversation history persistence
3. Fortune teller list & IAP unlocking
4. Token purchase system
5. Authentication (Sign in with Apple)
6. Onboarding tutorial
7. Settings page
8. User experience improvements (loading indicators, error handling, feedback)

