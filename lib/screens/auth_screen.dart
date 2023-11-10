import "package:flutter/material.dart";

import "../widgets/auth/auth_buttons.dart";

class AuthScreen extends StatelessWidget {
  static const routeName = "/auth";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   margin: const EdgeInsets.only(top: 60),
          //   width: double.infinity,
          //   child: Text(
          //     "Welcome!",
          //     textAlign: TextAlign.center,
          //     style: Theme.of(context).textTheme.displayLarge,
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 250),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "Welcome to Stock+",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 30),
                ),
              ],
            ),
          ),
          const AuthButtons(),
        ],
      ),
    );
  }
}
