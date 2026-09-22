import 'dart:io';
import 'dart:convert';

void main() async {
  var arquivo = File("info.json");

  if (await arquivo.exists()) {
    String conteudoTexto = await arquivo.readAsString();
    List<dynamic> listaJson = jsonDecode(conteudoTexto) as List<dynamic>;

    for (var item in listaJson) {
      print('Nome: ${item['nome']}');
      print('Versão: ${item['versao']}');
      print('Arquitetura: ${item['arquitetura']}');
    }
  } else {
    print("Arquivo não encontrado");
  }
}
