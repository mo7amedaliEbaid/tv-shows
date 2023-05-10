import 'package:breakingbad/constants/constants.dart';
import 'package:dio/dio.dart';

class CharactersWebServices{
late Dio dio;
CharactersWebServices(){
  BaseOptions options =BaseOptions(
    baseUrl: baseurl,
    receiveDataWhenStatusError: true,
    connectTimeout: 20*1000,
    receiveTimeout: 20*1000,
  );
  dio=Dio(options);
}
Future<List<dynamic>> getAllCharacters()async{
  try{
    Response response= await dio.get('character');
    print(response.data.toString());
    return response.data["results"];
  }catch(e){
    print(e.toString());
    return [];
  }
}
}