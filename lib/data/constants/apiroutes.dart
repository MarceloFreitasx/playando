class ApiRoutes {
  ApiRoutes._();

  static String search(String term) => "search?part=snippet&q=$term";
}
