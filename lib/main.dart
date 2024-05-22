import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teste/home_page.dart';
import 'package:teste/pages/gigpy_page.dart';
import 'package:teste/pages/listatarefa_page.dart';
import 'package:teste/projects/helpdesk/initial_page.dart';
import 'package:teste/projects/helpdesk/pages/login_page.dart';
import 'package:teste/projects/helpdesk/pages/order_page.dart';
import 'package:teste/projects/helpdesk/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseFirestore db = FirebaseFirestore.instance;
  await dotenv.load(fileName: ".env");

  // db.collection("produtos").doc("001").set({"nome": "Caneta", "preco": "4.98", "ativo": true});
  // db.collection("produtos").doc("001").set({"nome": "Cadeira", "preco": "24.60", "ativo": false});

  // DocumentReference ref = await db.collection("produtos").add({"nome": "Cadeira", "preco": "24.60", "ativo": false});

  // print('Id do registro: ${ref.id}');
  // db.collection("produtos").doc("002").delete();
  db.collection("produtos").snapshots().listen((snapshot) {
    for (DocumentSnapshot<Map<String, dynamic>> item in snapshot.docs) {
      Map<String, dynamic> dados = item.data()!;
      print(dados.toString());
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ListaTarefaPage(),
      initialRoute: 'home',
      routes: {
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'home': (context) => const HomePage(),
        'order': (context) => const OrderPage(),
        'giphy': (context) => const GiphyPage(),
        'todo': ((context) => const ListaTarefaPage()),
        'helpdesk': ((context) => const InitialPage())
      },
    );
  }
}
