import 'package:dartz/dartz.dart';
import 'package:posts_app_flutter/features/posts/domain/entities/post.dart';

import '../../../../core/error/failures.dart';

abstract class PostsRepository{

  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> addPost(Post post);
}
