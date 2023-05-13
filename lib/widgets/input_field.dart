import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InputField extends StatefulWidget {
  final String label;
  final bool suffixIcon;
  final TextEditingController controller;
  final TextInputType? inputType;
  final int maxLines;

  const InputField(
      {super.key,
      required this.label,
      this.suffixIcon = false,
      required this.controller,
      this.inputType = TextInputType.name,
      this.maxLines = 1});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return widget.suffixIcon
        ? FormBuilderTextField(
            name: widget.label,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            keyboardType: widget.inputType,
            obscureText: _obsecureText,
            obscuringCharacter: '*',
            controller: widget.controller,
            style: Theme.of(context).textTheme.bodyMedium,
            cursorHeight: 24.0,
            decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                labelText: widget.label,
                labelStyle: Theme.of(context).textTheme.labelLarge,
                alignLabelWithHint: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                    )),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                helperStyle: Theme.of(context).textTheme.labelSmall,
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
        : FormBuilderTextField(
            name: widget.label,
            controller: widget.controller,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            maxLines: widget.maxLines,
            keyboardType: widget.inputType,
            style: Theme.of(context).textTheme.bodyMedium,
            cursorHeight: 24.0,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                  )),
              fillColor: Theme.of(context).colorScheme.primaryContainer,
              labelText: widget.label,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              helperStyle: Theme.of(context).textTheme.labelSmall,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ));
  }
}
