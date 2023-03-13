import 'package:dartz/dartz.dart';
import 'package:posts_app_flutter/core/error/failures.dart';
import 'package:posts_app_flutter/features/posts/domain/repositories/posts_repository.dart';

import '../entities/post.dart';

class AddPostUsecase {
  final PostsRepository repository;

  AddPostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}