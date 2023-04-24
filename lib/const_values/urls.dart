import 'package:base_structure_project/const_values/config.dart';

/// Here is the Api urls. you can add your urls here
/// Note that these urls are mock and they are not real
class URLs {
  static const authSendCodeUrl = '${baseUrl}auth/sendCode';
  static const authVerifyCodeUrl = '${baseUrl}auth/verify';
  static const getProductsUrl = '${baseUrl}product?sortBy=';
  static const getUserInfoUrl = '${baseUrl}user';
}
