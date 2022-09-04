import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Form Fields'),
        backgroundColor: Colors.redAccent,
      ),
      body: _uiWidget(),
    );
  }

  Widget _uiWidget() {
    return Form(
        key: globalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FormHelper.inputFieldWidgetWithLabel(
                  context,
                  prefixIcon: Icon(Icons.web),
                  "username",
                  "user Nmae",
                  "",
                  (onValidate) {
                    if (onValidate.isEmpty) {
                      return "user name is required";
                    }
                    return null;
                  },
                  (onSaved) {
                    userModel.userName = onSaved;
                  },
                  initialValue: userModel.userName ?? "",
                  borderColor: Colors.redAccent,
                  borderFocusColor: Colors.redAccent,
                  borderRadius: 2,
                  fontSize: 14,
                )
              ],
            ),
          ),
        ));
  }
}
