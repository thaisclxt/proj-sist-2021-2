import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/register_field.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/field_label_style.dart';

class RegisterRestaurant extends StatefulWidget {
  const RegisterRestaurant({Key? key}) : super(key: key);

  @override
  _RegisterRestaurantState createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  final _fields = {
    'CNPJ': 'CNPJ',
    'Razão Social': 'Razão social do seu negócio',
    'Nome da loja': 'Nome da loja',
    'Telefone da fone': 'Telefone da loja com DDD',
    'CEP': 'CEP do seu negócio',
    'Cidade': 'Cidade do seu negócio',
    'Bairro': 'Bairro do seu negócio',
    'Endereço': 'Logradouro do seu negócio',
    'Número': 'Número do endereço',
    'Complemento (Opcional)': 'Complemento do endereço',
  };

  final _categories = [
    'Açaí',
    'Lanches',
    'Padarias',
    'Pizza',
    'Saldável',
    'Bolos e Doces',
    'Bebidas',
    'Vegetariana',
    'Italiana',
    'Sorvetes',
    'Asiática',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selectedValue = 'Açaí';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: primaryCollor,
        automaticallyImplyLeading: false,
        elevation: 2,
        title: const Center(
          child: LogoAppBar(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.33),
          width: size.width,
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Informações da loja',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Preencha abaixo as informações da sua futura loja no psfood com os dados do seu negócio',
                  style: TextStyle(
                    color: tertiaryCollor,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              ..._fields.keys.map(
                (e) {
                  if (e == 'Cidade') {
                    return Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: RegisterField(
                            label: e,
                            hintText: _fields[e] ?? '',
                          ),
                        ),
                        const VerticalDivider(),
                        const Flexible(
                          child: RegisterField(
                            label: 'Estado',
                            hintText: 'UF',
                          ),
                        ),
                      ],
                    );
                  }
                  return RegisterField(
                    label: e,
                    hintText: _fields[e] ?? '',
                  );
                },
              ).toList(),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 50.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Especialidade da loja',
                        style: fieldLabelStyle(),
                      ),
                      DropdownButton(
                        value: selectedValue,
                        icon: const Icon(Icons.expand_more),
                        elevation: 2,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: _categories.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
