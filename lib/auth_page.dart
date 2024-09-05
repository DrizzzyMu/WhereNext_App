import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  void toggleFormType() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhereNext?',
          style: TextStyle(
            color: Colors.blue[800], // Marine blue color for app name
            fontFamily: 'Chivo',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue[800]), // Marine blue icon color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isLogin ? 'Welcome back' : 'Create an account',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Chivo',
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              isLogin
                  ? "Please sign in to continue."
                  : "Let's get started by filling out the form below.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                fontFamily: 'Chivo',
              ),
            ),
            SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            if (!isLogin) ...[
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
            ],
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Handle login/signup action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800], // Marine blue button color
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  isLogin ? 'Sign In' : 'Create Account',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Chivo',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: toggleFormType,
              child: Center(
                child: Text(
                  isLogin
                      ? "Don't have an account? Sign Up here"
                      : 'Already have an account? Sign In here',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue[800], // Marine blue link color
                    fontFamily: 'Chivo',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
