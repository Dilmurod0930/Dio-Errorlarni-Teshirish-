
import 'package:dio/dio.dart';
import 'package:diohttp_app/Model/albome_model.dart';
import 'package:diohttp_app/Model/my_rresponse/my_respons_model.dart';
import 'package:diohttp_app/Model/tranfer/transaction_model.dart';
import 'package:diohttp_app/Service/api_clined_service.dart';

class ApiService extends ApiClient {

  Future<MyResponse> getSingleAlbumById(int id) async {
    // Dio dio = Dio();
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/albums/$id");
      if (response.statusCode == 200) {
        myResponse.data = Album.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
      //print(err.toString());
    }

    return myResponse;
  }


  Future<MyResponse> getAllAlbums() async {
    // Dio dio = Dio();
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/albums");
      if (response.statusCode == 200) {
         myResponse.data=(response.data as List?)
            ?.map((e) => Album.fromJson(e))
            .toList() ??
            [];
      }
    } catch (err) {
      myResponse.error=err.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getAllTransactions() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/transactions-expenses");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data=(response.data as List?)
            ?.map((e) => TransactionModel.fromJson(e))
            .toList() ??
            [];
      }
    } catch (err) {
      myResponse.error=err.toString();
    }
    return myResponse;
  }
}