import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste/projects/helpdesk/models/orders.dart';
import 'package:teste/projects/helpdesk/utils/app_colors.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Orders> listaChamados = [
    Orders(id: 1, description: 'Problema n', dataChamado: DateTime.now(), statusChamado: true),
    Orders(id: 2, description: 'Problema 2', dataChamado: DateTime.now(), statusChamado: false),
    Orders(id: 3, description: 'Problema 3', dataChamado: DateTime.now(), statusChamado: true),
    Orders(id: 4, description: 'Problema 4', dataChamado: DateTime.now(), statusChamado: false),
    Orders(id: 5, description: 'Problema 5', dataChamado: DateTime.now(), statusChamado: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: ListTile(
            title: Text(
              'HelpDesk',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 40, color: AppColors.textColorBlue, fontWeight: FontWeight.w600)),
            ),
            subtitle: Text(
              'Conte conosco, estamos aqui para ajudar',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: AppColors.textColorBlue,
                ),
              ),
            ),
            trailing: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
              child: IconButton(
                icon: const Icon(Icons.phone_callback_rounded),
                onPressed: () {
                  print('clicou');
                  exibirModal(context);
                },
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text(
                    'Filtre pelo Status do chamado',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColorBlue,
                    )),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        width: 124,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryColor,
                        ),
                        child: const Text(
                          'Finalizados',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        width: 124,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.buttonRed,
                        ),
                        child: const Text(
                          'Em Abertos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: listaChamados.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: buildOrder(listaChamados[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrder(Orders obj) {
    return Container(
      width: 340,
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 4,
            color: obj.statusChamado ? AppColors.primaryColor : AppColors.buttonRed,
          ),
        ),
        color: const Color(0xffF0f2f5),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        title: Text(
          obj.description,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textColorBlue,
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            obj.dataChamado.toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textDescriptionCard,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void exibirModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Novo chamado',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColorBlue,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Titulo do chamado',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintStyle: TextStyle(color: AppColors.textColorBlue),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Descricao do chamado',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintStyle: TextStyle(color: AppColors.textColorBlue),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: const Text(
                    'Salvar chamado',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
