import 'package:flutter/material.dart';

class RachaConta extends StatefulWidget {
  const RachaConta({super.key});

  @override
  State<RachaConta> createState() => _RachaContaState();
}

class _RachaContaState extends State<RachaConta> {
  double taxa = 0;
  double totalRacha = 0.0;
  var totalConta = TextEditingController();
  var qtdPessoas = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  calculaConta() {
    double tc = double.parse(totalConta.text);
    double qp = double.parse(qtdPessoas.text);
    setState(() {
      totalRacha = (tc + (taxa * (tc / 100))) / qp;
      getDialog(totalRacha);
    });
  }

  void getDialog(double totalRacha) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Total do Racha',
            style: TextStyle(fontSize: 40),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.money_off,
                size: 40,
              ),
              Text(
                '${totalRacha.toString()} R\$',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 134, 0),
        title: const Center(
          child: Text(
            'RACHA CONTA',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 60,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: totalConta,
                  decoration: const InputDecoration(
                    label: Text('Total da conta'),
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo obrigatório...";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    const Text(
                      'Taxa de Serviços: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: taxa,
                      min: 0,
                      max: 10,
                      label: 'Taxa $taxa% garçom',
                      divisions: 10,
                      activeColor: Colors.orangeAccent,
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          taxa = value;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: qtdPessoas,
                  decoration: const InputDecoration(
                    label: Text('Qtd Pessoas'),
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo obrigatório...";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        calculaConta;
                      }
                    },
                    child: const Text(
                      'Calcular',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  totalRacha.toString(),
                  style: const TextStyle(fontSize: 50),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
