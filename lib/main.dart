import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samba_pos_app/core/init/locator.dart';
import 'package:samba_pos_app/ui/modules/order/order_page.dart';
import 'package:samba_pos_app/ui/modules/order/order_view_model.dart';

void main() {
  setupLocator();
  runApp(
    MultiProvider(
      builder: (context, child) {
        return MyApp();
      },
      providers: [
        ChangeNotifierProvider(create: (context)=> locator<OrderViewModel>(), child: OrderPage(),),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SambaPosMain(),
    );
  }
}

class SambaPosMain extends StatefulWidget {
  const SambaPosMain({Key key}) : super(key: key);

  @override
  _SambaPosMainState createState() => _SambaPosMainState();
}

class _SambaPosMainState extends State<SambaPosMain> {
  @override
  Widget build(BuildContext context) {
    return OrderPage();
  }
}
