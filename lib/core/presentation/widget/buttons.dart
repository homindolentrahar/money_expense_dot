import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final VoidCallback onPressed;

  const AppPrimaryButton({
    super.key,
    required this.title,
    this.isEnabled = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      minWidth: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      disabledColor: Theme.of(context).colorScheme.outline,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
