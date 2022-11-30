import 'package:flutter/material.dart';
import 'package:flutterdemo/notiServices.dart';

class NOtificationScreen extends StatefulWidget {
  const NOtificationScreen({Key? key}) : super(key: key);

  @override
  State<NOtificationScreen> createState() => _NOtificationScreenState();
}

class _NOtificationScreenState extends State<NOtificationScreen> {
  @override
  void initState() {
    super.initState();
    initServices(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ElevatedButton(onPressed: () {}, child: Text("Data")),
      ),
    );
  }


}
