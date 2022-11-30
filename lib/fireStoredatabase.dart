import 'package:cloud_firestore/cloud_firestore.dart';

void insertData() {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionReference = firestore.collection("Parent");
  collectionReference
      .add({"id": "1", "name": "MansukhaBhai", "mobile": "1122445566"})
      .then((value) => print("Success"))
      .catchError((error) => print("$error"));
}


Future<QuerySnapshot> readData()
{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionReference = firestore.collection("Parent");
   return collectionReference.get();
}


