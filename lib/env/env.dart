import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied()
abstract class Env {

  @EnviedField(varName: 'TEMPLATE_ID', defaultValue: '')
  static String templateId = _Env.templateId;  

  @EnviedField(varName: 'SERVICE_ID', defaultValue: '')
  static String serviceId = _Env.serviceId;

  @EnviedField(varName: 'PUBLIC_KEY', defaultValue: '')
  static String publicKey = _Env.publicKey;

  @EnviedField(varName: 'PRIVATE_KEY', defaultValue: '')
  static String privateKey = _Env.privateKey;

}