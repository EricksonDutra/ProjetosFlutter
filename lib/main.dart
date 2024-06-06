import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:teste/home_page.dart';
import 'package:teste/pages/gigpy_page.dart';
import 'package:teste/pages/listatarefa_page.dart';
import 'package:teste/projects/helpdesk/initial_page.dart';
import 'package:teste/projects/helpdesk/pages/login_page.dart';
import 'package:teste/projects/helpdesk/pages/order_page.dart';
import 'package:teste/projects/helpdesk/pages/register_page.dart';
import 'package:teste/projects/shop_coder/models/cart.dart';
import 'package:teste/projects/shop_coder/models/order_list.dart';
import 'package:teste/projects/shop_coder/models/product_list.dart';
import 'package:teste/projects/shop_coder/pages/cart_page.dart';
import 'package:teste/projects/shop_coder/pages/home_shop.dart';
import 'package:teste/projects/shop_coder/pages/orders_page.dart';
import 'package:teste/projects/shop_coder/pages/product_detail.dart';
import 'package:teste/utils/constants.dart';

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
      debugPrint(dados.toString());
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ProductList()),
        ChangeNotifierProvider(create: (BuildContext context) => Cart()),
        ChangeNotifierProvider(create: (BuildContext context) => OrderList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const ListaTarefaPage(),
        initialRoute: 'homeShop',
        routes: {
          'login': (context) => const LoginPage(),
          'register': (context) => const RegisterPage(),
          'home': (context) => const HomePage(),
          'order': (context) => const OrderPage(),
          'giphy': (context) => const GiphyPage(),
          'todo': ((context) => const ListaTarefaPage()),
          'helpdesk': ((context) => const InitialPage()),
          'homeShop': (context) => const HomeShop(),
          AppRoutes.productDetail: (context) => const ProductDetail(),
          AppRoutes.cart: (context) => const CartPage(),
          AppRoutes.orders: (context) => const OrdersPage(),
          AppRoutes.homeshop: (context) => const HomeShop(),
        },
      ),
    );
  }
}
