import 'dart:io';
import 'dart:convert';

void main() {
  var arq1 = File("arq1.txt");
  arq1.writeAsStringSync("oi!\nfuncionou");
  var ficha = {"nome": "João", "idade": 20};
  var s = jsonEncode(ficha);
  var arq2 = File("arq2.json");
  arq2.writeAsStringSync(s);
}
