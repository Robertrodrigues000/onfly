import 'package:flutter/material.dart';
import 'package:onfly/core/theme/app_color.dart';

import '../../../core/app_controller.dart';
import '../../../core/theme/app_text.dart';
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
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.menu,
            color: AppColors.grey, // add custom icons also
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
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
                            Text('R\$ 45,55'),
                          ],
                        ),
                        children: [
                          Text("Name : User $index"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 120,
                                child: ElevatedButton(
                                  child: Text("Editar"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                width: 120,
                                child: ElevatedButton(
                                  child: Text("Deletar"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
