import 'package:dartz/dartz.dart';
import 'package:posts_app_flutter/core/error/failures.dart';
import 'package:posts_app_flutter/features/posts/domain/repositories/posts_repository.dart';

class DeletePostUsecase {
  final PostsRepository repository;

  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}