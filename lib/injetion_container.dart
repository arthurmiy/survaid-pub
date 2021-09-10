import 'package:capimobile/features/repository/data/datasource/firebase_remote_datasource.dart';
import 'package:capimobile/features/repository/data/repositories/firebase_repository_impl.dart';
import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';
import 'package:capimobile/features/repository/domain/usecases/append_new_camera_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/append_new_survey_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/delete_camera_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/get_cameras_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/get_current_uid.dart';
import 'package:capimobile/features/repository/domain/usecases/get_logged_user_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/get_surveys_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/is_signing_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/listen_user_events.dart';
import 'package:capimobile/features/repository/domain/usecases/resend_confirmation_email_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/sign_out_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/signin_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/signup_usecase.dart';
import 'package:capimobile/features/repository/presentation/cubit/camera/camera_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/login/login_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/survey/survey_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/user/user_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/repository/domain/usecases/delete_survey_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features bloc,
  sl.registerFactory<CameraCubit>(() => CameraCubit(
      appendNewCameraUsecase: sl.call(),
      getCamerasUsecase: sl.call(),
      deleteCameraUsecase: sl.call()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(
        singInUsecase: sl.call(),
        signUpUsecase: sl.call(),
        signOutUsecase: sl.call(),
        resendConfirmationEmailUsecase: sl.call(),
      ));
  sl.registerFactory<SurveyCubit>(() => SurveyCubit(
      appendNewSurveyUsecase: sl.call(),
      getSurveysUsecase: sl.call(),
      deleteSurveyUsecase: sl.call()));
  sl.registerFactory<UserCubit>(() => UserCubit(
      getCurrentUidUsecase: sl.call(),
      getLoggedUserUsecase: sl.call(),
      listenUserEventsUsecase: sl.call()));

  //!useCase
  sl.registerLazySingleton<AppendNewCameraUsecase>(
      () => AppendNewCameraUsecase(repository: sl.call()));
  sl.registerLazySingleton<AppendNewSurveyUsecase>(
      () => AppendNewSurveyUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCamerasUsecase>(
      () => GetCamerasUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUid>(
      () => GetCurrentUid(repository: sl.call()));
  sl.registerLazySingleton<GetLoggedUser>(
      () => GetLoggedUser(repository: sl.call()));
  sl.registerLazySingleton<GetSurveysUsecase>(
      () => GetSurveysUsecase(repository: sl.call()));
  sl.registerLazySingleton<IsSingningUsecase>(
      () => IsSingningUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUsecase>(
      () => SignOutUsecase(repository: sl.call()));
  sl.registerLazySingleton<SingInUsecase>(
      () => SingInUsecase(repository: sl.call()));
  sl.registerLazySingleton<ResendConfirmationEmailUsecase>(
      () => ResendConfirmationEmailUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(repository: sl.call()));
  sl.registerLazySingleton<DeleteCameraUsecase>(
      () => DeleteCameraUsecase(repository: sl.call()));
  sl.registerLazySingleton<DeleteSurveyUsecase>(
      () => DeleteSurveyUsecase(repository: sl.call()));
  sl.registerLazySingleton<ListenUserEventsUsecase>(
      () => ListenUserEventsUsecase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FireBaseRepositoryImpl(fireBaseRemoteDataSource: sl.call()));
  //dataSource
  sl.registerLazySingleton<FireBaseRemoteDataSource>(
      () => FireBaseRemoteDataSourceImpl());
}
