import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/question_controller.dart';

class QuestionView extends GetView<QuestionController> {
  const QuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuestionView'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        child: Column(
          children: [
            Obx(() => Text(
                  controller.riddlesResult.value.data?.question ?? 'Loading...',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                )),
            Obx(
              () => Visibility(
                visible: !controller.isHidden.value,
                child: Text(
                  controller.riddlesResult.value.data?.answer ?? 'Loading...',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.isHidden.value = !controller.isHidden.value;
                },
                child: Obx(() => Text(
                    controller.isHidden.value ? 'Show Answer' : 'Hide Answer')))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getRiddlesResult();
        },
        child: Icon(Icons.refresh_rounded),
      ),
    );
  }
}
