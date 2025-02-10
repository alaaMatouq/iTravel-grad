import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -10, // Moves the image up slightly
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/welcome1.png',
              width: double.infinity, // Stretches the image across the screen width
              fit: BoxFit.cover, // Ensures proper scaling
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 412,
              height: 330,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30, // Moves the text horizontally
                    top: 20, // Moves text within the container
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/iTravelLogo.png',
                            width: 40, height: 40),
                        Text(
                          "Travel",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato',
                            color: Color(0xFF083A40),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top:80,
                    left: 40,
                    child: Text("Your World,\nYour Way\nExplore with\niTravel.",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w900,
                        color:  Color(0xFF083A40),
                      ),),
                  ),
                  Positioned(
                    bottom: 30, // Positions the button correctly
                    right: 40,

                    child: GestureDetector(
                      onTap: _navigateToNextScreen,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Color(0xFF083A40),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body:Stack(
        children: [
          // Background Image
          Positioned(
            top: 200,
            child: Image.asset(
              'assets/images/welcomePhone1.png',
              width: 400,
            ),
          ),

          // Title Text
          Positioned(
            top: 60, // Keeps the vertical position
            left: 20,
            right: 20,
            child: Center(
              child: Text(
                "Plan your perfect\njourney with ease!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF083A40),
                ),
              ),
            ),
          ),

          // Subtitle Text (Aligned with Title)
          Positioned(
            top: 175, // Moves it closer to the title
            left: 30,
            right: 30,
            child: Center(
              child: Text(
                "iTravel helps you explore destinations,\n"
                    "create itineraries, and enjoy a seamless\n"
                    "travel experience tailored to your needs.",
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 3, // Prevents overflow issues
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF083A40),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
