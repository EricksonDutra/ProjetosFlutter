import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:teste/projects/helpdesk/utils/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void efetuaLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
        .then((firebaseUser) {
      const SnackBar snackBar = SnackBar(content: Text('Login efetuado com sucesso!'), duration: Duration(seconds: 5));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('tudo certo..');
      Navigator.pushNamed(context, 'home');
    }).catchError((err) {
      print(err);
      showDialog(
          context: context,
          builder: ((context) {
            return const AlertDialog();
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lottieAnimation(),
              Text(
                'HelpDesk',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 40,
                    color: AppColors.textColorBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'Seu aplicativo de helpdesk',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Recupere sua senha',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColorBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Icon(
                      Icons.group_add,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'register'),
                      child: Text(
                        'Criar uma conta',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColorBlue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: ElevatedButton(
                  onPressed: efetuaLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: const Text(
                    'Acessar',
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
        'assets/animations/helpdesk-animation.json',
        width: 250,
        height: 250,
        fit: BoxFit.fill,
      ),
    );
  }
}
