import 'package:chatgpt_app/application/home_bloc/home_bloc.dart';
import 'package:chatgpt_app/application/movie_detail_cubit/movie_detail_cubit.dart';
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

  getIt.registerFactory<MovieDetailCubit>(
    () => MovieDetailCubit(),
  );
}
