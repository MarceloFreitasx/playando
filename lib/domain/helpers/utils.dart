class Utils {
  Utils._();

  static bool isYoutubeUrl(String url) {
    RegExp regExp = RegExp(
        r'((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?');
    if (regExp.stringMatch(url) != null) {
      return true;
    }
    return false;
  }
}
