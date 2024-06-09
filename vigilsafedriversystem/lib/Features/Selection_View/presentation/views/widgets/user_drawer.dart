import 'package:flutter/material.dart';
import 'package:vigilsafedriversystem/Features/Welcome/presentation/views/welcome_view.dart';

Widget userDrawer(
    BuildContext context, String firstName, String lastName, String phone) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/avatar_image.png'),
              ),
              const SizedBox(height: 5),
              Text(
                '${firstName.toString()} ${lastName.toString()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                phone,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.support),
          title: const Text('Support'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeView(),
                ));
          },
        )
      ],
    ),
  );
}
