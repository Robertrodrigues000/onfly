import 'package:flutter/material.dart';

import '../../../core/app_controller.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text.dart';
import '../../widgets/bootom_navigation_widget.dart';
import '../../widgets/tab_title_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends AppController<HomePage, HomeController> {
  @override
  HomeController createController() => HomeController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
                appBar: AppBar(
                    title: const TabTitleWidget(),
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                ),
                bottomNavigationBar: const BottomNavigationWidget(),
                extendBodyBehindAppBar: true,
                body: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                       // image: DecorationImage(
                          //image: NetworkImage(book.cover),
                       //   fit: BoxFit.cover,
                      //  ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: Material(
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: AppText.cadTitle('book.name'),
                                      ),
                             const Icon(Icons.favorite_border)
                                    ],
                                  ),
                                ),
                                AppText.subtitle('book.author'),
                                const SizedBox(height: 30),
                                AppText.description('book.description!'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
     
  }
}
