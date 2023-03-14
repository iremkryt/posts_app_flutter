import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_flutter/features/posts/domain/entities/post.dart';
import 'package:posts_app_flutter/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts_app_flutter/features/posts/presentation/widgets/post_add_update_page/form_submit_btn.dart';
import 'package:posts_app_flutter/features/posts/presentation/widgets/post_add_update_page/text_form_field_widget.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePost;
  final Post? post;
  const FormWidget({super.key, required this.isUpdatePost, this.post});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePost) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormFieldWidget(
            name: "Title",
            multiLines: false,
            controller: _titleController
          ),
          TextFormFieldWidget(
            name: "Body",
            multiLines: false,
            controller: _titleController
          ),
          FormSubmitBtn(
            isUpdatePost: widget.isUpdatePost,
            onPressed: validateFormThenUpdateOrAddPost
          ),
        ],
      ),
    );
  }
  void validateFormThenUpdateOrAddPost(){
    final isValid = _formKey.currentState!.validate();
     if (isValid) {
      final post = Post(
          id: widget.isUpdatePost ? widget.post!.id : null,
          title: _titleController.text,
          body: _bodyController.text);

      if (widget.isUpdatePost) {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }
}