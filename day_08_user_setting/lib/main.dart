import 'package:day08_user_setting/models.dart';
import 'package:flutter/material.dart';

import 'preferences_Service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferenceService = PreferenceService();
  final _usernameController = TextEditingController();
  Gender _selectedGender = Gender.FEMALE;
  var _selectedProgrammingLanguages = Set<ProgrammingLanguage>();
  var _isEmployed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _populateFields();
  }

  void _populateFields()  async{
    final settings = await _preferenceService.getSetting();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedProgrammingLanguages = settings.programmingLanguages;
      _isEmployed = settings.isEmployed;
    });
  }

  void _saveSettings(){
    final newSettings = Settings(
        username: _usernameController.text,
        gender: _selectedGender,
        programmingLanguages: _selectedProgrammingLanguages,
        isEmployed: _isEmployed
    );

    print(newSettings);
    _preferenceService.saveSettings(newSettings);
  }

  Widget radioTile(String text, Gender gender){
    return RadioListTile(
        title: Text(text),
        value: gender,
        groupValue: _selectedGender,
        onChanged: (newValue){
          setState(() {
            _selectedGender = newValue;
          });
        }
    );
  }

  Widget checkBoxTile(String text, ProgrammingLanguage value){
    return CheckboxListTile(
        title: Text(text),
        value: _selectedProgrammingLanguages.contains(value),
        onChanged: (_){
          setState(() {
            _selectedProgrammingLanguages.contains(value)
                ?_selectedProgrammingLanguages.remove(value)
                :_selectedProgrammingLanguages.add(value);
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Setting'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username'
                ),
              ),
            ),

            radioTile("FEMALE", Gender.FEMALE),
            radioTile("Male", Gender.MALE),
            radioTile("FEMALE", Gender.OTHER),

            checkBoxTile('Dart', ProgrammingLanguage.DART),
            checkBoxTile('Javascript', ProgrammingLanguage.JAVASCRIPT),
            checkBoxTile('Kotlin', ProgrammingLanguage.KOTLIN),
            checkBoxTile('C', ProgrammingLanguage.C),
            checkBoxTile('Python', ProgrammingLanguage.PYTHON),
            checkBoxTile('Swift', ProgrammingLanguage.SWIFT),

            SwitchListTile(
                title: Text('Is Employed'),
                value: _isEmployed,
                onChanged: (newValue){
                  setState(() {
                    _isEmployed = newValue;
                  });
                }
            ),
            TextButton(
                onPressed: _saveSettings,
                child: Text("Save Settings"))
          ],
        ),
      ),
    );
  }
}
