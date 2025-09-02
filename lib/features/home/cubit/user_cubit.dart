/*


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/home/cubit/user_state.dart';

import '../../auth/data/model/user_model.dart';
import '../data/repo/home_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);

  void controlUser(UserModel? user) {
    if (user == null) {
      getUser();
    } else {
      emit(UserSuccess(user: user));
    }
  }

  getUser() async {
    HomeRepo homeRepo = HomeRepo();
    emit(UserLoading());
    var response = await homeRepo.getUser();
    response.fold(
      (error) => emit(UserError(error: error)),
      (user) => emit(UserSuccess(user: user)),
    );
  }
}
*/
