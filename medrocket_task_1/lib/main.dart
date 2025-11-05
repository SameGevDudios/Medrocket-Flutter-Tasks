import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Документ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NewDocumentPage(),
    );
  }
}

class NewDocumentPage extends StatelessWidget {

  final String infoText = 'Клиника прислала документ после приёма. Чтобы добавить его в медкарту и посмотреть содержание, нужно будет указать дату рождения пациента. Это проверка для безопасности данных.';

  const NewDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Новый документ'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
class UserText extends StatelessWidget {
  
  final IconData icon;
  final String mainText;
  final String? description;

  const UserText({super.key, required this.icon, required this.mainText, this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (description != null) ...[
                const SizedBox(height: 4),
                Text(
                  description!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
