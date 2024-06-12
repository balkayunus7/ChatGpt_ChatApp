import 'package:chatgpt_app/application/home/home_bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

Future<bool> setupApplicationInjector() async {
  try {
    await getIt.reset();
    _injectAppApplicationLayer();

    return true;
  } catch (e) {
    return false;
  }
}

final getIt = GetIt.instance;
void _injectAppApplicationLayer() {
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(),
  );
}
