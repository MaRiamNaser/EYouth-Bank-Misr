import 'package:bank_misr/Data/models/User.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../Data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  late User profile;
 late String id;
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  Future<User>GetProfile(token,String userid)
  async {
    profile=await profileRepo.GetProfile(token,userid);
    id=userid;
    emit(ProfilesLoaded(profile));
    return profile;
  }

  Future<void> AddProfilePicture(token ,String path) async {
   await profileRepo.AddProfilePicture(token, path);
    emit(ProfilePictureAdded());
    GetProfile(token,id);
  }

  Future<void> EditBalance(token ,int amount) async {
    await profileRepo.EditBalance(token, amount);
    emit(BalanceAdded());
    GetProfile(token,id);
  }

  Future<User?> SearchKid(token ,String username) async {
   User? user= await profileRepo.SearchKid(token, username);
   return user;
  }

  Future<bool> AddKid(token ,String username,String parentid) async {
    print(token+" "+username+" "+parentid);
    bool success= await profileRepo.AddKid(token, username, parentid);
    if(success) {
      emit(KidAdded());
    }
    GetProfile(token,id);
    return true;
  }
}
