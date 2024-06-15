import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:example/custom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestPage(),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TestPage()));
      }),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode textFieldFocusNode = FocusNode();
  final SingleValueDropDownController _cnt = SingleValueDropDownController();

  @override
  void dispose() {
    _cnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropDownTextField(
                    list: const [
                      DropDownValueModel(name: 'name1', value: "value1"),
                      DropDownValueModel(
                          name: 'name2',
                          value: "value2",
                          toolTipMsg:
                              "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                      DropDownValueModel(name: 'name3', value: "value3"),
                      DropDownValueModel(
                          name: 'name4',
                          value: "value4",
                          toolTipMsg:
                              "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                      DropDownValueModel(name: 'name5', value: "value5"),
                      DropDownValueModel(name: 'name6', value: "value6"),
                      DropDownValueModel(name: 'name7', value: "value7"),
                      DropDownValueModel(name: 'name8', value: "value8"),
                    ],
                    controller: _cnt,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  // DropDownTextField(
                  //   controller: _cnt,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Required field";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  //   onTapFunction: () {
                  //     if (_formKey.currentState!.validate()) {
                  //       print("DONE");
                  //     } else {
                  //       print("NOT DONE");
                  //     }
                  //   },
                  //   dropDownItemCount: 6,
                  //   dropDownList: const [
                  //     DropDownValueModel(name: 'name1', value: "value1"),
                  //     DropDownValueModel(
                  //         name: 'name2',
                  //         value: "value2",
                  //         toolTipMsg:
                  //             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                  //     DropDownValueModel(name: 'name3', value: "value3"),
                  //     DropDownValueModel(
                  //         name: 'name4',
                  //         value: "value4",
                  //         toolTipMsg:
                  //             "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                  //     DropDownValueModel(name: 'name5', value: "value5"),
                  //     DropDownValueModel(name: 'name6', value: "value6"),
                  //     DropDownValueModel(name: 'name7', value: "value7"),
                  //     DropDownValueModel(name: 'name8', value: "value8"),
                  //   ],
                  //   onChanged: (val) {},
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print("DONE");
          } else {
            print("NOT DONE");
          }
        },
        label: const Text("Submit"),
      ),
    );
  }
}
