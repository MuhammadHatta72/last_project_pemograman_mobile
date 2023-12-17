import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:last_project_pemograman_mobile/pages/users.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  get context => null;

  // alert
  CupertinoAlertDialog _createCupertinoAlertDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Upload Success'),
      content: const Text('Your KTM has been uploaded'),
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UsersPage()));
          },
        ),
      ],
    );
  }

  Future uploadRequest(XFile image) async {
    final url = Uri.parse('http://192.168.18.69:5000/read');
    var request = http.MultipartRequest('POST', url);
    
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath('image_filefile', image.path); 
    request.files.add(multipartFile);
    final response = await request.send();
    if (response.statusCode == 200) {
      print('Upload success!');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return _createCupertinoAlertDialog(context);
          });
    } else {
      print('Upload failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(picture.name),
          const SizedBox(height: 24),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Retake'),
              ),
              ElevatedButton(
                onPressed: () {
                  uploadRequest(picture);
                  Navigator.pop(context);
                },
                child: const Text('Use Picture'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
