abstract class ServiceUtils {
  static Map<String, String> headerJWT = {'Content-Type': 'application/json'};
  static String token = "";

  void saveToken(String token) {
    ServiceUtils.token = token;
    ServiceUtils.headerJWT['Authorization'] = 'Bearer ${ServiceUtils.token}';
  }

  String getToken() {
    return ServiceUtils.token;
  }

  static invalidateToken() {
    ServiceUtils.token = '';
    ServiceUtils.headerJWT['Authorization'] = '';
  }
}
