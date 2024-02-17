
import 'package:doc_talk/features/parents_and_child_info_feature/widgets/bottom_sheet_widget.dart';
import 'package:doc_talk/features/parents_and_child_info_feature/widgets/child_linear_progress.dart';
import 'package:doc_talk/features/parents_and_child_info_feature/widgets/custom_button.dart';
import 'package:doc_talk/features/parents_and_child_info_feature/widgets/parent_linear_progress.dart';
import 'package:flutter/material.dart';


class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ParentLinearProgress(label: 'Parent Info', value: 1),
                ChildlinearProgressWidget(value: .5),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/children.png',
              width: 380,
              height: 210,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Add your child so that we can follow his activity and send you his progress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              label: 'Add Child',
              onTap: () {
                _showModalBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {

      return const BottomSheetWidget();
    },
  );
}
