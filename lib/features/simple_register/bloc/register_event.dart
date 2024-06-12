part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class MerchantRegisterEvent extends RegisterEvent {
  final String bussinessName;
  final String industry;
  final String rfc;
  final String contactPhone;
  final String email;
  final String clabeAccount;

  const MerchantRegisterEvent(this.bussinessName, this.industry, this.rfc,
      this.contactPhone, this.email, this.clabeAccount);

  @override
  List<Object?> get props => [];
}
