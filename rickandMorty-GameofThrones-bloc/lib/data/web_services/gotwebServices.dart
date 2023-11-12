import 'package:tvshows/shared/constants.dart';
import 'package:dio/dio.dart';

class GOTCharactersWebServices {
  Dio dio = Dio();

  GOTCharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: GOTbaseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllGOTCharacters() async {
    try {
      Response response = await dio.get(allGOTcharacters);
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
