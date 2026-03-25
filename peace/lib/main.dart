```dart
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(HealthApp());
}

class HealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Health Chatbot",
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ChatScreen(),
    TipsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: "Tips"),
        ],
      ),
    );
  }
}

//////////////////// HOME SCREEN ////////////////////

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Health App")),
      body: Center(
        child: Text(
          "Welcome 👋\n\nUse the chatbot to ask basic health questions.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

//////////////////// CHAT SCREEN ////////////////////

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> messages = [];

  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);

        _speech.listen(onResult: (val) {
          setState(() {
            _controller.text = val.recognizedWords;
          });
        });
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void sendMessage() {
    String userMsg = _controller.text.trim();
    if (userMsg.isEmpty) return;

    setState(() {
      messages.add("You: $userMsg");
      messages.add("Bot: ${getResponse(userMsg)}");
      _controller.clear();
    });
  }

  String getResponse(String input) {
    input = input.toLowerCase();

    if (input.contains("fever")) {
      return "You may have an infection. Drink fluids and rest.";
    } else if (input.contains("headache")) {
      return "Try resting, drinking water, and avoiding stress.";
    } else if (input.contains("stomach")) {
      return "Eat light food and avoid spicy meals.";
    } else if (input.contains("hello") || input.contains("hi")) {
      return "Hi 👋 How can I help with your health today?";
    } else {
      return "I'm a simple health bot. Please consult a doctor for serious issues.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Health Chatbot")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages
                  .map((msg) => ListTile(title: Text(msg)))
                  .toList(),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
                onPressed: _listen,
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Ask something...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//////////////////// TIPS SCREEN ////////////////////

class TipsScreen extends StatelessWidget {
  final List<String> tips = [
    "Drink at least 2 liters of water daily 💧",
    "Exercise 3-5 times a week 🏃",
    "Sleep 7-8 hours every night 😴",
    "Eat a balanced diet 🥗",
    "Reduce stress and relax 🧘",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Health Tips")),
      body: ListView(
        children: tips
            .map((tip) => ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text(tip),
                ))
            .toList(),
      ),
    );
  }
}
```
