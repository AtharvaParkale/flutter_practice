part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initHome();
}

void _initHome() {
  // Datasource
  serviceLocator
    ..registerFactory<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(),
    )
    // Repository
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => AllTopics(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => HomeBloc(
        allTopics: serviceLocator(),
      ),
    );
}
