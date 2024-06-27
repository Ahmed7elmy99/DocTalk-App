import 'dart:io';

import 'package:doc_talk/app/utils/colors.dart';
import 'package:doc_talk/features/parents_and_child_info_feature/widgets/child_linear_progress.dart';
import 'package:doc_talk/features/parents_and_child_info_feature/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth_feature/presentation/cubit/auth_cubit.dart';

class Third extends StatefulWidget {
  const Third(
      {Key? key,
      required this.childName,
      required this.imagePath,
      required this.avatarImagePath,
      required this.age,
      required this.gender})
      : super(key: key);
  final String childName;
  final String imagePath;
  final String gender;
  final String avatarImagePath;
  final int age;

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().avatarPath =
        widget.imagePath != '' ? widget.imagePath : widget.avatarImagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Children"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: <Widget>[
          const ChildlinearProgressWidget(value: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: widget.imagePath != ''
                      ? FileImage(File(widget.imagePath)) as ImageProvider
                      : AssetImage(widget.avatarImagePath),
                  minRadius: 40,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 5,
                          backgroundColor: AppColors.greenColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.childName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Text('Dosent use the app yet'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              label: 'Next',
              onTap: () {
                AuthCubit.get(context).signup(
                  context: context,
                  name: widget.childName,
                  image: widget.imagePath,
                  gender: widget.gender,
                  age: widget.age,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
