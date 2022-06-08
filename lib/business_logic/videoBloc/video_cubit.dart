import 'package:bank_misr/data/models/Video.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repo/video_repo.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepo videoRepo;
  List<Video> videos=[];
  VideoCubit(this.videoRepo) : super(VideoInitial());
  Future<List<Video>>GetAllVideos(Url)
  async {
    videos=await videoRepo.GetAllVideos(Url);
    emit(VideosLoaded(videos));
    return videos;
  }
}
