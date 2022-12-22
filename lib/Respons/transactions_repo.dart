import 'package:diohttp_app/Model/my_rresponse/my_respons_model.dart';
import 'package:diohttp_app/Service/api_service.dart';

class TransactionsRepo {
  TransactionsRepo({required this.apiService});
  ApiService apiService;
  Future<MyResponse> getAllTransactions() => apiService.getAllTransactions();
}
