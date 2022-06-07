part of 'video_cubit.dart';

@immutable
abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideosLoaded extends VideoState
{
  final List<Video> Videos;
  VideosLoaded(this.Videos);
}
class VideosError extends VideoState
{

}
