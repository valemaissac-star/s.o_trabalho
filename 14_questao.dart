import 'dart:io';
import 'dart:convert';

void main() async {
  var arquivo = File("ssd.json");
  print("Lista de Usuários:\nana,\npedro,\nmaria,\njoao,\ncarlos,\nbruno.\n");
  print("Qual é seu nome?");
  if (await arquivo.exists()) {
    var total = 0;
    bool encontrato = false;
    var nome = stdin.readLineSync();
    String conteudoTexto = await arquivo.readAsString();
    List<dynamic> listaJson = jsonDecode(conteudoTexto) as List<dynamic>;

    var item;
    for (item in listaJson) {
      if (nome == item["usuario"]) {
        encontrato = true;
        print("usuario ${item["usuario"]}");
        print("Arquivo: ${item["arquivo"]}");
        print("Tamanho: ${item["tamanho"]}");
        total += item["tamanho"] as int;
      }
    }
    if (!encontrato) {
      print("Usuario não encontrato!!!");
    } else {
      print("total de bytes: ${total}.");
    }
  } else {
    print("Arquivo não encontrado!!!");
  }
}
