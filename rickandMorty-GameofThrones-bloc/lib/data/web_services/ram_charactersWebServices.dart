import 'package:breakingbad/constants/constants.dart';
import 'package:dio/dio.dart';

class RAMCharactersWebServices{
 Dio dio=Dio();
RAMCharactersWebServices(){
  BaseOptions options =BaseOptions(
    baseUrl: RAMbaseurl,
    receiveDataWhenStatusError: true,
    connectTimeout: 20*1000,
    receiveTimeout: 20*1000,
  );
  dio=Dio(options);
}
Future<List<dynamic>> getAllRAMCharacters()async{
  try{
    Response response= await dio.get(allRAMcharacters);
    print(response.data.toString());
    return response.data["results"];
  }catch(e){
    print(e.toString());
    return [];
  }
}
}