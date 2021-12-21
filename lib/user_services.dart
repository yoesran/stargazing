import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stargazing/auth_services.dart';

import 'models/users.dart';

class UserServices {
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  static Future<void> saveUser(String id, email, name, noTelp, alamat, level1points, level2points, level3points, profilePicture) async {
    await userCollection.doc(id).set({
      "userID": id,
      "email": email,
      "name": name,
      "noTelp": noTelp,
      "alamat": alamat,
      "level1points": level1points,
      "level2points": level2points,
      "level3points": level3points,
      "profilePicture": profilePicture,
    });
  }

  static Future<void> updateUser(String id, email, name, noTelp, alamat, level1points, level2points, level3points, profilePicture) async {
    await userCollection.doc(id).update({
      "userID": id,
      "email": email,
      "name": name,
      "noTelp": noTelp,
      "alamat": alamat,
      "level1points": level1points,
      "level2points": level2points,
      "level3points": level3points,
      "profilePicture": profilePicture,
    });
  }

  static Future<dynamic> getUser(String userID) async {
    QuerySnapshot snapshot = await userCollection.where("userID", isEqualTo: userID).get();

    if (snapshot.docs.isEmpty) {
      return null;
    }
    return Users(
      userID,
      snapshot.docs[0].get("email"),
      name: snapshot.docs[0].get('name'),
      noTelp: snapshot.docs[0].get('noTelp'),
      alamat: snapshot.docs[0].get('alamat'),
      level1points: snapshot.docs[0].get('level1points'),
      level2points: snapshot.docs[0].get('level2points'),
      level3points: snapshot.docs[0].get('level3points'),
      profilePicture: snapshot.docs[0].get('profilePicture'),
    );
  }

  static Future<void> deleteUser(id, email, password) async {
    await AuthServices.delete(email, password);
    await userCollection.doc(id).delete();
  }
}
