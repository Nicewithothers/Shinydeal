import 'package:Shinydeal/features/profile/domain/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required String? phone,
    required Address address,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}

abstract class ProfileRepository {
  Future<UserProfile> createUserProfile(String uid);
  Future<UserProfile> getUserProfile(String uid);
  Future<UserProfile> updateUserProfile(UserProfile profile);
}