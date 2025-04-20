import 'package:besta/core/services/data_base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FireStoreService implements DataBaseService{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? documentID}) async{
    if(documentID != null){
      await fireStore.collection(path).doc(documentID).set(data);
    }else{
      await fireStore.collection(path).add(data);
    }
  }
  
  @override
  Future<Map<String, dynamic>> getData({required String path, required String documentID}) async{
    var data = await fireStore.collection(path).doc(documentID).get();
    return data.data() as Map<String, dynamic>;
  }

}