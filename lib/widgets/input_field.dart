import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final TextInputType inputType;
  final bool obsecureText = false;
  final bool suffixIcon;

  const InputField(
      {super.key,
      required this.label,
      required this.inputType,
      required this.suffixIcon});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: widget.suffixIcon
          ? TextFormField(
              keyboardType: widget.inputType,
              obscureText: _obsecureText,
              obscuringCharacter: '*',
              style: Theme.of(context).textTheme.bodyMedium,
              cursorHeight: 24.0,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  labelText: widget.label,
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obsecureText = !_obsecureText;
                        });
                      },
                      icon: _obsecureText
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off))),
            )
          : TextFormField(
              keyboardType: widget.inputType,
              autofocus: true,
              style: Theme.of(context).textTheme.bodyMedium,
              cursorHeight: 24.0,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                labelText: widget.label,
                labelStyle: Theme.of(context).textTheme.labelLarge,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              )),
    );
  }
}
