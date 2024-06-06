import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:teste/projects/helpdesk/models/users.dart';
import 'package:teste/projects/helpdesk/utils/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String msgErro = '';

  void cadastrarUser(Users user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(email: user.email, password: user.senha).then((firebaseUser) {
      const SnackBar snackBar = SnackBar(
        content: Text('Cadastro efetuado com sucesso!'),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).catchError((err) {
      debugPrint(err);
    });
  }

  void validarCampos() {
    String nome = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains('@')) {
        if (password.length > 6) {
          Users user = Users();
          user.nome = nome;
          user.email = email;
          user.senha = password;
          cadastrarUser(user);
        } else {
          msgErro = 'Senha precisa ter mais de 6 dígitos';
        }
      } else {
        msgErro = 'O campo e-mail deve ser preenchido.';
      }
    } else {
      msgErro = 'O campo nome deve ser preenchido.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Cadastro',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lottieAnimation(),
              Text(
                'Cadastro',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 40,
                    color: AppColors.textColorBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'Crie sua conta agora mesmo',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 21,
                    color: AppColors.textColorBlue,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                color: AppColors.primaryOpacityColor,
                height: 50,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Nome:',
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person, color: AppColors.primaryColor),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                color: AppColors.primaryOpacityColor,
                height: 50,
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'email:',
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email, color: AppColors.primaryColor),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                color: AppColors.primaryOpacityColor,
                height: 50,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Senha:',
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock, color: AppColors.primaryColor),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: ElevatedButton(
                  onPressed: validarCampos,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonRed,
                  ),
                  child: const Text(
                    'Voltar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lottieAnimation() {
    return Container(
      margin: const EdgeInsets.only(top: 1, bottom: 10),
      child: Lottie.asset(
        'assets/animations/animation-us.json',
        width: 250,
        height: 250,
        fit: BoxFit.fill,
      ),
    );
  }
}
