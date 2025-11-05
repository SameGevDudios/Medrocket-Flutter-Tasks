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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            // Image
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/photo.png'),
                ]
            ),

            const SizedBox(height: 26),

            // User data
            const UserText(
              icon: Icons.person_outline,
              mainText: 'Ирина',
            ),

            const SizedBox(height: 16),

            const UserText(
              icon: Icons.calendar_today_outlined,
              mainText: '22 мая (вт), 16:00',
              description: 'Дата получения документа',
            ),

            const SizedBox(height: 16),

            const UserText(
              icon: Icons.local_hospital_outlined,
              mainText: 'Клиника «Фомина»',
              description: 'Бульвар Перевринский, д. 4',
            ),

            const SizedBox(height: 16),

            const UserText(
              icon: Icons.medical_services_outlined,
              mainText: 'Стоматолог',
            ),

            const SizedBox(height: 24),

            // Info text
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2D9FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Expanded(
                    child: Text( infoText,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
            ),

            const Spacer(),

            // Buttons
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _documentAddCardOnPress,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Color.fromARGB(255, 26, 93, 208),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    ),
                    child: const Text('Добавить в медкарту',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _documentDeleteOnPress,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    backgroundColor: Color(0xECF1FBFF),
                    foregroundColor: Color.fromARGB(255, 26, 93, 208),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    ),
                    child: const Text('Удалить',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,)
                      )
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

void _documentAddCardOnPress() {
  
}

void _documentDeleteOnPress() {

}