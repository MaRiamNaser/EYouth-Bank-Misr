part of 'signup_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class UserSignedUpSuccessfully extends SignUpState
{
  
  
}
class SignUpError extends SignUpState
{

}

