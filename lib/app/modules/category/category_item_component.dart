import 'package:flutter/material.dart';

class CategoryItemComponent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Image.asset(  
        "assets/categorias/hamburguer.png", height: 220,
      ) ,
      
      ]
    );
}
}