import 'package:bank_misr/data/repo/authentication/signup_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
   final SignUpRepo signupRepo;
  SignUpCubit(this.signupRepo) : super(SignUpInitial());

  Future<bool>signUp(String fullname,String username,String email,String password,String age) async {
   bool result = await signupRepo.signUp(fullname, username, email, password, age);
   print("****************************************************************Hello");
   print(result);
   if(result){
    emit(UserSignedUpSuccessfully());
   }else{
    emit(SignUpError());
   }

    return result;
  }

  Future<bool>isEmailExist(String email) async {
   
   bool result = await signupRepo.isEmailExist(email);
    return result;
  }

   Future<bool>isUserNameExist(String userName) async {
   bool result = await signupRepo.isUserNameExist(userName);
    return result;
  }
}


