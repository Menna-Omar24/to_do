import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/profile/cubit/language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(InitialState());

  static LanguageCubit get(context) => BlocProvider.of(context);

  String lang = 'en';

  void changeLanguage(String selectedLang) {
    lang = selectedLang;
    emit(LanguageChange());
  }
}

