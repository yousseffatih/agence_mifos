
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';

class ExpandableCard extends StatelessWidget {
  final String title;
  final bool open;
  final VoidCallback onTap;

  const ExpandableCard({
    Key? key,
    required this.title,
    required this.onTap, 
    required this.open,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(open ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
        onTap: onTap,
      ),
    );
  }
}