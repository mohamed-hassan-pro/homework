import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'Features',
          style: TextStyle(
            fontSize: 22,
            fontWeight: .w800,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        FeatureCard(
          icon: Icons.speed,
          iconColor: Color(0xff624E7F),
          iconBgColor: Color(0xffEFECF7),
          title: 'Fast Performance',
          subtitle: 'Lightning fast app performance',
        ),
        FeatureCard(
          icon: Icons.security,
          iconColor: Color(0xff2A93DE),
          iconBgColor: Color(0xffEBF4FD),
          title: 'Secure',
          subtitle: 'Your data is safe with us',
        ),
        FeatureCard(
          icon: Icons.palette,
          iconColor: Color(0xffF79B0D),
          iconBgColor: Color(0xffFFF3E9),
          title: 'Beautiful UI',
          subtitle: 'Modern and clean design',
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 3,
        color: const Color(0xffffffff),
        child: ListTile(
          leading: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: iconBgColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(icon, color: iconColor),
            ),
          ),

          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: .bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(color: Colors.black38, fontSize: 13),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black38,
            size: 16,
          ),
        ),
      ),
    );
  }
}
