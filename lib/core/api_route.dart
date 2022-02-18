class ApiRoute{

  ApiRoute._();

  static const authBaseUrl = 'https://accounts.spotify.com';

  static const baseUrl = 'https://api.spotify.com/v1';

  static const autGetTokenUrl = '$authBaseUrl/api/token';

  static const getUserInfo = '$baseUrl/me';


}