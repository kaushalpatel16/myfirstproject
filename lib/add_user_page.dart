import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  AddUser(this.map);

  Map? map;

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userIDNumberController = TextEditingController();
  TextEditingController userNumberController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  TextEditingController userAreaController = TextEditingController();
  TextEditingController userMilkLiterController = TextEditingController();
  TextEditingController userMilkPriceController = TextEditingController();
  TextEditingController userAdditionalController =TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userNameController.text = widget.map == null ? "" : widget.map!['userName'];
    userIDNumberController.text = widget.map == null ? "" : widget.map!['userIDNumber'];
    userNumberController.text =widget.map == null ? "" : widget.map!['userNumber'];
    userAddressController.text = widget.map == null ? "" : widget.map!['userAddress'];
    userAreaController.text = widget.map == null ? "" : widget.map!['userArea'];
    userMilkLiterController.text = widget.map == null ? "" : widget.map!['userMilkLiter'];
    userMilkPriceController.text =widget.map == null ? "" : widget.map!['userMilkPrice'];
    userAdditionalController.text = widget.map == null ? "" : widget.map!['userAdditional'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.grey[200],
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().length == 0) {
                              return 'Enter Valid Name';
                            }
                            return null;
                          },
                          controller: userNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter  userName",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().length == 0) {
                              return 'Enter Valid userIDNumber';
                            }
                            return null;
                          },
                          controller: userIDNumberController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter userIDNumber",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().length == 0) {
                              return 'Enter Valid userNumber';
                            }
                            return null;
                          },
                          controller: userNumberController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter userNumber",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.trim().length == 0) {
                              return 'Enter Valid userAddress';
                            }
                            return null;
                          },
                          controller: userAddressController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter userAddress",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.trim().length == 0) {
                              return 'Enter Valid userArea';
                            }
                            return null;
                          },
                          controller: userAreaController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter userArea",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.trim().length == 0) {
                              return 'Enter Valid userMilkLiter';
                            }
                            return null;
                          },
                          controller: userMilkLiterController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter userMilkLiter",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.trim().length == 0) {
                              return 'Enter Valid userAdditional';
                            }
                            return null;
                          },
                          controller: userAdditionalController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter userAdditional",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.trim().length == 0) {
                              return 'Enter Valid userMilkPrice';
                            }
                            return null;
                          },
                          controller: userMilkPriceController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter userMilkPrice",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(
                            () async {
                          if (_formKey.currentState!.validate()) {
                            if (widget.map == null) {
                              addUser().then(
                                    (value) => Navigator.of(context).pop(true),
                              );
                            } else {
                              updateUser(widget.map!['ID']).then(
                                    (value) => Navigator.of(context).pop(true),
                              );
                            }
                          }
                        },
                      );
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addUser() async {
    Map map = {};
    map['userName'] = userNameController.text;
    map['userIDNumber'] = userIDNumberController.text;
    map['userNumber'] = userNumberController.text;
    map['userAddress'] = userAddressController.text;
    map['userArea'] = userAreaController.text;
    map['userMilkLiter'] = userMilkLiterController.text;
    map['userMilkPrice'] = userMilkPriceController.text;
    map['userAdditional'] = userAdditionalController.text;

    var response1 = await http.post(
        Uri.parse("https://63f8b4e16978b1f9105f3fb5.mockapi.io/myfirstapi"),
        body: map);
    print(response1.body);
  }

  Future<void> updateUser(ID) async {
    Map map = {};
    map['userName'] = userNameController.text;
    map['userIDNumber'] = userIDNumberController.text;
    map['userNumber'] = userNumberController.text;
    map['userAddress'] = userAddressController.text;
    map['userArea'] = userAreaController.text;
    map['userMilkLiter'] = userMilkLiterController.text;
    map['userMilkPrice'] = userMilkPriceController.text;
    map['userAdditional'] = userAdditionalController.text;

    var response1 = await http.put(
        Uri.parse("https://63f8b4e16978b1f9105f3fb5.mockapi.io/myfirstapi/$ID"),
        body: map);
    print(response1.body);
  }
}
