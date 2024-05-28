import 'package:dio/dio.dart';
import 'package:gameofthrones/constants/strings.dart';

class CharactersApi{
  late Dio dio;
  CharactersApi(){
    BaseOptions options=BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio=Dio(options);
  }
  Future<List<dynamic>> getAllCharacters()async{
    try {
      Response response=await dio.get("Characters");
      // ignore: avoid_print
      print(response.data.toString());
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }

  }
}