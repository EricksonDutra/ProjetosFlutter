import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teste/projects/conversor_temperatura.dart';
import 'package:teste/projects/racha_conta.dart';
import 'package:teste/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              lottieAnimation(),
              const Text(
                "Acesse as aplicações pelo menu lateral",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        // child: ListView(
        //   children: [
        //     ListTile(
        //       title: const Text('Racha conta'),
        //       onTap: () => Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (bc) => const RachaConta(),
        //         ),
        //       ),
        //     ),
        //     ListTile(
        //       title: const Text('Conversor de temperatura'),
        //       onTap: () => Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (bc) => const ConversorTemperatura(),
        //         ),
        //       ),
        //     ),
        // ],
        // ),
      ),
      drawer: drawerWidget(context),
    );
  }

  Widget lottieAnimation() {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 10, left: 10, right: 10),
      child: Lottie.asset(
        'assets/animations/arrow-animation.json',
        width: 200,
        height: 200,
        fit: BoxFit.fill,
      ),
    );
  }
}
