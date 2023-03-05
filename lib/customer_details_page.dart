import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/add_user_page.dart';

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("HTTP API",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => AddUser(null),
                    ),
                  )
                      .then(
                        (value) {
                      if (value == true) {
                        setState(() {});
                      }
                    },
                  );
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            )
          ],
        ),
        body: FutureBuilder<http.Response>(
          builder: (context, snapshot) {
            if (snapshot != null && snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) => AddUser(
                              jsonDecode(snapshot.data!.body.toString())[index]),
                        ),
                      )
                          .then(
                            (value) {
                          if (value == true) {
                            setState(() {});
                          }
                        },
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (jsonDecode(snapshot.data!.body
                                        .toString())[index]['userName'])
                                        .toString(),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    (jsonDecode(snapshot.data!.body
                                        .toString())[index]['userIDNumber'])
                                        .toString(),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    (jsonDecode(snapshot.data!.body
                                        .toString())[index]['userNumber'])
                                        .toString(),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    (jsonDecode(snapshot.data!.body
                                        .toString())[index]['userAddress'])
                                        .toString(),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    (jsonDecode(snapshot.data!.body
                                        .toString())[index]['userArea'])
                                        .toString(),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    (jsonDecode(snapshot.data!.body
                                        .toString())[index]['userMilkLiter'])
                                        .toString(),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    (jsonDecode(snapshot.data!.body.toString())[
                                    index]['userMilkPrice'])
                                        .toString(),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    (jsonDecode(snapshot.data!.body.toString())[
                                    index]['userAdditional'])
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(
                                  MaterialPageRoute(
                                    builder: (context) => AddUser(jsonDecode(
                                        snapshot.data!.body.toString())[index]),
                                  ),
                                )
                                    .then(
                                      (value) {
                                    if (value == true) {
                                      setState(() {});
                                    }
                                  },
                                );
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                                size: 24,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                deleteUser((jsonDecode(
                                    snapshot.data!.body.toString())[index]['ID'])).then(
                                      (value) {
                                    setState(() {});
                                  },
                                );
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: jsonDecode(snapshot.data!.body.toString()).length,
              );
            } else {
              return Center(child: CircularProgressIndicator(color: Colors.black,));
            }
          },
          future: getAll(),
        ),
      ),
    );
  }

  Future<http.Response> getAll() async {
    print("api called ");
    var response = await http
        .get(Uri.parse("https://63f8b4e16978b1f9105f3fb5.mockapi.io/myfirstapi"));

    return response;
  }

  Future<void> deleteUser(ID) async {
    var response1 = await http.delete(
        Uri.parse("https://63f8b4e16978b1f9105f3fb5.mockapi.io/myfirstapi/$ID"));
  }
}
