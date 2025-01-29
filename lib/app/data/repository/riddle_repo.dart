import 'package:free_time/app/core/config/http_config.dart';
import 'package:free_time/app/data/model/riddles_response/riddles_response/riddles_response.dart';

import '../../core/config/api.dart';

class RiddleRepo {
  // static Future<RiddleResponse?> getRiddles() async {
  //   try {
  //     var res = await Api().get(
  //       HttpConfig.getRiddles,
  //       addRequestInterceptor: true,
  //     );
  //     var response =
  //         RiddleResponse.fromMap(res.data[0] as Map<String, dynamic>);
  //     return response;
  //   } catch (err) {
  //     return null;
  //   }
  // }

  static Future<RiddlesResponse?> getRiddles() async {
    try {
      var res = await Api().get(
        HttpConfig.riddle,
        addRequestInterceptor: true,
      );

      var reponse =
          RiddlesResponse.fromMap(res.data[0] as Map<String, dynamic>);
      return reponse;
    } catch (e) {
      return null;
    }
  }

  static Future<RiddlesResponse?> getJokes() async {
    try {
      var res = await Api().get(
        HttpConfig.jokes,
        addRequestInterceptor: true,
      );

      var reponse =
          RiddlesResponse.fromMap(res.data[0] as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }
}
