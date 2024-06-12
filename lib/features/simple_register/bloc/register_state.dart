part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class MerchantRegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class MerchantRegister extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterError extends RegisterState {
  @override
  List<Object> get props => [];
}
