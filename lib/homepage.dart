import 'package:flutter/material.dart';
import 'auth_page.dart'; // Import the auth_page.dart
import 'planTrip.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.blue[800]),  // Marine blue color for the hamburger menu
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          'WhereNext?',
          style: TextStyle(
            fontFamily: 'Chivo',
            fontSize: 24.0,
            color: Colors.blue[800],  // Marine blue color
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.help_outline,
              color: Colors.blue[800],  // Marine blue color
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[800],  // Marine blue color
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontFamily: 'Chivo',
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login, color: Colors.blue[800]),
              title: Text(
                'Login/Signup',
                style: TextStyle(
                  fontFamily: 'Chivo',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Navigate to AuthPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share, color: Colors.blue[800]),
              title: Text(
                'Share',
                style: TextStyle(
                  fontFamily: 'Chivo',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Handle share functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.blue[800]),
              title: Text(
                'Exit',
                style: TextStyle(
                  fontFamily: 'Chivo',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Handle app exit
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu Items
            MenuButton(
              icon: Icons.airplanemode_active,
              label: 'Plan Your Trip',
              onTap: () {
                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlanYourTripPage()),
    );// Navigate to the corresponding page
              },
            ),
            MenuButton(
              icon: Icons.star,
              label: 'Popular Activities Near You',
              onTap: () {
                // Navigate to the corresponding page
              },
            ),
            MenuButton(
              icon: Icons.calendar_today,
              label: 'Planned Trips',
              onTap: () {
                // Navigate to the corresponding page
              },
            ),
            Spacer(),
            // Bottom Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/homepage.jpg',
                width: double.infinity,
                height: 350.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const MenuButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blue[800],  // Marine blue color for the icons
              ),
              SizedBox(width: 16.0),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Chivo',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue[800],  // Marine blue color for the arrow icon
              ),
            ],
          ),
        ),
      ),
    );
  }
}
