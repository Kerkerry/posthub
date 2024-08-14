import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posthub/src/posts/presentation/bloc/post_bloc.dart';
import 'package:posthub/src/users/presentation/widgets/loading_column.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key, required this.id});
  final int id;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  void getPost() {
    context.read<PostBloc>().add(GetPostEvent(id: widget.id));
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Post detail"),
            ),
            body: state is GettingPostState
                ? const LoadingColumn(message: "Getting post")
                : state is PostLoadedState
                    ? const Center(
                        child: Text("Post loaded"),
                      )
                    : state is PostErrorState
                        ? Center(
                            child: Text(state.message),
                          )
                        : const SizedBox.shrink());
      },
    );
  }
}
