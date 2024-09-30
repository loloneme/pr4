import 'dart:ffi';
import 'package:flutter/material.dart';


class Drink{
  final String image;
  final String name;
  final String description;
  final List<String> compound;
  final bool cold;
  final bool hot;
  final Map<String, int> prices;

  Drink(this.image, this.name, this.description, this.compound, this.cold, this.hot, this.prices);
}