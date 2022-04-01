import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spike_codeshastra/Services/service.dart';

final _firestore = FirebaseFirestore.instance;


class DialogProjectSub {
  static exit(context) => showDialog(
      context: context, builder: (context) => ExitConfirmationDialog());
}

class ExitConfirmationDialog extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _ExitConfirmationDialogState createState() => _ExitConfirmationDialogState();
}

class _ExitConfirmationDialogState extends State<ExitConfirmationDialog> {
  DataService d1=new DataService();

  // final _auth = FirebaseAuth.instance;

  late String name;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      //backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
      width: 350,
      height: 220,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text("Delete Project",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Name",
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    // enableInteractiveSelection: false,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                      ),
                      hintText: 'Enter your Name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () async {
                            try {

                              d1.deleteproj(name);

                              Navigator.pop(context);
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            // background color
                              primary: Colors.red[900],
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          )
      ));
}
