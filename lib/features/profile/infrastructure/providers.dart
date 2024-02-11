import 'package:Shinydeal/features/profile/domain/address.dart';
import 'package:Shinydeal/features/profile/domain/avatar_repo.dart';
import 'package:Shinydeal/features/profile/domain/user_profile.dart';
import 'package:Shinydeal/features/profile/infrastructure/avatar_file_repo.dart';
import 'package:Shinydeal/features/profile/infrastructure/fb_user_profile_repo.dart';
import 'package:Shinydeal/features/profile/infrastructure/map_api_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final profileRepoProvider = Provider<ProfileRepository>((ref) => FirebaseUserProfileRepository());
final addressProvider = Provider<AddressRepo>((ref) => MapApiRepo(dio: ref.watch(dioProvider)));
final dioProvider = Provider<Dio>((ref) => Dio());
final avatarRepoProvider = Provider<ProfpicRepo>((ref) => ProfpicRepository());
