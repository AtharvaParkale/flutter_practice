import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/common/widgets/loader.dart';
import 'package:flutter_practice/core/utils/show_snackbar.dart';
import 'package:flutter_practice/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_practice/features/home/presentation/widgets/topic_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetAllTopicsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.add_circled,
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is TopicFailureState) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is AllTopicsLoadingState) {
            return const Loader();
          }
          if (state is AllTopicsDisplaySuccessState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  crossAxisSpacing: 8.0, // Space between columns
                  mainAxisSpacing: 8.0, // Space between rows
                ),
                itemCount: state.topics.length,
                itemBuilder: (context, index) {
                  final topic = state.topics[index];
                  return TopicCard(topic: state.topics[index]);
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
