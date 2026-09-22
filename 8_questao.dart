import 'dart:io';

void main() {
  var arquivo = File("lista_usuarios.txt");
  var linhas = arquivo.readAsLinesSync();
  linhas.sort();

  for (var linha in linhas) {
    linha = linha.trim();
    if (linha.isEmpty) continue;

    print(linha);
  }
}
