import 'package:get_it/get_it.dart';
import 'package:posts_app_flutter/features/posts/data/datasources/post_local_data_source.dart';
import 'package:posts_app_flutter/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:posts_app_flutter/features/posts/data/repositories/post_repository_impl.dart';
import 'package:posts_app_flutter/features/posts/domain/repositories/posts_repository.dart';
import 'package:posts_app_flutter/features/posts/domain/usecases/add_post.dart';
import 'package:posts_app_flutter/features/posts/domain/usecases/delete_post.dart';
import 'package:posts_app_flutter/features/posts/domain/usecases/get_all_posts.dart';
import 'package:posts_app_flutter/features/posts/domain/usecases/update_post.dart';
import 'package:posts_app_flutter/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts_app_flutter/features/posts/presentation/bloc/posts/posts_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - posts

  // Bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
    addPost: sl(), 
    deletePost: sl(), 
    updatePost: sl()
  ));
  // Usecases
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));
  // Repository
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
    remoteDataSource: sl(), 
    localDataSource: sl(), 
    networkInfo: sl()
  ));
  // Datasources
  sl.registerLazySingleton<PostRemoteDateSource>(() => PostRemoteDateSourceImpl(
    client: sl(),
  ));
  sl.registerLazySingleton<PostLocalDateSource>(() => PostLocalDateSourceImpl(
    sharedPreferences: sl(),
  ));
  // Core

  // External
}