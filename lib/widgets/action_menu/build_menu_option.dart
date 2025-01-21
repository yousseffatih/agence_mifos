import 'package:flutter/material.dart';

class buildMenuOption extends StatelessWidget {
  final IconData icon;
  final String text; 
  final VoidCallback onTap;
  const buildMenuOption({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
    leading: Icon(icon, color: Colors.black),
    title: Text(text, style: TextStyle(color: Colors.black)),
    onTap: onTap,
  );
  }
}