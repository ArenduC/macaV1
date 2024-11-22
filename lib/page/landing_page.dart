import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maca/connection/api_connection.dart';
import 'package:maca/function/app_function.dart';
import 'package:maca/service/api_service.dart';
import 'package:maca/store/local_store.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  dynamic borderListData = [];

  @override
  void initState() {
    super.initState();
    borderList();
    getLoginDetails();
  }

  Future<void> borderList() async {
    dynamic response = await ApiService()
        .apiCallService(endpoint: PostUrl().borderList, method: "GET");

    if (kDebugMode) {
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
        setState(() {
          borderListData = data["data"];
        });
        print("object: $borderListData");
      }
    }
  }

  getLoginDetails() async {
    dynamic loginDetails;
    loginDetails = await LocalStore().getStore(ListOfStoreKey.loginDetails);
    AppFunction().macaPrint(loginDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('maca'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Border list"),
            GestureDetector(
              onTap: () {
                borderList();
              },
              child: const Text("refresh"),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: borderListData.length,
                itemBuilder: (context, index) {
                  final user = borderListData[index];
                  return Container(
                    height: 50,
                    width: double.infinity, // Make it take full width
                    alignment: Alignment.centerLeft, // Align text to the left
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      user["email"],
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
          ],
        )));
  }
}
