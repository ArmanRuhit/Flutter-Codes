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
            RadioListTile(
                title: Text("FEMALE"),
                value: Gender.FEMALE,
                groupValue: _selectedGender, onChanged: (newValue){
                  setState(() {
                    _selectedGender = newValue;
                  });
            }
            ),
            RadioListTile(
                title: Text("Male"),
                value: Gender.MALE,
                groupValue: _selectedGender, onChanged: (newValue){
              setState(() {
                _selectedGender = newValue;
              });
            }
            ),
            RadioListTile(
                title: Text("Other"),
                value: Gender.OTHER,
                groupValue: _selectedGender, onChanged: (newValue){
              setState(() {
                _selectedGender = newValue;
              });
            }
            ),
            CheckboxListTile(
                title: Text('Dart'),
                value: _selectedProgrammingLanguages.contains(ProgrammingLanguage.DART),
                onChanged: (_){
                  setState(() {
                    _selectedProgrammingLanguages.contains(ProgrammingLanguage.DART)
                        ?_selectedProgrammingLanguages.remove(ProgrammingLanguage.DART)
                        :_selectedProgrammingLanguages.add(ProgrammingLanguage.DART);
                  });
                }
            ),
            CheckboxListTile(
                title: Text('Javascript'),
                value: _selectedProgrammingLanguages.contains(ProgrammingLanguage.JAVASCRIPT),
                onChanged: (_){
                  setState(() {
                    _selectedProgrammingLanguages.contains(ProgrammingLanguage.JAVASCRIPT)
                        ?_selectedProgrammingLanguages.remove(ProgrammingLanguage.JAVASCRIPT)
                        :_selectedProgrammingLanguages.add(ProgrammingLanguage.JAVASCRIPT);
                  });
                }
            ),
            CheckboxListTile(
                title: Text('Kotlin'),
                value: _selectedProgrammingLanguages.contains(ProgrammingLanguage.KOTLIN),
                onChanged: (_){
                  setState(() {
                    _selectedProgrammingLanguages.contains(ProgrammingLanguage.KOTLIN)
                        ?_selectedProgrammingLanguages.remove(ProgrammingLanguage.KOTLIN)
                        :_selectedProgrammingLanguages.add(ProgrammingLanguage.KOTLIN);
                  });
                }
            ),
            CheckboxListTile(
                title: Text('C'),
                value: _selectedProgrammingLanguages.contains(ProgrammingLanguage.C),
                onChanged: (_){
                  setState(() {
                    _selectedProgrammingLanguages.contains(ProgrammingLanguage.C)
                        ?_selectedProgrammingLanguages.remove(ProgrammingLanguage.C)
                        :_selectedProgrammingLanguages.add(ProgrammingLanguage.C);
                  });
                }
            ),
            CheckboxListTile(
                title: Text('Python'),
                value: _selectedProgrammingLanguages.contains(ProgrammingLanguage.PYTHON),
                onChanged: (_){
                  setState(() {
                    _selectedProgrammingLanguages.contains(ProgrammingLanguage.PYTHON)
                        ?_selectedProgrammingLanguages.remove(ProgrammingLanguage.PYTHON)
                        :_selectedProgrammingLanguages.add(ProgrammingLanguage.PYTHON);
                  });
                }
            ),
            CheckboxListTile(
                title: Text('Swift'),
                value: _selectedProgrammingLanguages.contains(ProgrammingLanguage.SWIFT),
                onChanged: (_){
                  setState(() {
                    _selectedProgrammingLanguages.contains(ProgrammingLanguage.SWIFT)
                        ?_selectedProgrammingLanguages.remove(ProgrammingLanguage.SWIFT)
                        :_selectedProgrammingLanguages.add(ProgrammingLanguage.SWIFT);
                  });
                }
            ),
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


}
