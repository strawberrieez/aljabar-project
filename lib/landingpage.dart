import 'package:aljabar_project/homepage.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFCD5C08),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3),
                  child: const Text(
                    'Dari sarapan sampai makan malam, kita punya ide menunya buat kamu!',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFCD5C08),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF347928),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "yuk mulai",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
