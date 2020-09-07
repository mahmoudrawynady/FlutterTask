import 'package:course_project/src/model/data.dart';
import 'package:course_project/src/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _userRepository = UserRepository();
  final _userFetcher = PublishSubject<UserData>();


  Observable<UserData> get allUsers => _userFetcher.stream;

  fetchAllUsers() async {
    UserData itemModel = await _userRepository.fetchAllUsers();
    _userFetcher.sink.add(itemModel);
  }

  dispose() {
    _userFetcher.close();
  }
}

final bloc = UserBloc();