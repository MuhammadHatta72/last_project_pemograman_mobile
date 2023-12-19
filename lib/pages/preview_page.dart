import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:last_project_pemograman_mobile/config/config.dart';
import 'package:last_project_pemograman_mobile/pages/users.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  get context => null;

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
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Retake'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse('${Config.BASE_URL}/read');
                  var request = http.MultipartRequest('POST', url);

                  http.MultipartFile multipartFile =
                      await http.MultipartFile.fromPath(
                          'image_file', picture.path);
                  request.files.add(multipartFile);
                  try {
                    final response = await request.send().then((value) =>
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => UsersPage())));
                  } catch (e) {
                    print(e);
                  }
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
