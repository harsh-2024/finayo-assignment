import 'package:finayo_assignment/utils/file_handler.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _field1Controller = TextEditingController();
  TextEditingController _field2Controller = TextEditingController();
  TextEditingController _field3Controller = TextEditingController();
  TextEditingController _field4Controller = TextEditingController();
  TextEditingController _field5Controller = TextEditingController();
  bool isSelected = false;
  bool isObsucred = false;
  bool isopening = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _field1Controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field 1 is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
                TextFormField(
                  controller: _field2Controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field 2 is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                TextFormField(
                  controller: _field3Controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field 3 is required';
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(labelText: 'Your current address'),
                ),
                TextFormField(
                  obscureText: isObsucred,
                  controller: _field4Controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field 4 is required';
                    }
                    if (value.length < 8) {
                      return 'Password should have 8 or more characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Your Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObsucred = !isObsucred;
                          });
                        },
                        child: !isObsucred
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      )),
                ),
                CheckboxListTile(
                  value: isSelected,
                  onChanged: (value) {
                    isSelected = !isSelected;
                    setState(() {});
                  },
                  title: const Text('Remember me ?'),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm Submission?'),
                              content: const Text(
                                  'Are you sure you want to submit the form?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    saveDataToFile(
                                            _field1Controller.text,
                                            _field2Controller.text,
                                            _field3Controller.text,
                                            _field4Controller.text,
                                            isSelected.toString())
                                        .then((value) {
                                      showAdaptiveDialog(
                                        context: context,
                                        builder: (context) =>
                                            const AlertDialog.adaptive(
                                          title: Text('Form Submitted'),
                                          content: Text(
                                              'Your data has been saved to text file. Saved to \n Downloads/Finayo '),
                                        ),
                                      );
                                    });
                                  },
                                  child: const Text('OK'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('SUBMIT'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
