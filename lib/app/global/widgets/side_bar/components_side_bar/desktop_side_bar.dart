import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/side_bar/components_side_bar/components_side_bar.dart';

import 'package:pscomidas/app/modules/home/schemas.dart';

class SideBarDesktop extends StatefulWidget {
  const SideBarDesktop({Key? key}) : super(key: key);

  @override
  _SideBarDesktopState createState() => _SideBarDesktopState();
}

class _SideBarDesktopState extends State<SideBarDesktop> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final _buttons = ['Produtos', 'Pedidos', 'Avaliações', 'Sair'];

    return Drawer(
      elevation: 0,
      child: Container(
        color: secondaryCollor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: screen.height * 0.05,
              ),
              child: const LogoSideBar(),
            ),
            SizedBox(
              height: screen.height * 0.05,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screen.height * 0.09,
                ),
                child: ListView(
                  children: [
                    ..._buttons.map(
                      (e) => Column(
                        children: [
                          TextButtonMenu(option: e),
                          SizedBox(
                            height: screen.height * 0.05,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screen.height * 0.3,
            ),
            Container(
              alignment: Alignment.center,
              color: redCollor,
              width: double.maxFinite,
              height: screen.height * 0.1,
              child: ListTilePerfil(),
            ),
            Container(
              color: Colors.white,
              width: double.maxFinite,
              height: screen.height * 0.04,
              child: const ClosedButtonShop(),
            ),
          ],
        ),
      ),
    );
  }
}
