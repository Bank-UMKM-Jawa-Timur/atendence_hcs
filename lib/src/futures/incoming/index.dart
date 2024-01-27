import 'package:atendence_hcs/utils/components/colors.dart';
import 'package:atendence_hcs/utils/components/space.dart';
import 'package:flutter/material.dart';

class IncomingPage extends StatelessWidget {
  const IncomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Image(
                image: AssetImage('assets/icon/comming_soon.png'),
              ),
            ),
            spaceHeight(10),
            const Text(
              "Comming Soon!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: cPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
