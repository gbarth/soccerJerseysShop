import 'package:flutter/material.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Futep',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color.fromARGB(255, 8, 6, 7),
          onPrimary: const Color.fromARGB(255, 217, 222, 225),
          secondary: const Color.fromARGB(255, 0, 32, 102),
          onSecondary: const Color.fromARGB(255, 217, 222, 225),
          error: const Color.fromARGB(255, 217, 222, 225),
          onError: const Color.fromARGB(255, 8, 6, 7),
          background: const Color.fromARGB(255, 144, 110, 65),
          onBackground: const Color.fromARGB(255, 8, 6, 7),
          surface: const Color.fromARGB(255, 8, 6, 7),
          onSurface: const Color.fromARGB(255, 0, 32, 102).withOpacity(0.80),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 32, 102),
      ),
      home: ProductsOverviewPage(),
      routes: {
        AppRoutes.PRODUCT_DETAIL: (context) => const ProductDetailPage(),
      },
    );
  }
}
