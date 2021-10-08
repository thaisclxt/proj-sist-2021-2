// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/app_bar/principal_app_bar.dart';
import '/app/modules/home/components/restaurant_grid.dart';
import '/app/modules/home/store/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PrincipalAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Text(
                "Lojas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            RestaurantGrid(),
          ],
        ),
      ),
    );
  }
}
