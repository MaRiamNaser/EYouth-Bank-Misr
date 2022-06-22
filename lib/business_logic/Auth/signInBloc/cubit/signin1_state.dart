part of 'signin1_cubit.dart';

@immutable
abstract class Signin1State {}

class Signin1Initial extends Signin1State {}


class UserSignedIn extends Signin1State
{
  final User user;
  UserSignedIn(this.user);
  
}