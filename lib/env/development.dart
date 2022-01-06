import 'env.dart';

void main() => Development();

class Development extends Env {
  @override
  String get token => 'AIzaSyDJD45XHur7Xc-IDeBip3FgMRM9tbvshSo';

  @override
  String get ambiente => 'dev';

  @override
  String get baseUrl => 'https://www.googleapis.com/youtube/v3/';
}
