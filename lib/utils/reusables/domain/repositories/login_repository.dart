abstract class LoginRepository {
  saveToken(String token);
  String getToken();
  saveCustomerId(int userId);
  int getCustomerId();
  closeSession();
  bool userIsAuthenticated();
}
