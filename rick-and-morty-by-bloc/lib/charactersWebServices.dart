import 'package:breakingbad/constants.dart';
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
    Response response= await dio.get('character/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30');
    print(response.data.toString());
    return response.data;
  }catch(e){
    print(e.toString());
    return [];
  }
}
}