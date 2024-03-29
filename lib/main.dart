import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/auth_or_home_page.dart';
import 'package:shop/pages/auth_page.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/product_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/utils/custom_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (context, auth, previous) {
            return ProductList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (context, auth, previous) {
            return OrderList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SJ Store',
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: const Color.fromARGB(255, 0, 113, 242),
            onPrimary: const Color.fromARGB(255, 217, 222, 225),
            secondary: const Color.fromARGB(255, 8, 6, 7),
            onSecondary: const Color.fromARGB(255, 194, 194, 194),
            error: Colors.redAccent,
            onError: const Color.fromARGB(255, 8, 6, 7),
            background: const Color.fromARGB(255, 144, 110, 65),
            onBackground: const Color.fromARGB(255, 8, 6, 7),
            surface: const Color.fromARGB(255, 8, 6, 7),
            onSurface: const Color.fromARGB(255, 1, 24, 73).withOpacity(0.80),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 8, 6, 7),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionsBuilder(),
              TargetPlatform.iOS: CustomPageTransitionsBuilder(),
            },
          ),
        ),
        //home: ProductsOverviewPage(),
        routes: {
          AppRoutes.ORDERS: (context) => const OrdersPage(),
          AppRoutes.PRODUCT_DETAIL: (context) => const ProductDetailPage(),
          AppRoutes.CART: (context) => const CartPage(),
          AppRoutes.PRODUCTS: (context) => const ProductPage(),
          AppRoutes.PRODUCT_FORM: (context) => const ProductFormPage(),
          AppRoutes.AUTH_OR_HOME: (context) => const AuthOrHomePage(),
        },
      ),
    );
  }
}
