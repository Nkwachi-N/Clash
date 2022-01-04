import 'dart:convert';

import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/secret_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:pkce/pkce.dart';

class AuthRepository{
   static const state = 'HappyBaby257';

   final _dio = Dio();

   Future<String?> authorize() async {

     final pkcePair = PkcePair.generate();

     final codeChallenge = pkcePair.codeChallenge.replaceAll('=', '');
     final codeVerifier = pkcePair.codeVerifier;

     final url = Uri.https('accounts.spotify.com', '/authorize', {
       'response_type': 'code',
       'client_id': kClientId,
       'redirect_uri': kRedirectUri,
       'state':state,
       'code_challenge_method' : 'S256',
       'code_challenge': codeChallenge,
     });

      final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: 'clash',
      );

      print('Result is $result');

     final returnedState  = Uri.parse(result).queryParameters['state'];


     if(state == returnedState){
       final code = Uri.parse(result).queryParameters['code'];

       if(code != null) {
         _getToken(code, codeVerifier);
       }
     }
   }

   Future<void> _getToken(String code, String codeVerifier) async{

     final _data = {
     'grant_type':'authorization_code',
     'code':code,
     'redirect_uri':kRedirectUri,
     'client_id': kClientId,
     'code_verifier':codeVerifier
     };

     Codec<String, String> stringToBase64 = utf8.fuse(base64);

     final encodedString  = stringToBase64.encode('$kClientId:$kSecretKey');
     final _header = {
       'Authorization' : 'Basic $encodedString',
       'Content-Type': 'application/x-www-form-urlencoded',
     };

   try{
     final response = await _dio.post(ApiRoute.autGetTokenUrl,data:_data,options: Options(
         headers: _header
     ) );
     print(response.data);

   }on DioError catch(e){
     print(e.response?.data);
     }


   }


}