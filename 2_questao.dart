void main() {
  var a = [10, 20, 30];
  print(a);
  print(a.length);
  for (var x in a) {
    print("item: " + x.toString());
  }
  for (var i = 0; i < a.length; i++) {
    print("item: " + a[i].toString());
  }
}
