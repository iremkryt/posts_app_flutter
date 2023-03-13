import 'package:dartz/dartz.dart';
import 'package:posts_app_flutter/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';

class GetAllPostsUsecase{
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async{
    return await repository.getAllPosts();
  }
}