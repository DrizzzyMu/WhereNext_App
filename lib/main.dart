import 'package:flutter/material.dart';
import 'homepage.dart';  // Import the homepage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhereNext?',
      theme: ThemeData(
        fontFamily: 'Chivo',  // Set the default font to Chivo
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Chivo',
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/background_image.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Name as Logo
              Text(
                'WhereNext?',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40.0), // Add space between logo and the container

              // Circular Container with Logo
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.8),
                ),
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.question_mark, // Placeholder for your logo image
                  size: 50.0,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20.0), // Space between logo and text container

              // Text and Button Container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.blue[800], // Marine blue color
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome to WhereNext?',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 122, 233, 248),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'At WhereNext?, we believe that every journey should be as enjoyable as the destination itself. Our mission is to make travel planning seamless, stress-free, and tailored to your unique preferences.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the homepage when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        foregroundColor: Colors.blue[800], // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                      ),
                      child: Text('Let\'s Go'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
