import 'package:flutter/material.dart';

void main() {
  runApp(const ContactCardApp());
}

class ContactCardApp extends StatelessWidget {
  const ContactCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContactCard(
        fullName: "Петр Иванов",
        email: "hello@mail.ru",
        phoneNumber: "+7 999 123 45 67",
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String fullName;
  final String email;
  final String phoneNumber;

  const ContactCard({
    super.key,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 59, 135, 235)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 36),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Pfp column
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 133, 180, 243),
                        ),
                        child: const FittedBox(
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Info box
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                    color: Color.fromARGB(255, 246, 246, 246),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoItem(icon: Icons.mail_rounded, text: email),
                        const SizedBox(height: 12),
                        InfoItem(icon: Icons.phone, text: phoneNumber),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => print("A contact button has been pressed."),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 59, 135, 235),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "Свяжитесь со мной",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 12),
        Expanded(child: Text(text, 
            style: TextStyle(
              fontSize: 16,
              )
            )
          ),
      ],
    );
  }
}
