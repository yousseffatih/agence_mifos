import 'package:flutter/material.dart';

void showCustomMenu(BuildContext context , double maxHeight, List<Widget> listOptions) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allow the bottom sheet to expand if needed
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        constraints: BoxConstraints(
          maxHeight: maxHeight, // Limit height of the screen
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: listOptions,
          ),
        ),
      );
    },
  );
}