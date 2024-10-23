import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class HomeChatScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeChatScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  File? _imageFile;

  Future<void> pickImage(
  ) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _imageFile = File(pickedImage.path);
        });
      } else {
        print('User didn\'t pick any image.');
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<String> _getBase64Image(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text;
      final String email = _emailController.text;
      final String message = _messageController.text;
      // String? fileData;
      // String? fileType;
      // String? fileName;
      // if (_imageFile != null) {
      //   fileData = await _getBase64Image(_imageFile!);
      //   fileType = 'image/${_imageFile!.path.split('.').last}';
      //   fileName = _imageFile!.path.split('/').last;
      // }

      final Uri url = Uri.parse(
          'https://script.google.com/macros/s/AKfycbwwgwBIFF0VAzhmNUE6feHdOKJQphw1kUtAR5aifBxxpZ1byk9ipulyhBEJ_ypganYJgg/exec');
      final response = await http.post(
        url,
        body: jsonEncode({
          'name': name,
          'email': email,
          'message': message,
          // 'fileData': fileData,
          // 'fileType': fileType,
          // 'fileName': fileName,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final snackBar =
            SnackBar(content: Text('Data submitted successfully!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
        setState(() {
          _imageFile = null;
        });
      } else {
        final snackBar = SnackBar(content: Text('Failed to submit data!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(labelText: 'Message'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _imageFile == null
                    ? Text('No image selected.')
                    : Image.file(_imageFile!),
                ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text('Select Image'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitData,
                  child: Text('Submit'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*


function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = JSON.parse(e.postData.contents);

  sheet.appendRow([data.name, data.email, data.message]);

  return ContentService.createTextOutput(JSON.stringify({"status": "success"})).setMimeType(ContentService.MimeType.JSON);
}
https://script.google.com/macros/s/AKfycbwwgwBIFF0VAzhmNUE6feHdOKJQphw1kUtAR5aifBxxpZ1byk9ipulyhBEJ_ypganYJgg/exec

AKfycbwwgwBIFF0VAzhmNUE6feHdOKJQphw1kUtAR5aifBxxpZ1byk9ipulyhBEJ_ypganYJgg
*/
