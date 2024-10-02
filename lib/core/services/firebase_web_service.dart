import 'package:carlog/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseWebService {
  init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
