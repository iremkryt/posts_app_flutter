import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_app_flutter/core/error/exception.dart';
import 'package:posts_app_flutter/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDateSource{
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

const CACHED_POSTS = "CACHED_POSTS";

class PostLocalDateSourceImpl implements PostLocalDateSource{
  final SharedPreferences sharedPreferences;

  PostLocalDateSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    List postModelsToJson = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
      sharedPreferences.setString(CACHED_POSTS, json.encode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if(jsonString != null){
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModels = decodeJsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheException();
    }
  }

}