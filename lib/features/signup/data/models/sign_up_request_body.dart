import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String email;
  final String password;

  SignUpRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
