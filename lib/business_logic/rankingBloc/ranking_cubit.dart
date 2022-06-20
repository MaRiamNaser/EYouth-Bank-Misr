import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ranking_state.dart';

class RankingCubit extends Cubit<RankingState> {
  RankingCubit() : super(RankingInitial());
}
