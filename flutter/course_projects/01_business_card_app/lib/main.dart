import 'package:flutter/material.dart';

void main() {
  runApp(const BusinessCardApp());
}

class BusinessCardApp extends StatelessWidget {
  const BusinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const BusinessCardScreen(),
    );
  }
}

class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.main,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AvatarSection(),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Mohamed Hassan',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.white60,
              indent: 45,
              endIndent: 45,
              height: 0,
            ),
            InputSection(leadingIcon: Icons.phone, title: '0123456789'),
            InputSection(leadingIcon: Icons.mail, title: 'google@gmail.com'),
          ],
        ),
      ),
    );
  }
}

class AvatarSection extends StatelessWidget {
  const AvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 112,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 110,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(
          'assets/images/avatar_bussinesman_man_profile_icon.png',
        ),
      ),
    );
  }
}

class InputSection extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  const InputSection({required this.leadingIcon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: ListTile(
          leading: Icon(leadingIcon, color: AppColors.main),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

class AppColors {
  static const Color main = Color(0xff2BB4BB);
}
