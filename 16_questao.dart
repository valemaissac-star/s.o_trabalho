import 'dart:io';
import 'dart:convert';

void main() async {
  var arquivo1 = File("usuarios.json");
  var arquivo2 = File("processos.json");

  if (await arquivo1.exists() && await arquivo2.exists()) {
    String conteudoTexto1 = await arquivo1.readAsString();
    String conteudoTexto2 = await arquivo2.readAsString();
    List<dynamic> usuarios = jsonDecode(conteudoTexto1) as List<dynamic>;
    List<dynamic> processos = jsonDecode(conteudoTexto2) as List<dynamic>;

    Map<int, String> loginPorId = {};

    for (var usuario in usuarios) {
      loginPorId[usuario["uid"]] = usuario["login"];
    }

    for (var processo in processos) {
      int uid = processo["uid"];
      String login = loginPorId[uid] ?? "usuario não está na lista";
      print("processo ${processo["pid"]} iniciador por ${login} ");
    }
  } else {
    print("Arquivo não existe");
  }
}
