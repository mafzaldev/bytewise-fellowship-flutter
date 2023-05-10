import 'package:flutter/material.dart';
import 'package:mvvm_with_restapi/res/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;

  const RoundedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: AppColors.whiteColor,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
