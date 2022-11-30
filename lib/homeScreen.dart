import 'package:flutter/material.dart';
import 'package:flutterdemo/fireStoredatabase.dart';
import 'package:flutterdemo/shrFile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffDFE0E4),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff857EF0),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 200,
                  child: FlutterLogo(
                    size: 80,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: txtEmail,
                        decoration: InputDecoration(
                           hintText: "Email"
                        ),
                      ),
                      TextField(
                        controller:  txtPass,

                        decoration: InputDecoration(
                            hintText: "Password"
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {

                            String email = txtEmail.text;
                            String password = txtPass.text;

                            insertShrData(email, password);

                          },
                          child: Text("Write"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff857EF0)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () async{

                             List l1 = await readShrData();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${l1[0]} ${l1[1]}")));
                          },
                          child: Text(
                            "Read",
                            style: TextStyle(color: Color(0xff857ef0)),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.0, color: Color(0xff857ef0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
*   Default State
*
*   RxState
*
*
* */
