import 'package:flutter/material.dart';

class ConversorTemperatura extends StatefulWidget {
  const ConversorTemperatura({super.key});

  @override
  State<ConversorTemperatura> createState() => _MyHomePage();
}

class _MyHomePage extends State<ConversorTemperatura> {
  var grausCel = TextEditingController();
  double grausFar = 0.0;

  void converteTemp() {
    var celcInt = double.parse(grausCel.value.text);
    setState(() {
      grausFar = (celcInt * (9 / 5)) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversor de temperatura',
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 80),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Conversor de Temperatura!",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Converta de Celsius para Fahrenhait",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: grausCel,
                  decoration: const InputDecoration(
                    label: Text('Temperatura em Celcius'),
                    labelStyle:
                        TextStyle(color: Colors.black, backgroundColor: Colors.white54, fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(grausFar.toString()),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: converteTemp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text(
                      'Converter',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        grausCel.text = '0';
                        grausFar = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text(
                      'Zerar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
