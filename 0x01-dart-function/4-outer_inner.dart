void outer(String name, String id) {
  print(inner(name, id));
}

String inner(String name, String id) {
  List<String> parts = name.split(' ');
  return 'Hello Agent B.${parts[0]} your id is $id';
}
