import 'package:flutter/material.dart';
import 'package:teste/projects/helpdesk/pages/register_page.dart';
import 'package:teste/projects/helpdesk/utils/app_colors.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('HelpDesk com Firebase', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (bc) => const RegisterPage(),
              ),
            );
          },
          child: const Text('Clique aqui para iniciar'),
        ),
      ),
    );
  }
}
