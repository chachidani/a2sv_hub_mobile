import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color(0xFF2065D1), // #2065D1 blue
              Color(0xFFFFFFFF), // #FFFFFF white
            ],
            stops: [
              0.1,
              1
            ], // Blue takes 30% then gradually transitions to white
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo image
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/hub_logo2.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 30),
                  Image.asset(
                    'assets/images/hub_logo.png',
                    width: 200,
                    height: 170,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              // You can add any additional elements here
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2065D1)),
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
