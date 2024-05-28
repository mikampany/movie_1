import 'package:stacked/stacked.dart';

class MoviePageViewModel extends FutureViewModel<String> {
  MoviePageViewModel({required this.id});
  final int id;

  @override
  Future<String> futureToRun() async{
    return 'hello';
  }
}
