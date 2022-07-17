part of 'ranking_cubit.dart';

@immutable
abstract class RankingState {}

class RankingInitial extends RankingState {}

class RankingLoaded extends RankingState {
  List<User> users;

  RankingLoaded(this.users);

}

