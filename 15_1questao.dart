import 'dart:io';
import 'dart:convert';
import 'package:tint/tint.dart';

void main() async {
  var arquivo = File("processos.json");

  if (await arquivo.exists()) {
    String conteudoTexto = await arquivo.readAsString();
    List<dynamic> listaJson = jsonDecode(conteudoTexto) as List<dynamic>;
    print("STATE: READY".underline().blue().onWhite());
    for (var item in listaJson) {
      if (item["state"] == "ready") {
        print(
          "process : ${item["process_name"]} *${item["io_bound"]}."
              .underline()
              .green()
              .onWhite(),
        );
      }
    }
    print("STATE: RUNNING".underline().blue().onWhite());
    for (var item in listaJson) {
      if (item["state"] == "running") {
        print(
          "process : ${item["process_name"]} *${item["io_bound"]}."
              .underline()
              .yellow()
              .onWhite(),
        );
      }
    }
    print("STATE: BLOCKED".underline().blue().onWhite());
    for (var item in listaJson) {
      if (item["state"] == "blocked") {
        print(
          "process : ${item["process_name"]} *${item["io_bound"]}"
              .underline()
              .red()
              .onWhite(),
        );
      }
    }
  }
}
