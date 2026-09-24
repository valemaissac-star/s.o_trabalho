import 'dart:io';

void main(List<String> args) {
  print("=== Diretórios do PATH ===");

  String separador = Platform.isWindows ? ";" : ":";
  String? path = Platform.environment["PATH"] ?? Platform.environment["Path"];

  if (path != null) {
    List<String> diretorios = path.split(separador);
    for (var dir in diretorios) {
      print(dir);
    }
  } else {
    print("Variável PATH não encontrada.");
  }

  print("");

  print("=== Platform.executableArguments ===");
  if (Platform.executableArguments.isEmpty) {
    print("(nenhum argumento)");
  } else {
    for (var arg in Platform.executableArguments) {
      print(arg);
    }
  }

  print("");
}
