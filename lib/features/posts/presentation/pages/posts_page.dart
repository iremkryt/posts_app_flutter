import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_flutter/core/widgets/loading_widget.dart';
import 'package:posts_app_flutter/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:posts_app_flutter/features/posts/presentation/widgets/message_display_widget.dart';
import 'package:posts_app_flutter/features/posts/presentation/widgets/post_list_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody(), floatingActionButton: _buildFloatingBtn());
  }

  AppBar _buildAppbar() => AppBar(title: Text('Posts'),);
  Widget _buildBody(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {//post_state.dart'ta belirtilen state özelliklerini kullandık
          if(state is LoadingPostsState) {
            return LoadingWidget();
          }else if (state is LoadedPostsState) {
            return PostListWidget(
              posts: state.posts
            );
          }else if (state is ErrorPostsState) {
            return MessageDisplayWidget(
              message: state.message
            );
          }
          return LoadingWidget();
        }
      ),
    );
  }
  Widget _buildFloatingBtn(){
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }
}