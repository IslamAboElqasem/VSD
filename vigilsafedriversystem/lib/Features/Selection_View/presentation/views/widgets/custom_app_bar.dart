import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          logo,
          height: 80,
        ),
      ],
    );
  }
}
