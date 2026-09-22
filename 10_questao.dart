import 'dart:io';

void main() {
  File arquivo = File('log.txt');
  List<String> linhas = arquivo.readAsLinesSync();
  for (String linha in linhas) {
    List<String> dados = linha.split(' ');
    String data = dados[0];
    List<String> partes = data.split('-');
    String ano = partes[0];
    String mes = partes[1];
    String dia = partes[2];
    print('$dia/$mes/$ano');
  }
}
