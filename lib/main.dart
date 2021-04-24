//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart_manager.dart';
import 'models/product.dart';
import 'models/product_manager.dart';
import 'models/user_manager.dart';
import 'screens/base/base_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/product/product_screen.dart';
import 'screens/signup/signup_screen.dart';

//import 'package:firebase_auth/firebase_auth.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
          cartManager..updateUser(userManager),
        ),
      ],
      child: MaterialApp(
        title: 'Plant Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFFF5F5F5),
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(
                builder: (_) => LoginScreen(),
              );
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SignUpScreen(),
              );
              case '/product':
              return MaterialPageRoute(
                builder: (_) => ProductScreen(
                  settings.arguments as Product) 
              );case '/cart':
              return MaterialPageRoute(
                builder: (_) => CartScreen(),
              );
            case '/base':
            default:
              return MaterialPageRoute(
                builder: (_) => BaseScreen(),
              );
          }
        },
      ),
    );
  }
}
