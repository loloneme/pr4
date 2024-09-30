import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/drink.dart';
import '../pages/info_page.dart';

class DrinkItem extends StatelessWidget {
  const DrinkItem({super.key, required this.drink});

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    int minPrice = drink.prices.values.reduce((value, element) => value < element ? value : element);

    return Container(
        width: 155,
        height: 175,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(159, 133, 102, 1.0),
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child:
                Image.network(
                  drink.image,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                )
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Text(drink.name,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sourceSerif4(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(255, 238, 205, 1.0),
                          )
                      )
                  )
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('от $minPrice₽',
                          style: GoogleFonts.sourceSerif4(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(255, 238, 205, 1.0),
                              )
                          )
                      ),
                      Text(
                          '>>',
                          style: GoogleFonts.sourceSerif4(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(255, 238, 205, 1.0),
                              ))
                      )
                    ],
                  ),
                )
            )
          ],
        ),
    );
  }
}
