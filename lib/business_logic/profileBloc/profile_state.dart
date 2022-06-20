part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfilesLoaded extends ProfileState
{
  final Profile profile;
  ProfilesLoaded(this.profile);
}
class ProfilesError extends ProfileState
{

}
class ProfilePictureAdded extends ProfileState
{

}