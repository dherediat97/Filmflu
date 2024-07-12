part of '../di.dart';

final uiModulesDi = GetIt.instance;

void _uiModulesInit() {
  uiModulesDi.registerFactory(
    () => LanguageCubit(
      appLocalDataSourceContract: uiModulesDi(),
    ),
  );

  uiModulesDi.registerFactory(
    () => SplashBloc(),
  );

  uiModulesDi.registerFactory(
    () => MediaListBloc(
      repositoryContract: uiModulesDi(),
    ),
  );

  uiModulesDi.registerFactory(
    () => MediaDetailBloc(
      repositoryContract: uiModulesDi(),
    ),
  );
  uiModulesDi.registerFactory(
    () => PersonDetailsBloc(
      repositoryContract: uiModulesDi(),
    ),
  );
}
