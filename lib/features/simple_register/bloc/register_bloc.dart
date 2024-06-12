import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_posui_pocket/core/preferences_keys.dart';
import 'package:flutter_posui_pocket/features/simple_register/repository/register_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository repository = RegisterRepositoryImpl();

  RegisterBloc() : super(RegisterInitial()) {
    init();
  }

  init() {
    addListener();
  }

  addListener() {
    on<RegisterEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (event is MerchantRegisterEvent) {
        emit(RegisterLoading());
        try {
          final result = await repository.registerBasicData(
              event.bussinessName,
              event.industry,
              event.rfc,
              event.contactPhone,
              event.email,
              event.clabeAccount);
          prefs.setString(PreferencesKeys.tokenKey, result);
          emit(MerchantRegisterInitial());
        } on DioException {
          emit(RegisterError());
        }
      }
    });
  }
}
