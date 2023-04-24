import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  const RoundedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
