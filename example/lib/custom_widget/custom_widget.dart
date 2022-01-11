import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  // by this widget you can see the result of the current platform type (at String & IconData values).
  const CustomWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
      avatar: Icon(icon, color: Theme.of(context).primaryColor),
      padding: const EdgeInsets.all(16.0),
      label: Text(
        text,
        style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
      ),
    );
  }
}
