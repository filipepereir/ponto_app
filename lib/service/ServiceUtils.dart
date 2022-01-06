abstract class ServiceUtils {
  static Map<String, String> headerJWT = {'Content-Type': 'application/json'};
  static String token = "";

  String apiUrl = "192.168.15.2:8080";

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
