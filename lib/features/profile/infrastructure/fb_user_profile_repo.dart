import 'package:Shinydeal/features/profile/domain/address.dart';
import 'package:Shinydeal/features/profile/domain/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _database = FirebaseFirestore.instance;
const _userProfileCollection = 'user_profiles';

class FirebaseUserProfileRepository extends ProfileRepository {
  UserProfile _userProfileFromFirestore(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? options,
  ) => UserProfile.fromJson(snapshot.data() ?? {});

  Map<String, dynamic> _userProfileToFirestore(UserProfile profile, SetOptions? options) => profile.toJson();

  @override
  Future<UserProfile> createUserProfile(String uid) async {
    final profile = UserProfile(uid: uid, phone: '', address: const Address(
      city: '',
      street: '',
      houseNumber: ''
      )
    );
    await _database
        .collection('user_profiles')
        .withConverter(
            fromFirestore: _userProfileFromFirestore,
            toFirestore: _userProfileToFirestore)
        .doc(uid)
        .set(profile);
    return profile;
  }

  @override
  Future<UserProfile> getUserProfile(String uid) async {
    final snapshot = await _database
        .collection(_userProfileCollection)
        .withConverter(
            fromFirestore: _userProfileFromFirestore,
            toFirestore: _userProfileToFirestore)
        .doc(uid)
        .get();
    final profile = snapshot.data();
    if (profile == null) {
      return createUserProfile(uid);
    }
    return profile;
  }

  @override
  Future<UserProfile> updateUserProfile(UserProfile profile) async {
    await _database
        .collection(_userProfileCollection)
        .withConverter(
            fromFirestore: _userProfileFromFirestore,
            toFirestore: _userProfileToFirestore)
        .doc(profile.uid)
        .set(profile);
    return profile;
  }
}


