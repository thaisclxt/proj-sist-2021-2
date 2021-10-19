import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/btn_builder.dart';
import 'package:pscomidas/app/modules/cart/components/payment/components/cpf_input.dart';
import 'package:pscomidas/app/modules/cart/components/payment/components/endereco_entrega.dart';
import 'package:pscomidas/app/modules/cart/components/payment/components/order_container.dart';
import 'package:pscomidas/app/modules/cart/components/payment/components/payment_method.dart';
import 'package:pscomidas/app/modules/cart/components/payment/components/prev_entrega.dart';

class MobilePayPage extends StatelessWidget {
  const MobilePayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: screen.width * 0.6,
          child: Container(
            padding: const EdgeInsets.all(3),
            width: screen.width * 0.3,
            child: Column(
              children: <Widget>[
                const AutoSizeText(
                  'Finalize seu pedido',
                  presetFontSizes: [30, 20],
                  style: TextStyle(
                    fontFamily: 'Ninuto',
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Divider(
                  height: 10,
                  color: Colors.transparent,
                ),
                const EnderecoEntrega(),
                const Divider(
                  height: 10,
                  color: Colors.transparent,
                ),
                const PrevEntrega(),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black38,
                ),
                const PaymentMethod(),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black38,
                ),
                const CPF(),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black38,
                ),
                ButtonBuilder(
                  route: '',
                  auxWidth: screen.width * 0.9,
                  buttonTxt: 'Pagar',
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black38,
                ),
                OrderContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
