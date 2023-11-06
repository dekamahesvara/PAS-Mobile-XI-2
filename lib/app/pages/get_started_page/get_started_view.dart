import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              primary,
              secondary,
            ],
          ),
        ),
        child: Center(
          child: Container(
            height: height * 0.6,
            width: width * 0.9,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Let's Get Started",
                  style: heading,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SignInButton(height, "Facebook"),
                    SignInButton(height, "Twitter"),
                    SignInButton(height, "Google"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: textStyle1,
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Sign In",
                              style: textStyle2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: null,
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            width: double.infinity,
                            child: const Text("Create an Account",
                                textAlign: TextAlign.center)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container SignInButton(double height, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: null,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.025),
              width: double.infinity,
              child: Text(text, textAlign: TextAlign.center))),
    );
  }
}
