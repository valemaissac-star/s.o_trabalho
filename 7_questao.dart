import 'dart:io';

void main() {
  var arq = File("lista.txt");
  var linhas = arq.readAsLinesSync();
  for (var linha in linhas) {
    linha = linha.trim();
    if (linha.isEmpty) continue;
    var partes = linha.split(':');
    var idade = int.parse(partes[1]) + 2;
    print("Nome: " + partes[0]);
    print("Idade: " + idade.toString());
  }
}
