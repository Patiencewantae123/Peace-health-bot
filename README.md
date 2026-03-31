# 🏥 Amani Health AI – Flutter Chatbot App

Amani Health AI is a **bilingual (English 🇬🇧 / Korean 🇰🇷) AI-powered health assistant** built using Flutter.
It provides **basic health guidance, voice interaction, and localized support for South Korea users**.

---
![Uploading Screenshot 2026-03-25 120624.png…]()



## 🌟 Features

### 🤖 AI Health Chatbot

* Interactive chatbot that asks patients about symptoms
* Provides basic health advice
* Simulates doctor-like conversation

### 🎤 Speech Recognition

* Users can **speak instead of typing**
* Supports:

  * English (`en-US`)
  * Korean (`ko-KR`)

### 🔊 Text-to-Speech (TTS)

* Bot responds with **voice output**
* Natural accent:

  * English voice
  * Korean voice

### 🌍 Language Toggle

* Switch between:

  * English 🇬🇧
  * Korean 🇰🇷
* Fully localized chatbot responses

### 📰 Health News (South Korea)

* Displays health-related news with images
* Focus on Korean health trends and updates

### 🎨 Modern UI/UX

* Clean chat bubbles (WhatsApp-style)
* Smooth gradients and cards
* Responsive layout

---

## 📱 Screenshots

> Add screenshots here after running the app
> (Home | Chat | News)

---

## 🛠️ Tech Stack

* **Flutter (Dart)**
* Speech Recognition: `speech_to_text`
* Text-to-Speech: `flutter_tts`
* UI: Material Design

---

## 📦 Installation

### 1. Clone the repository

```bash
git clone https://github.com/your-username/amani-health-ai.git
cd amani-health-ai
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Add required packages (if not installed)

```bash
flutter pub add speech_to_text
flutter pub add flutter_tts
```

---

## ⚙️ Android Setup

Open:

```
android/app/src/main/AndroidManifest.xml
```

Add permission:

```xml
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
```

---

## 🚀 Run the App

```bash
flutter run
```

---

## 🧠 How It Works

1. The chatbot **initiates conversation**
2. User:

   * Types OR speaks symptoms
3. App:

   * Processes input
   * Generates response
   * Speaks reply aloud
4. Language toggle switches:

   * Input recognition
   * Voice output
   * Chat responses

---

## 🌍 Target Users

* South Korean users 🇰🇷
* English-speaking foreigners in Korea
* Students and researchers in health tech
* Beginner AI + Flutter developers

---

## ⚠️ Disclaimer

This app provides **basic health suggestions only**
👉 It is **NOT a replacement for professional medical advice**

---

## 🚀 Future Improvements

* 🤖 Real AI integration (OpenAI API)
* ☁️ Firebase (store chat history & patient data)
* 🧠 Mental health detection (crisis alerts)
* 🏥 Hospital/clinic locator in South Korea
* 📊 Health analytics dashboard

---

## 👨‍💻 Author

**Leo**
Flutter Developer | Researcher | AI Enthusiast

---

## ⭐ Contribute

Contributions are welcome!
Feel free to fork the repo and submit a pull request.

---

## 📄 License

This project is licensed under the MIT License.

```
```

---

