part of '../di.dart';

final uiModulesDi = GetIt.instance;

void _uiModulesInit() {
  uiModulesDi.registerFactory(
    () => LanguageCubit(),
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
    () => PersonDetailBloc(
      repositoryContract: uiModulesDi(),
    ),
  );
}
