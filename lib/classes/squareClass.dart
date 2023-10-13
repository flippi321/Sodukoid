import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SodukuSquare{
  late int value;
  late bool isLocked;
  late Color backgroundColor;

  // Constructor where fields are specified
  SodukuSquare(this.value, this.isLocked, this.backgroundColor);
}