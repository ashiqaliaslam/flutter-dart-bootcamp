import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/aali.png"),
              ),
              const Text(
                "Ashique Ali",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Anton",
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'SourceSans3',
                  color: Colors.teal.shade100,
                  fontSize: 20,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                elevation: 5,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      leading: const Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '+92 300 3226126',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'SourceSans3',
                          fontSize: 20,
                        ),
                      ),
                    )),
              ),
              Card(
                elevation: 5,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      leading: const Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'ashiqemadina@yahoo.com',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'SourceSans3',
                          fontSize: 20,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
