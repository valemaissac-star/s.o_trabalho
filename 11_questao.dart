import 'dart:io';
import 'dart:convert';

void main() async {
  var arquivo = File("processos_cpu.json");

  if (await arquivo.exists()) {
    String conteudoTexto = await arquivo.readAsString();
    List<dynamic> listaJson = jsonDecode(conteudoTexto) as List<dynamic>;
    var total_cpu = 0;
    for (var item in listaJson) {
      var cpu_use = item['cpu_use'];
      total_cpu += cpu_use as int;
    }
    print("total de cpu: ${total_cpu}");
  } else {
    print("Arquivo não encontrado.");
  }
}
