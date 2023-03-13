import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app_flutter/core/app_theme.dart';
import 'package:posts_app_flutter/core/network/network_info.dart';
import 'package:posts_app_flutter/features/posts/data/datasources/post_local_data_source.dart';
import 'package:posts_app_flutter/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:posts_app_flutter/features/posts/data/repositories/post_repository_impl.dart';
import 'package:posts_app_flutter/features/posts/domain/usecases/get_all_posts.dart';
import 'package:posts_app_flutter/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts_app_flutter/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences,));
} 

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> PostsBloc(getAllPosts: GetAllPostsUsecase(
          PostsRepositoryImpl(
            remoteDataSource: PostRemoteDateSourceImpl(client: Client()), 
            localDataSource: PostLocalDateSourceImpl(sharedPreferences: sharedPreferences), 
            networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
          )
        )))
        AddDeleteUpdatePostBloc(
          addPost: , 
          deletePost: , 
          updatePost: ,
        ),
      ], 
      child: MaterialApp(
        theme: appTheme,
        title: 'Posts App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('POSTS'),
          ),
          body: Center(
            child: Container(
              child: Text('Post Appe hoşgeldiniz'),
            ),
          ),
        ),
      ), 
    );

    
  }
}