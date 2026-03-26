import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Health App")),
      body: Center(
        child: Text(
          "Welcome 👋\n\nUse the chatbot to ask basic health questions.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> messages = [];

  void sendMessage() {
    String userMsg = _controller.text.trim();
    if (userMsg.isEmpty) return;

    setState(() {
      messages.add("You: $userMsg");
      messages.add("Bot: Hello! I received your message.");
      _controller.clear();
    });
  }

  void fakeMic() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("🎤 Voice coming soon")),
    );
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
                icon: Icon(Icons.mic),
                onPressed: fakeMic,
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

class TipsScreen extends StatelessWidget {
  final List<String> tips = [
    "Drink water 💧",
    "Exercise 🏃",
    "Sleep 😴",
    "Eat healthy 🥗",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Health Tips")),
      body: ListView(
        children: tips
            .map((tip) => ListTile(title: Text(tip)))
            .toList(),
      ),
    );
  }
}