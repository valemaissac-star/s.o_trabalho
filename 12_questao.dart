import 'package:path/path.dart' as path_lib;

void main() {
  print(path_lib.dirname("/home/ana/arquivo.txt"));
  print(path_lib.basename("/home/ana/arquivo.txt"));
  print(path_lib.extension("/home/ana/arquivo.txt"));
  print(path_lib.withoutExtension("/home/ana/arquivo.txt"));
  print(path_lib.withoutExtension(path_lib.basename("/home/ana/arquivo.txt")));
}
