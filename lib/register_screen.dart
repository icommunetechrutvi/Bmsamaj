import 'dart:io';

import 'package:bmsamaj/addMembers.dart';
import 'package:bmsamaj/appcolor.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterScreen> {
  final TextEditingController _emailController      = TextEditingController();
  final TextEditingController _firstNameController  = TextEditingController();
  final TextEditingController _fatherNameController  = TextEditingController();
  final TextEditingController _surnameController     = TextEditingController();
  final TextEditingController _casteController      = TextEditingController();
  final TextEditingController _addressController    = TextEditingController();
  final TextEditingController _cityController      = TextEditingController();
  final TextEditingController _stateController      = TextEditingController();
  final TextEditingController _zipController        = TextEditingController();
  final TextEditingController _businessController    = TextEditingController();
  final TextEditingController _postInCaseController   = TextEditingController();
  final TextEditingController _mobileNoController    = TextEditingController();

  bool _isLoading = false;
  bool _emailValidated = true;
  late var deviceTokenToSendPushNotification = "";
  String? _selectMember = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File images = File("");

  @override
  void initState() {
    super.initState();
    setState(() {
      print("NEW ONE DATA");
      _emailController.clear();
      _firstNameController.clear();
      _fatherNameController.clear();
      _surnameController.clear();
      _casteController.clear();
      _addressController.clear();
      _cityController.clear();
      _stateController.clear();
      _zipController.clear();
      _businessController.clear();
      _postInCaseController.clear();
      _mobileNoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          color: AppColor.mainAppColor,
          child: Center(
            child: Card(
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                constraints: const BoxConstraints(maxWidth: 370),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // const FlutterLogo(size: 100),
                      _gap(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "",
                          // style: AppTheme.nameText1(),
                        ),
                      ),

                      _gap(),
                      Text("INDIA BALOCH MAKRANI SAMAJ",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              color: AppColor.kDarkMain)),
                      _gap(),
                      TextFormField(
                        controller: _firstNameController,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                          // errorText: !_emailValidated
                          //     ? 'Please enter a First Name'
                          //     : null,
                        ),
                      ),
                      // SizedBox(height: 10.0),
                      /*  Align(
                          alignment: Alignment.topLeft,
                          child: Text("Profile Image")),
                      Row(
                        children: [
                          ElevatedButton(
                            // style: ButtonStyle(backgroundColor: App),
                              onPressed: () {
                                _showPicker(context, 0);
                              },
                              child: const Text("Upload Photo")),
                          SizedBox(width: 20.0),
                          Text(
                            "${images.path.isNotEmpty ? images.path.split('/').last : ''}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),*/
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _fatherNameController,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Father Name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'Father Name',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                          // errorText: !_emailValidated
                          //     ? 'Please enter a First Name'
                          //     : null,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _surnameController,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Surname';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'Surname',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                          // errorText: !_emailValidated
                          //     ? 'Please enter a First Name'
                          //     : null,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _casteController,
                        textCapitalization: TextCapitalization.none,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'Caste',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                          // errorText: !_emailValidated
                          //     ? 'Please enter a First Name'
                          //     : null,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.phone,
                        controller: _mobileNoController,
                        maxLength: 10,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Mobile Number';
                          } else if (value!.length < 10) {
                            return 'Please enter valid Mobile Number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'Mobile',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        onChanged: (value) {
                          setState(() {
                            _emailValidated =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value) ||
                                    RegExp(r'^[0-9]{10}$').hasMatch(value);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                          errorText: !_emailValidated
                              ? 'Please enter a valid email'
                              : null,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _addressController,
                        textCapitalization: TextCapitalization.none,
                        maxLines: 3,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _cityController,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your City';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'City',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _stateController,
                        textCapitalization: TextCapitalization.none,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'State',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                        ),
                      ),

                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _zipController,
                        maxLength: 6,
                        keyboardType: TextInputType.phone,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Zip code';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'Zip code / Pin code',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _businessController,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Business/Job';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'Business/Job',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _postInCaseController,
                        textCapitalization: TextCapitalization.none,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          labelText: 'Post In Case of Job',
                          border: OutlineInputBorder(),
                          prefixIconColor: Color.fromARGB(255, 126, 143, 130),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      const Text("Details of Family Members",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 19)),

                      FloatingActionButton.extended(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return AddMembersScreen(
                                  name: _firstNameController.text,
                                  fatherName: _fatherNameController.text,
                                  surName: _surnameController.text,
                                  caste: _casteController.text,
                                  mobile: _mobileNoController.text,
                                  email: _emailController.text,
                                  address: _addressController.text,
                                  city: _cityController.text,
                                  state: _stateController.text,
                                  zipCode: _zipController.text,
                                  job: _businessController.text,
                                  postJob: _postInCaseController.text,
                                );
                              },
                            ));
                          }
                        },
                        label: Text("Next"),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
/*void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Map<String, String> formData = {
        'First Name': _firstNameController.text,
        'Father Name': _fatherNameController.text,
        'Surname': _surnameController.text,
        'Caste': _casteController.text,
        'Mobile': _mobileNoController.text,
        'Email': _emailController.text,
        'Address': _addressController.text,
        'City': _cityController.text,
        'State': _stateController.text,
        'Zip Code': _zipController.text,
        'Business/Job': _businessController.text,
        'Post In Case of Job': _postInCaseController.text,
      };

      saveToExcel(formData);
    }
  }


  Future<void> saveToExcel(Map<String, String> formData) async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    // Append keys as the first row
    int keyIndex = 0;
    for (var key in formData.keys) {
      var cell = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: keyIndex, rowIndex: 0));
      cell.value = key as CellValue?; // Assign the key as a string
      keyIndex++;
    }

    // Append values as the second row
    int valueIndex = 0;
    for (var value in formData.values) {
      var cell = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: valueIndex, rowIndex: 1));
      cell.value = value.toString() as CellValue?; // Assign the value as a string
      valueIndex++;
    }

    Directory? directory = await getExternalStorageDirectory();
    String filePath = '${directory!.path}/form_data.xlsx';
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    print('Excel file saved at $filePath');
  }


  Widget _gap() => const SizedBox(height: 16);
  void _showPicker(
      BuildContext context,
      int imageId,
      ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  pickImage(imageId, ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  pickImage(imageId, ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  Future<void> pickImage(
      int index,
      ImageSource source,
      ) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          images = File(pickedImage.path);
          print("images~~${images}");
        });
        // await postProfileImageEdit(images[index]!, imageId,profileId,keyName);
        // print("images[index]~~~${index}");
        // print("images[index]~~~${imageId}");
        // print("images[index]~~~${images[index]}");
      } else {
        print('User didn\'t pick any image.');
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }*/
}
