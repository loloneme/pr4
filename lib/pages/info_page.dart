import 'package:flutter/material.dart';
import '../models/drink.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/drink_info.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.drink});

  final Drink drink;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>{
  void _showConfirmDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(44, 32, 17, 1.0),
          title: Text("Удалить напиток?", style: GoogleFonts.sourceSerif4(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(255, 238, 205, 1.0),
              ))),
          content: Text("Отменить это действие будет невозможно",
              style: GoogleFonts.sourceSerif4(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(255, 238, 205, 1.0),
              ))),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Отмена", style: GoogleFonts.sourceSerif4(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(255, 238, 205, 1.0),
                    )))),
            TextButton(onPressed: () => Navigator.of(context).pop(true),
                child: Text("OK", style: GoogleFonts.sourceSerif4(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(255, 238, 205, 1.0),
                    ))))
          ],
        );
      }
    ).then((result) {
      if (result == true) {
        Navigator.of(context).pop(true);
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text(widget.drink.name,
            style: GoogleFonts.sourceSerif4(
                textStyle: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(44, 32, 17, 1.0),
                )
            )
        )
      ),
        backgroundColor: const Color.fromRGBO(159, 133, 102, 1.0),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            width: double.infinity,
            color: const Color.fromRGBO(159, 133, 102, 1.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
              child: Column(
                children: [
                  DrinkInfo(drink: widget.drink),
                  const SizedBox(
                    height: 30
                  ),
                  IconButton(
                      icon: const Icon(Icons.delete),
                      color: const Color.fromRGBO(44, 32, 17, 1.0),
                      iconSize: 30,
                      onPressed: _showConfirmDelete)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
