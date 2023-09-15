import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:onfly/core/theme/app_color.dart';

import '../../../core/app_controller.dart';
import '../../../core/theme/app_text.dart';
import '../../widgets/app_button.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const TabTitleWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: const Border.fromBorderSide(
                    BorderSide(
                      color: AppColors.primary,
                      width: 0.6,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.menu,
            color: AppColors.grey, // add custom icons also
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed('/expense/'),
          child: const Icon(Icons.add, size: 30),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.cadTitle('Total'),
            AppText.cadTitle('R\$ 20,00'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                AppText.sessionTitle('Despesas RDV 1'),
                SizedBox(height: 20),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext content, int index) {
                    return Container(
                      child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Almoço'),
                                Text('25/11/2022'),
                              ],
                            ),
                            Column(
                              children: [
                                Text('R\$ 45,55'),
                                Icon(
                                  Icons.wifi_off,
                                  size: 20,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ],
                        ),
                        children: [
                          Text("Name : User $index"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppButton(
                                title: "Editar",
                                width: 120,
                                onPressed: () {},
                              ),
                              AppButton(
                                title: "Deletar",
                                width: 120,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
