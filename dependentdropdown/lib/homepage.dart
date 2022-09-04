import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> countries = [];
  List<dynamic> statesMasters = [];
  List<dynamic> state = [];
  String? stateId;
  String? countryId;

  @override
  void initState() {
    super.initState();
    this.countries.add({"id": 1, 'label': "India"});
    this.countries.add({"id": 2, 'label': "UAE"});

    statesMasters = [
      {"id": 2, 'name': "Bihar", 'ParentId': 1},
      {"id": 1, 'name': "Andhra Pradesh", 'ParentId': 1},
      {"id": 3, 'name': "Delhi", 'ParentId': 1},
      {"id": 4, 'name': "punjab", 'ParentId': 1},
      {"id": 1, 'name': "Abu Dhabi", 'ParentId': 2},
      {"id": 2, 'name': "Dubai", 'ParentId': 2},
      {"id": 3, 'name': "Sharjah", 'ParentId': 2},
      {"id": 4, 'name': "ajman", 'ParentId': 2},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter-Dependent Dropdown'),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            FormHelper.dropDownWidgetWithLabel(
              context,
              'Country',
              'Select Country',
              this.countryId,
              this.countries,
              (onChangedVal) {
                this.countryId = onChangedVal;
                log('Select Country: $onChangedVal');
                this.state = this
                    .statesMasters
                    .where((stateItem) =>
                        stateItem['ParentId'].toString() ==
                        onChangedVal.toString())
                    .toList();
                this.stateId = null;
                setState(() {});
              },
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Please select country';
                }
                return null;
              },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "id",
              optionLabel: "label",
            ),
            SizedBox(
              height: 10,
            ),
            FormHelper.dropDownWidgetWithLabel(
              context,
              'State',
              'Select State',
              this.stateId,
              this.state,
              (onChange) {
                this.stateId = onChange;

                log('Select State: $onChange');
              },
              (onValidate) {
                return null;
              },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "id",
              optionLabel: "name",
            )
          ],
        ),
      ),
    );
  }
}
