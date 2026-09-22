import 'dart:io';

void main() {
  print("Qual é seu nome?");
  var nome = stdin.readLineSync();
  print("E sua idade?");
  var idade = stdin.readLineSync();
  print("$nome tem $idade anos de idade");
}
