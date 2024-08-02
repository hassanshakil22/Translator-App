import 'package:flutter/material.dart';
// import 'package:translator_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/providers/theme_provider.dart';
import 'package:translator_app/themes/themes.dart';
import 'package:translator_app/utils/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final List<Map<String, String>> languages = [
  {'name': 'Urdu', 'code': 'ur'},
  {'name': 'English', 'code': 'en'},
  {'name': 'Spanish', 'code': 'es'},
  {'name': 'French', 'code': 'fr'},
  {'name': 'German', 'code': 'de'},
  {'name': 'Malay', 'code': 'ms'},
  {'name': 'Arabic', 'code': 'ar'},
  {'name': 'Greek', 'code': 'el'},
  {'name': 'Hindi', 'code': 'hi'},
  {'name': 'Korean', 'code': 'ko'},
  {'name': 'Italian', 'code': 'it'},
  {'name': 'Japanese', 'code': 'ja'},
];
String getLanguageName(String code) {
  for (var language in languages) {
    if (language["code"] == code) {
      return language['name']!;
    }
  }
  return "Unknown ";
}

GoogleTranslator translator = GoogleTranslator();
TextEditingController _inputText = TextEditingController();
String _outPutText = "";
String outPutLanguage = "en";

String inputLanguage = "English";

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Translator App"),
        actions: [
          Switch(
              value: themeProvider.themeDataStyle == ThemesData.darkTheme
                  ? true
                  : false,
              onChanged: (isOn) {
                themeProvider.changeTheme();
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        inputLanguage,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.compare_arrows_sharp,
                        size: 30,
                      ),
                      DropdownButton<String>(
                          items: languages.map((language) {
                            return DropdownMenuItem(
                              child: Text(language['name']!),
                              value: language['code'],
                            );
                          }).toList(),
                          value: outPutLanguage,
                          onChanged: (newvalue) {
                            setState(() {
                              outPutLanguage = newvalue!;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        inputLanguage,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: _inputText,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your text...',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                wordSpacing: .2)),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () async {
                                try {
                                  if (_inputText.text.isNotEmpty) {
                                    final translatedText = await translator
                                        .translate(_inputText.text,
                                            to: outPutLanguage);

                                    setState(() {
                                      _outPutText = translatedText.text;
                                      inputLanguage =
                                          translatedText.sourceLanguage.name;
                                    });
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              label: Text('Translate'),
                              icon: Icon(Icons.translate),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.translateButtonColor,
                                foregroundColor: Colors.white,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            getLanguageName(outPutLanguage),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          _outPutText,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Spacer(),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(Icons.copy),
                        // ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
