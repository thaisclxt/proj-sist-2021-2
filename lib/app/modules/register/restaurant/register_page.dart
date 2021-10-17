import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'components/register_card.dart';
import 'components/register_side_text.dart';
import 'register_store.dart';

class RestaurantRegisterPage extends StatefulWidget {
  final String title;
  const RestaurantRegisterPage(
      {Key? key, this.title = 'RestaurantRegisterPage'})
      : super(key: key);
  @override
  RestaurantRegisterPageState createState() => RestaurantRegisterPageState();
}

class RestaurantRegisterPageState extends State<RestaurantRegisterPage> {
  final RestaurantRegisterStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0XFFf7f7f7),
        automaticallyImplyLeading: false,
        elevation: 2,
        title: const Center(child: LogoAppBar()),
      ),
      body: Container(
        child: pageResponsivity(MediaQuery.of(context).size.width),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/app/modules/register/restaurant/assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget pageResponsivity (width) {
    if (width > 850) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RegisterSideText(),
          RegisterCard(),
        ],
      );
    } 
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              const RegisterSideText(),
              RegisterCard(),
            ],
          ),
        ],
      ),
    );
  }
}
