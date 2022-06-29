import 'package:bank_misr/app/app_prefs.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bank_misr/data/models/User.dart';
import 'package:bank_misr/data/repo/authentication/signin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signin1_state.dart';

class Signin1Cubit extends Cubit<Signin1State> {
  final SignInRepo signinRepo;
  User? user ;
  String? token;
  AppPreferences appPreferences =AppPreferences();
  Signin1Cubit(this.signinRepo) : super(Signin1Initial());

  ///sign in cubit returns user if signed in successfully.
  Future<User?> signIn(String email, String password) async {
    user = await signinRepo.signIn(email, password);
    token = signinRepo.getToken();
     if(user != null)
     {
           appPreferences.saveTokenAndUserIdToSharedPrefrences(token!, user!.sId!);
            emit(UserSignedIn(user!));
             return user!;
     }
   return null;
  }
}
