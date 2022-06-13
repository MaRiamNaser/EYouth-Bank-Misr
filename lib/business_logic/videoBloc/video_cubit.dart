import 'package:bank_misr/Data/models/Video.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/repo/video_repo.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepo videoRepo;
  List<Video> videos=[];
  VideoCubit(this.videoRepo) : super(VideoInitial());
  Future<List<Video>>GetAllVideos(courseid)
  async {
    videos=await videoRepo.GetAllVideos(courseid);
    emit(VideosLoaded(videos));
    return videos;
  }
}
