import 'package:flutter/material.dart';

class Component {
  GestureDetector button(
      {required String text,
      VoidCallback? onTap,
      IconData? icon,
      bool whiteColor = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: whiteColor ? Colors.white : Colors.blue,
          borderRadius: BorderRadius.circular(4),
          border: whiteColor ? Border.all(color: Colors.grey) : null,
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: (icon == null) ? 0 : 3,
          children: [
            (icon == null)
                ? const SizedBox()
                : Icon(
                    icon,
                    color: Colors.white,
                    size: 18,
                  ),
            Text(
              text,
              style: TextStyle(
                color: whiteColor ? Colors.grey[500] : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
