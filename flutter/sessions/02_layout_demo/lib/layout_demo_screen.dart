import 'package:flutter/material.dart';

class LayoutDemoScreen extends StatelessWidget {
  const LayoutDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Flutter layout demo',
              style: TextStyle(fontSize: 24, fontWeight: .w500),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Image.asset('assets/images/bg.png', fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Flutter layout demo',
                              style: TextStyle(fontSize: 16, fontWeight: .bold),
                            ),
                            Text(
                              'Flutter layout',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: .w400,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.deepOrange),
                            SizedBox(width: 4),
                            Text('41'),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          ActionItem(icon: Icons.call, txt: 'CALL'),
                          ActionItem(icon: Icons.arrow_outward, txt: 'ROUTE'),
                          ActionItem(icon: Icons.share, txt: 'SHARE'),
                        ],
                      ),
                    ),
                    Text(
                      'Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text TextTextTextTextTextTextTextTextTextTextTextTextTextText',
                      style: TextStyle(fontSize: 16, fontWeight: .w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  final IconData icon;
  final String txt;
  const ActionItem({super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.deepPurple, size: 25),
        SizedBox(height: 8),
        Text(txt, style: TextStyle(color: Colors.deepPurple, fontSize: 14)),
      ],
    );
  }
}
