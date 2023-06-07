import 'package:base_structure_project/const_values/config.dart';

/// Here is the Api urls. you can add your urls here
/// Note that these urls are mock and they are not real
/// they are written for you to know how you should use them
class URLs {
  static const authSendCodeUrl = '${baseUrl}auth/sendCode';
  static const authVerifyCodeUrl = '${baseUrl}auth/verify';
  static const getProductsUrl = '${baseUrl}product?sortBy=';
  static const getUserInfoUrl = '${baseUrl}user';

  /// A Query of GraphQl example

  static String slidersQuery() {
    return '''
    query slider(\$type: Int!){
  slider(type: \$type) {
    image,
  } 
}
    ''';
  }

  /// A Mutation of GraphQl example

  static String removeItemMutation() {
    return '''
    mutation removeItem(\$item_id: Int!) {
  removeItem(item_id:\$item_id) {
        status,
        message
  } 
}
    ''';
  }
}
