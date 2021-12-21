import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stargazing/controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);
  final String? text;
  final int? index;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(null),
      builder: (qnController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: press,
            child: Container(
              width: MediaQuery.of(context).size.width / 2 - 20,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: (index == qnController.selectedIndex) ? Border.all(color: Colors.blue) : Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "$text",
                style: TextStyle(color: (index == qnController.selectedIndex) ? Colors.blue : Colors.white, fontSize: 15),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "$text",
              //       style: TextStyle(color: (index == qnController.selectedIndex) ? Colors.blue : Colors.white, fontSize: 15),
              //     ),
              //     Container(
              //       height: 20,
              //       width: 20,
              //       decoration: BoxDecoration(
              //         color: (index == qnController.selectedIndex) ? Colors.green : Colors.transparent,
              //         borderRadius: BorderRadius.circular(50),
              //         border: Border.all(color: (index == qnController.selectedIndex) ? Colors.white : Colors.grey),
              //       ),
              //       child: (index == qnController.selectedIndex)
              //           ? Icon(
              //               Icons.done,
              //               size: 16,
              //               color: Colors.white,
              //             )
              //           : null,
              //     )
              //   ],
              // ),
            ),
          ),
        );
      },
    );
  }
}
