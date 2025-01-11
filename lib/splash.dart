import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFAA79D6),
              Color(0xFFDAB5F7), // Top purple shade
              // Color(0xFFEACCFB), // Middle soft purple shade
              Color(0xFFEACCFB),
              Color(0xFFDAB5F7),
              Color(0xFFAA79D6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Container(
              height: 170,
              width: 170,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/brain.png"), fit: BoxFit.cover),
              ),
              child: null,
              
            ),
          const  Padding(
              padding: EdgeInsets.only(top: 10, bottom: 200),
              child: Text(
                "QUIZ",
                style: TextStyle(
                    color: Color(0xFF9C6FBE),
                    fontSize: 70,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
                // GoogleFonts.poppins(
                //   color: Color(0xFF9C6FBE),
                //   fontSize: 50,
                //   //height: 2,
                //   fontWeight: FontWeight.bold,
                //   letterSpacing: 2,
                // ),
              ),
            ),
          
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/counter");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C6FBE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                ),
                child: const Text(
                  "START",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
