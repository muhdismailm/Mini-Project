import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart'; // Add this import

main(){
  runApp(MyApp());
} 

class MyApp extends StatelessWidget{

    const MyApp({Key? key }) :super (key:key);

    @override
   Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255)
      ),
      home: HomeScreen(),
    );
   }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSignInSignUpButtons = false;
  bool hideWorkifyText = false;
  bool hideUserWorkerButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!hideWorkifyText)
                Text(
                  'WORKIFY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              SizedBox(height: 100),
              if (!hideUserWorkerButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showSignInSignUpButtons = !showSignInSignUpButtons;
                            hideWorkifyText = true;
                            hideUserWorkerButtons = true;
                          });
                        },
                        child: const Text(
                          'User',
                          style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            hideWorkifyText = true;
                            hideUserWorkerButtons = true;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen
                          );
                        },
                        child: const Text(
                          'Worker',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 78, 169, 253)),
                        ),
                      ),
                    ),
                  ],
                ),
              if (showSignInSignUpButtons) ...[
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 3, 3, 3)),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
