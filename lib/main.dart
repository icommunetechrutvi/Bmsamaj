import 'package:bmsamaj/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home:  RegisterScreen(),
    );
  }
}



/// HOW TO SET UP in all DATA Save ...
/// 1. create Design FOr all data Register page.
/// 2. add excel: ^4.0.3, path_provider: ^2.0.12 , syncfusion_flutter_xlsio: ^20.4.50-beta
/// 3. google sheet in create new oNe sheet in share to anyone to editor.
/// 4. sheet name set and sAVE.
/// 5. click to Extensions -> App Script.
/// open app Script in that add code how many data store and save...
/*function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = JSON.parse(e.postData.contents);

  // Add headers if not already present
  if (sheet.getLastRow() == 0) {
    sheet.appendRow([
      'Name', 'Father Name', 'Surname', 'Caste', 'Mobile', 'Email', 'Address',
      'City', 'State', 'ZipCode', 'Job', 'PostJob', 'Member Name', 'Member Education',
      'Member Age', 'Member Gender'
    ]);
  }

  // Append the main data and all member data
  sheet.appendRow([
    data.name, data.fatherName, data.surName, data.caste, data.mobile, data.email,
    data.address, data.city, data.state, data.zipCode, data.job, data.postJob,
    ...data.members.map(member => [member.memberName, member.memberEducation, member.memberAge, member.memberGender])
  ].flat());

  return ContentService.createTextOutput(JSON.stringify({"result":"success"})).setMimeType(ContentService.MimeType.JSON);
}*/
///6. click on Deploy -> New Deploy -> Click Deploy.
///7. Copy Web Link.
///done all.
