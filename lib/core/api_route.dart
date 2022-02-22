class ApiRoute{

  ApiRoute._();

  static const _authBaseUrl = 'https://accounts.spotify.com';

  static const _baseUrl = 'https://api.spotify.com/v1';

  static const autGetTokenUrl = '$_authBaseUrl/api/token';

  static const getUserInfo = '$_baseUrl/me';

  static const getGenre = '$_baseUrl/recommendations/available-genre-seeds';


}