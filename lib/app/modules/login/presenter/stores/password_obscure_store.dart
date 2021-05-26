import 'package:flutter_triple/flutter_triple.dart';

class PasswordObsctureStore extends NotifierStore<Exception, bool> {
  PasswordObsctureStore() : super(true);

  togglePasswordObscture() {
    setLoading(true);
    update(!state);
    setLoading(false);
  }
}
