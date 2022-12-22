import 'package:diohttp_app/Model/transactions_view_model.dart';
import 'package:diohttp_app/Respons/transactions_repo.dart';
import 'package:diohttp_app/Screen/upload_file_toserver.dart';
import 'package:diohttp_app/Service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TransactionsViewModel(
      transactionsRepo: TransactionsRepo(apiService: ApiService()),
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UploadFileToServer(),
    );
  }
}
