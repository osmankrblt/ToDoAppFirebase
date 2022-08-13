import 'package:flutter/material.dart';
import 'package:to_do_app/Helper/firebaseHelper.dart';
import 'package:to_do_app/MyWidgets/registerUserStep1.dart';
import 'package:to_do_app/constants/constants.dart';

import 'MyWidgets/registerUserStep2.dart';

class RegisterScreenPage extends StatefulWidget {
  RegisterScreenPage({Key? key}) : super(key: key);

  @override
  State<RegisterScreenPage> createState() => _RegisterScreenPageState();
}

bool validateDurum = false;
late String name, surname, mailMain, passwordMain;

class _RegisterScreenPageState extends State<RegisterScreenPage> {
  @override
  int oAnkiStep = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sabitler.baslik("Kayıt Ol"),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(
                      "Devam",
                      style:
                          sabitler.textStyle(15, FontWeight.bold, Colors.white),
                    ),
                    style: sabitler.buttonStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: details.onStepCancel,
                    child: Text(
                      "Geri",
                      style:
                          sabitler.textStyle(15, FontWeight.bold, Colors.white),
                    ),
                    style: sabitler.buttonStyle,
                  ),
                ),
              ],
            );
          },
          currentStep: oAnkiStep,
          onStepContinue: () async {
            if (sabitler.LoginSteps.length > oAnkiStep &&
                validateDurum == true) {
              validateDurum = false;

              oAnkiStep += 1;
            } else if (validateDurum == true) {
              oAnkiStep = oAnkiStep;
              if (validateDurum) {
                await DatabaseHelper().createUserEmailAndPassword(
                        (name + " " + surname), mailMain, passwordMain)
                    ? Navigator.popAndPushNamed(context, "/listNots")
                    : print("Hata");
              }
            } else {
              oAnkiStep = oAnkiStep;
            }
            ;
            setState(() {});
          },
          onStepCancel: () {
            if (oAnkiStep > 0) {
              oAnkiStep -= 1;
            } else {
              oAnkiStep = 0;
            }
            setState(() {});
          },
          steps: [
            Step(
              title: Text("İsim - Soyad"),
              content: UserBilgi(
                onReturnData: (name1, surname1, validateDurumButton) {
                  name = name1;
                  surname = surname1;
                  validateDurum = validateDurumButton;
                },
              ),
            ),
            Step(
              title: Text("Mail - Parola"),
              content: LoginUserSecurity(
                onReturnData: (mail, password, validateDurumButton) {
                  validateDurum = validateDurumButton;
                  mailMain = mail;
                  passwordMain = password;
                  debugPrint(
                      "mail $mail password $password validateDurum $validateDurum");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
