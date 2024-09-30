import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr4/components/drink_info.dart';
import 'package:pr4/pages/info_page.dart';
import '../data.dart';
import '../components/drink_item.dart';
import '../models/drink.dart';
import '../pages/new_drink_page.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({super.key});

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  final List<Drink> _drinks = [
    Drink(
        'https://github.com/loloneme/images/blob/main/bumble.png?raw=true',
        'Бамбл',
        'Все ингредиенты наливают слоями: сначала тягучий сироп, потом яркий сок и два шота эспрессо. '
            'У него яркий и сложный вкус: сначала чувствуется сладость сиропа, затем — цитрусовая кислинка и легкая кофейная горечь в конце.',
        ['Двойной Эспрессо', 'Апельсиновый фреш', 'Карамельный сироп', 'Лед'],
        true,
        false,
        {'350': 300, '500': 400})
  ];

  void _navigateToNewDrinkPage(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NewDrinkPage()));

    if (result != null) {
      setState(() {
        _drinks.add(result);
      });
    }
  }

  void _navigateToInfoPage(BuildContext context, int index) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InfoPage(drink: _drinks[index])));

    if (result == true) {
      setState(() {
        _drinks.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Напитки",
                style: GoogleFonts.sourceSerif4(
                    textStyle: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(255, 238, 205, 1.0),
                )))),
        backgroundColor: const Color.fromRGBO(71, 58, 42, 1.0),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(71, 58, 42, 1.0),
        child: _drinks.isNotEmpty
            ? GridView.count(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                children: List.generate(_drinks.length, (index) {
                  return GestureDetector(
                    onTap: () => _navigateToInfoPage(context, index),
                    child: DrinkItem(drink: _drinks[index]),
                  );
                }),
              )
            : Center(
                child: Text(
                  'Пока что здесь пусто...',
                  style: GoogleFonts.sourceSerif4(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(255, 238, 205, 1.0),
                      )),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToNewDrinkPage(context),
        backgroundColor: const Color.fromRGBO(44, 32, 17, 1.0),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Color.fromRGBO(255, 238, 205, 1.0)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
