
import 'package:dio/dio.dart';
import 'package:june26_provider/models/Products.dart';
import 'package:logger/logger.dart';

class Apiservice {
  Dio _dio=Dio();
  final  logger=Logger();
  final baseurl="https://fakestoreapi.com";
  Apiservice(){
    _dio.options.baseUrl=baseurl;
    _dio.options.headers={
      "Accept":"Application/json",
      "Content-Type":"Application/json"
    };
  }

  Future<List<Products>?> getProducts() async {
    try{
      final  response= await _dio.get("/Products");
      logger.e("Response:${response.data}");
      if(response.statusCode==200){
        final jsonlist=response.data as List;
        return jsonlist.map((json){return Products.fromJson(json);}).toList();
      }
    }
    on DioException catch(e){
      logger.e("Err:${e.message}");
    }
  }
}