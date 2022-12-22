import 'dart:io';
import 'package:diohttp_app/Service/upload_api_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFileToServer extends StatefulWidget {
  const UploadFileToServer({Key? key}) : super(key: key);

  @override
  State<UploadFileToServer> createState() => _UploadFileToServerState();
}

class _UploadFileToServerState extends State<UploadFileToServer> {
  String status = "";
  File? file;

  Future<File?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload file"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  File? f = await selectFile();
                  if (f != null) {
                    file = f;
                    String st =
                        await UploadApiService.uploadProfileImage(file: f);
                    setState(() {
                      status = st;
                    });
                  }
                },
                child: const Text("Select file")),
            Text(
              status,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.tealAccent,
              ),
            ),
            file != null
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                        borderRadius: BorderRadius.circular(22)),
                    child: Image.file(
                      file!,
                      fit: BoxFit.cover,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
