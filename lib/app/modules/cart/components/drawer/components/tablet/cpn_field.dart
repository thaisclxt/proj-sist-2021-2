import 'package:flutter/material.dart';

class TabletCupomField extends StatelessWidget {
  final double auxWidth;

  const TabletCupomField({
    Key? key,
    required this.auxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          const Divider(
            height: 12,
            color: Colors.black12,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            width: auxWidth * 0.8,
            child: TextFormField(
              enabled: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Nunito',
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.local_offer_outlined),
                hintText: 'Cupom de desconto',
                hintStyle: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const Divider(
            height: 12,
            color: Colors.black12,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
