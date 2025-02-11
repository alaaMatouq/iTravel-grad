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
  void _skipToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _goToNextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => welcomeScreen3()), // Replace with the actual next screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Positioned(
            top: 200,
            child: Image.asset(
              'assets/images/welcomePhone1.png',
              width: 400,
            ),
          ),
          Positioned(
            top: 60,
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
          Positioned(
            top: 175,
            left: 30,
            right: 30,
            child: Center(
              child: Text(
                "iTravel helps you explore destinations,\n"
                    "create itineraries, and enjoy a seamless\n"
                    "travel experience tailored to your needs.",
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF083A40),
                ),
              ),
            ),
          ),

          // Skip Button (Top-Right)
          Positioned(
            bottom: 37, // Positions the button correctly
            right: 100,

            child: GestureDetector(

              onTap: () => _skipToSignUp(context),

              child: Text(
                "skip",style: TextStyle(
                fontSize: 26,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w900,
                color: Color(0xFFF5F5F5),

              ),
              ),
            ),
          ),


          Positioned(
            bottom: 30, // Positions the button correctly
            left: 100,
            child: GestureDetector(
              onTap: () => _goToNextScreen(context),
              child: Container(
                width: 120,
                height: 44,
                alignment: Alignment.center, // Centers the text inside the container
                decoration: BoxDecoration(
                  color: Color(0xFF083A40),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFF5F5F5),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

// Dummy SignUpScreen (Replace this with your actual sign-up page)
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Sign Up Screen",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

// Dummy AnotherScreen (Replace this with the actual next welcome screen)

class welcomeScreen3 extends StatelessWidget {
  void _skipToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _goToNextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen4()), // Replace with actual next screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 500, // Adjust height to match design
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome3.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // White Card Container Positioned Over the Image
          Positioned(
            top: 400, // Adjust to overlap the image
            left: 20,
            right: 20,
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(30), // Softer shadow
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Centers the text
                  mainAxisAlignment: MainAxisAlignment.center, // Centers everything vertically
                  children: [
                    // Title
                    Text(
                      "Tell us your travel goals",
                      textAlign: TextAlign.center, // Center aligns the text
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF083A40),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Subtitle Text
                    Text(
                      "We’ll recommend the best places just for you! Whether it’s adventure, relaxation, or business, we’ve got you covered.",
                      textAlign: TextAlign.center, // Center aligns the text
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 30),

                    // Buttons Row (Next & Skip) aligned properly

                    Positioned(
                      bottom: 80, // Aligns buttons at the bottom
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centers both buttons
                        children: [
                          // Next Button
                          GestureDetector(
                            onTap: () => _goToNextScreen(context),
                            child: Container(
                              width: 120,
                              height: 44,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF083A40),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFF5F5F5),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 20), // Space between buttons

                          // Skip Button
                          GestureDetector(
                            onTap: () => _skipToSignUp(context),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF083A40), // Adjusted to dark color for better contrast
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//welcome screen 4


class WelcomeScreen4 extends StatelessWidget {
  void _skipToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _goToNextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen5()), // Replace with actual next screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome44.png'), // Ensure correct path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // White Card Container Positioned Over the Image
          Positioned(
            bottom: 80, // Adjust to overlap the image
            left: 20,
            right: 20,
            child: Container(
              height: 300, // Adjust height for better spacing
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(30), // Softer shadow
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center, // Centers content
                  children: [
                    // Title
                    Text(
                      "Stay organized with\nour integrated tools",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF083A40),
                      ),
                    ),
                    // Subtitle Text
                    SizedBox(height: 10),
                    Text(
                      "Budget tracker, translator, currency converter, weather updates  and more. Everything you need, all in one place!",
                      textAlign: TextAlign.center, // Center aligns the text
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),



                    SizedBox(height: 20),

                    // Buttons Row (Next & Skip)
                    Positioned(
                      bottom: 80, // Aligns buttons at the bottom
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centers both buttons
                        children: [
                          // Next Button
                          GestureDetector(
                            onTap: () => _goToNextScreen(context),
                            child: Container(
                              width: 120,
                              height: 44,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF083A40),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFF5F5F5),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 20), // Space between buttons

                          // Skip Button
                          GestureDetector(
                            onTap: () => _skipToSignUp(context),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF083A40), // Adjusted to dark color for better contrast
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//welcome screen5

class WelcomeScreen5 extends StatelessWidget {
  void _navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: -200,
            left: 0,
            right: 0,
            bottom: 0,

            child: Container(
              width: double.infinity,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome5.png'), // Ensure correct path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // White Card Container Positioned Over the Image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(30), // Soft shadow effect
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                  children: [
                    // Title
                    Text(
                      "Your journey\nbegins now!",
                      textAlign: TextAlign.left, // Ensures text aligns left
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF083A40),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Subtitle Text
                    Text(
                      "Discover, plan, and explore with iTravel.\nLet's create unforgettable memories together.",
                      textAlign: TextAlign.left, // Aligns text to the left
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 25),

                    // Start Button
                    Align(
                      alignment: Alignment.centerRight, // Aligns the button to the left
                      child: ElevatedButton(
                        onPressed: () => _navigateToSignUp(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF083A40),
                          fixedSize: Size(120, 44), // Width: 120, Height: 44
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Start",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
