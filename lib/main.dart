import 'package:flutter/material.dart';
import 'ResultPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kişilik Anketi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  @override
  _UygulamaState createState() => _UygulamaState();
}

class _UygulamaState extends State<SurveyPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  String? _gender;
  bool _isAdult = false;
  bool _smokes = false;
  double _cigarettesPerDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadowColor: Colors.indigo,
        titleSpacing: 25,
        backgroundColor: Color(0xff628DFF),
        title: Center(
          child: Text('Kişilik Anketi',
            style: TextStyle(color: Colors.amberAccent, fontSize: 30, fontWeight: FontWeight.bold),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Adınız ve Soyadınız'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen adınızı ve soyadınızı giriniz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: InputDecoration(labelText: 'Cinsiyetinizi seçiniz'),
                items: ['Erkek', 'Kadın']
                    .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Lütfen cinsiyetinizi seçiniz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text('Reşit misiniz?'),
                value: _isAdult,
                onChanged: (value) {
                  setState(() {
                    _isAdult = value ?? false;
                  });
                },
                activeColor: Color(0xff628DFF),
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('Sigara kullanıyor musunuz?'),
                value: _smokes,
                onChanged: (value) {
                  setState(() {
                    _smokes = value;
                  });
                },
                activeColor: Color(0xff628DFF),
              ),
              if (_smokes)
                Column(
                  children: [
                    Text('Günde kaç tane sigara kullanıyorsunuz?'),
                    Slider(
                      value: _cigarettesPerDay,
                      min: 0,
                      max: 40,
                      divisions: 40,
                      label: _cigarettesPerDay.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _cigarettesPerDay = value;
                        });
                      },
                      activeColor: Color(0xff628DFF),
                    ),
                  ],
                ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            name: _nameController.text,
                            gender: _gender ?? '',
                            isAdult: _isAdult,
                            smokes: _smokes,
                            cigarettesPerDay: _cigarettesPerDay,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Bilgilerimi Gönder', style: TextStyle(color: Color(0xff628DFF), fontSize: 25, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
