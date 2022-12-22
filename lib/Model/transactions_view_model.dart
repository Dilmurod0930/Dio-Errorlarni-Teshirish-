import 'package:diohttp_app/Model/my_rresponse/my_respons_model.dart';
import 'package:diohttp_app/Model/tranfer/transaction_model.dart';
import 'package:diohttp_app/Respons/transactions_repo.dart';
import 'package:flutter/cupertino.dart';

class TransactionsViewModel extends ChangeNotifier {
  TransactionsViewModel({required this.transactionsRepo}) {
    fetchTransactions();
  }

  List<TransactionModel> transactions = [];

  String errorForUI = "";

  TransactionsRepo transactionsRepo;

  fetchTransactions() async {
    MyResponse myResponse = await transactionsRepo.getAllTransactions();
    if (myResponse.error.isEmpty) {
      transactions = myResponse.data as List<TransactionModel>;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }
}
