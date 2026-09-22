import 'dart:io';
import 'dart:convert';

void main() async {
  var arquivo1 = File("usuarios.json");
  var arquivo2 = File("processos.json");

  if (await arquivo1.exists() && await arquivo2.exists()) {
    String conteudoTexto1 = await arquivo1.readAsString();
    String conteudoTexto2 = await arquivo2.readAsString();
    List<dynamic> listaJson1 = jsonDecode(conteudoTexto1) as List<dynamic>;
    List<dynamic> listaJson2 = jsonDecode(conteudoTexto2) as List<dynamic>;
  } else {
    print("Arquivo não existe");
  }
}
