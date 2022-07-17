import 'package:bank_misr/Data/models/User.dart';
import 'package:bank_misr/Data/repo/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ranking_state.dart';

class RankingCubit extends Cubit<RankingState> {
  final UserRepo userRepo;
  List<User> users=[];
  RankingCubit(this.userRepo) : super(RankingInitial());
  Future <List<User>>GetFirstUsers()async
  {
    users=await userRepo.GetFirstUsers();
    emit(RankingLoaded(users));
    return users;
  }
  Future <List<User>>GetNextUsers(int index)async
  {
    users=await userRepo.GetNextUsers(index);
    return users;
  }
}
