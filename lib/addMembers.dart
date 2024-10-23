import 'dart:convert';

import 'package:bmsamaj/appcolor.dart';
import 'package:bmsamaj/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddMembersScreen extends StatefulWidget {
  String name;
  String fatherName;
  String surName;
  String caste;
  String mobile;
  String email;
  String address;
  String city;
  String state;
  String zipCode;
  String job;
  String postJob;

  AddMembersScreen({
    Key? key,
    required this.name,
    required this.fatherName,
    required this.surName,
    required this.caste,
    required this.mobile,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.job,
    required this.postJob,
  }) : super(key: key);

  @override
  State<AddMembersScreen> createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembersScreen> {
  List<Widget> _memberForms = [];
  List<TextEditingController> _nameControllers = [];
  List<TextEditingController> _educationControllers = [];
  List<TextEditingController> _ageControllers = [];
  final List<String?> _genderValues = [];
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _addMemberForm();
    });
  }

  void _addMemberForm() {
    setState(() {
      _nameControllers.add(TextEditingController());
      _educationControllers.add(TextEditingController());
      _ageControllers.add(TextEditingController());
      _genderValues.add("");

      _memberForms.add(_buildMemberForm(_nameControllers.length - 1));
    });
  }

  void _printAllData() {
    for (int i = 0; i < _nameControllers.length; i++) {
      print("Member ${i + 1}");
      print("Name: ${_nameControllers[i].text}");
      print("Education: ${_educationControllers[i].text}");
      print("Age: ${_ageControllers[i].text}");
      print("Gender: ${_genderValues[i]}");
    }
  }

  Future<void> _submitData() async {
    setState(() {
      isLogin = true;
    });
    final String name = widget.name;
    final String fatherName = widget.fatherName;
    final String surName = widget.surName;
    final String caste = widget.caste;
    final String mobile = widget.mobile;
    final String email = widget.email;
    final String address = widget.address;
    final String city = widget.city;
    final String state = widget.state;
    final String zipCode = widget.zipCode;
    final String job = widget.job;
    final String postJob = widget.postJob;

    List<Map<String, String>> members = [];
    for (int i = 0; i < _nameControllers.length; i++) {
      final String memberName = _nameControllers[i].text;
      final String memberEducation = _educationControllers[i].text;
      final String memberAge = _ageControllers[i].text;
      final String memberGender = _genderValues[i]!;

      members.add({
        'memberName': memberName,
        'memberEducation': memberEducation,
        'memberAge': memberAge,
        'memberGender': memberGender,
      });
    }

    final Uri url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbzURbu8hw9Ww7HoaHD0fCy2_-mxW91KvWkynvgbh0vtd7W_gWJvUUiK33uJ5ce8Uyv11w/exec');
    final response = await http.post(
      url,
      body: jsonEncode({
        'name': name,
        'fatherName': fatherName,
        'surName': surName,
        'caste': caste,
        'mobile': mobile,
        'email': email,
        'address': address,
        'city': city,
        'state': state,
        'zipCode': zipCode,
        'job': job,
        'postJob': postJob,
        'members': members,
      }),
      headers: {'Content-Type': 'application/json'},
      // redirect: true,
    );
    if (response.statusCode == 200) {
      setState(() {
        isLogin = false;
      });
      final snackBar = SnackBar(content: Text('Data submitted successfully!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else {
      // If it's a redirect, follow the redirected URL
      if (response.statusCode == 302) {
        final String redirectUrl = response.headers['location']!;
        final responseRedirect = await http.get(Uri.parse(redirectUrl));

        print('Redirected response status: ${responseRedirect.statusCode}');
        print('Redirected response body: ${responseRedirect.body}');

        if (responseRedirect.statusCode == 200) {
          setState(() {
            isLogin = false;
          });
          final snackBar =
          SnackBar(content: Text('Data submitted successfully!!'),backgroundColor: Colors.lightGreen,);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
            return RegisterScreen();
          },), (route) => false);
          // Navigator.pop(context);
        } else {
          setState(() {
            isLogin = false;
          });
          final snackBar = SnackBar(content: Text('Failed to submit data!!',),backgroundColor: Colors.red);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        setState(() {
          isLogin = false;
        });
        final snackBar = SnackBar(content: Text('Failed to submit data!!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Family Member",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          backgroundColor: AppColor.mainAppColor,
          toolbarHeight: MediaQuery.of(context).size.height * 0.05),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        onPressed: () {
          _addMemberForm();
        },
        label: Text("Add Family Members"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              // height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: _memberForms.length,
                itemBuilder: (context, index) {
                  return _memberForms[index];
                },
              ),
            ),
          ),
          Expanded(
              child: Center(
                child: isLogin ? Center(child: CircularProgressIndicator( ),) : null,
              )),
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    backgroundColor: AppColor.mainAppColor),
                child: Padding(



                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'ADD',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),
                  ),
                ),
                onPressed: _submitData,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberForm(int index) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Text(
            "Enter Your Family Members Info " + " ${index.toString()}",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: _nameControllers[index],
            textCapitalization: TextCapitalization.none,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
              prefixIconColor: Color.fromARGB(255, 126, 143, 130),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            textCapitalization: TextCapitalization.none,
            controller: _educationControllers[index],
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(
              labelText: 'Education',
              border: OutlineInputBorder(),
              prefixIconColor: Color.fromARGB(255, 126, 143, 130),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: _ageControllers[index],
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(
              labelText: 'Age',
              border: OutlineInputBorder(),
              prefixIconColor: Color.fromARGB(255, 126, 143, 130),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Gender",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          /*   Row(
            children: [
              Expanded(
                flex: 1,
                child: ListTile(
                  leading: Radio<String>(
                    value: "male",
                    groupValue: _genderValues[index],
                    onChanged: (value) {
                      setState(() {
                        _genderValues[index] = value;
                        print("_genderValues${_genderValues}");
                      });
                    },
                    activeColor: _genderValues[index] == "male" ? Colors.blue : null,
                  ),
                  title: Text("Male"),
                  onTap: () {
                    setState(() {
                      _genderValues[index] = "male";
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ListTile(
                  // leading: Radio<String>(
                    value: "female",
                    groupValue: _genderValues[index],
                    onChanged: (value) {
                      setState(() {
                        _genderValues[index] = value;
                        print("_genderValues${_genderValues}");
                      });
                    },
                    activeColor: _genderValues[index] == "female" ? Colors.blue : null,
                  ),
                  title: Text("Female"),
                  onTap: () {
                    setState(() {
                      _genderValues[index] = "female";
                    });
                  },
                ),
              ),
            ],
          ),*/
          /*  DropdownButtonFormField<String>(
            value: _genderValues[index],
            onChanged: (String? newValue) {
              setState(() {
                _genderValues[index] = newValue;
                print("_genderValues${_genderValues}");
              });
            },
            items: <String>['','Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            ),
          ),*/
          DropdownButtonFormField<String>(
            value: _genderValues[index]!.isEmpty ? null : _genderValues[index],
            onChanged: (String? newValue) {
              setState(() {
                _genderValues[index] = newValue;
                print("_genderValues${_genderValues}");
              });
            },
            items: <String>[
              'Male',
              'Female',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
