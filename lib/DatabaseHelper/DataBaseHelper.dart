import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warsha/Models/User.dart';

CollectionReference<User> getUserCollectionWithConverter(){
  return FirebaseFirestore.instance.collection(User.COLLECTION_NAME).withConverter<User>(
    fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
    toFirestore: (user, _) => user.toJson(),
  );
}