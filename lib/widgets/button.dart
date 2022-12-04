import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Function() onPress;
  const ButtonWidget({super.key, required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            minimumSize: const Size(double.infinity, 60.0)),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
