import 'package:flutter/material.dart';

class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: AppColors.main,
          child: Column(
            mainAxisAlignment: .center,
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
      ),
    );
  }
}

class AvatarSection extends StatelessWidget {
  const AvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 112,
      backgroundColor: Colors.white,
      child: const CircleAvatar(
        radius: 110,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(
          'lib/1_business_card_app/image/avatar_bussinesman_man_profile_icon.png',
        ),
      ),
    );
  }
}

class InputSection extends StatelessWidget {
  String title;
  IconData leadingIcon;
  InputSection({required this.leadingIcon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
