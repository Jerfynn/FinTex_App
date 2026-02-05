import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> users = [
    "Jerfin",
    "Subin",
    "Abhi",
    "Alice",
    "Bob",
    "Charlie"
  ];

  final Map<String, List<String>> chats = {
    "Jerfin": ["Hi Jerfin!", "How are you?"],
    "Subin": ["Hey Subin!", "Long time no see."],
    "Abhi": ["Hello Abhi!", "What's up?"],
    "Alice": ["Hi Alice!"],
    "Bob": ["Hey Bob!"],
    "Charlie": ["Hi Charlie!"],
  };

  String selectedUser = "Jerfin";
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // ------------------- Column 1: Users -------------------
          Container(
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: selectedUser == users[index]
                            ? Colors.deepPurple[100]
                            : Colors.white,
                        child: ListTile(
                          title: Text(users[index]),
                          onTap: () {
                            setState(() {
                              selectedUser = users[index];
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // ------------------- Column 2: Chat Messages -------------------
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xfff0f4ff), Color(0xffffffff)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  // Top bar with chat name
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff6a11cb), Color(0xff2575fc)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.chat_bubble_outline, color: Colors.white),
                        const SizedBox(width: 12),
                        Text(
                          selectedUser,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  // Messages List
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: chats[selectedUser]?.length ?? 0,
                      itemBuilder: (context, index) {
                        bool isSentByMe = index % 2 != 0;
                        return Align(
                          alignment: isSentByMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              gradient: isSentByMe
                                  ? const LinearGradient(
                                      colors: [
                                        Color(0xff6a11cb),
                                        Color(0xff2575fc)
                                      ],
                                    )
                                  : const LinearGradient(
                                      colors: [
                                        Color(0xffe0e0e0),
                                        Color(0xfff0f0f0)
                                      ],
                                    ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                )
                              ],
                            ),
                            child: Text(
                              chats[selectedUser]![index],
                              style: TextStyle(
                                  color: isSentByMe ? Colors.white : Colors.black87),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Input Box
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              hintText: "Type a message...",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide.none),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            if (_messageController.text.isEmpty) return;
                            setState(() {
                              chats[selectedUser]!
                                  .add(_messageController.text);
                              _messageController.clear();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0xff6a11cb), Color(0xff2575fc)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: const Icon(Icons.send, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          // ------------------- Column 3: Chat Info -------------------
          Container(
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Chat Info",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text("User: $selectedUser"),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("More actions coming soon!")),
                          );
                        },
                        child: const Text("Action"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
