import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // calling the global controller
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(() => globalController.checkLoading().isTrue ? Center(
        child: CircularProgressIndicator(),
      ) : ListView(
        scrollDirection: Axis.vertical,
        children: [
          const HeaderWidget(),
        ],
      ))),
   
    );
  }
}