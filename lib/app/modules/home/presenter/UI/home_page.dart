import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info/package_info.dart';

import 'package:padaria/app/core/shared/utils/app_colors.dart';
import 'package:padaria/app/core/shared/widgets/confirmation_dialog.dart';
import 'package:padaria/app/core/user/user_store.dart';
import 'package:padaria/app/modules/home/domain/entities/product_entity.dart';
import 'package:padaria/app/modules/home/presenter/UI/widgets/select_item_prod_widget.dart';
import '../../../../core/shared/widgets/custom_search_text_field.dart';
import '../store/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final HomeStore store = Modular.get();
  final UserStore userStore = Modular.get<UserStore>();
  final ScrollController scrollController = ScrollController();
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    if (store.filial == '') {
      store.setFilial(userStore.user!.filiais[0].filial);
    }
    store.getProdsFilial();
    _loadAppVersion();
  }

  @override
  void dispose() {
    _tabController.dispose();
    scrollController.dispose();
    store.ctrlSearchProd.dispose();
    super.dispose();
  }

  Future<void> _loadAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  void _scrollToTop() {
    scrollController.animateTo(0,
        duration: Duration(seconds: 2), curve: Curves.linear);
  }

  void _scrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            key: store.scaffoldKey,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [AppColors.gradient01, AppColors.gradient02],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          width: width / 3 * 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.5),
                            child: CustomSearchTextField(
                              onChanged: (value) {
                                store.filterList();
                              },
                              label: 'Buscar produto',
                              hint: 'Digite o nome do produto',
                              controller: store.ctrlSearchProd,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.search),
                                color: AppColors.bege,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        /*   Text(
                          'Versão: $_appVersion',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ), */
                        Container(
                          width: width / 3,
                          padding: EdgeInsets.symmetric(horizontal: 7.5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.bege,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: DropdownButton(
                            elevation: 6,
                            iconEnabledColor: Colors.white,
                            isExpanded: true,
                            underline: SizedBox(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            dropdownColor: Colors.white,
                            selectedItemBuilder: (BuildContext context) {
                              return controller.filiais.map((fl) {
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Filial ${store.filial}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            items: controller.filiais.map((fl) {
                              return DropdownMenuItem<String>(
                                value: fl.filial,
                                child: Text(
                                  'Filial ' + fl.filial,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                            value: store.filial,
                            onChanged: (String? value) {
                              setState(() {
                                store.setFilial(value!);
                                store.getProdsFilial();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    /*  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Versão: $_appVersion',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ), */
                    Row(
                      children: [
                        Text(
                          '$_appVersion',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          child: Text(
                            'Limpar campos',
                            style: TextStyle(color: AppColors.textButton),
                          ),
                          onPressed: () {
                            confirmationDialog(
                              context,
                              title: 'Limpar campos',
                              content:
                                  'Deseja limpar as quantidades de todos os itens dessa sessão?',
                              confirmationFunction: () {
                                setState(() {
                                  store
                                      .resetAllQuantities(_tabController.index);
                                });
                              },
                            );
                          },
                        ),
                        Checkbox(
                          value: store.isFilterSugestedProducts,
                          onChanged: (value) {
                            setState(() {
                              store.filterProducts();
                            });
                          },
                          activeColor: Colors.white,
                          checkColor: AppColors.gradient02,
                          fillColor: MaterialStateProperty.all(Colors.white),
                        ),
                        Text(
                          'Somente itens sugeridos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.logout, color: Colors.white),
                          onPressed: () {
                            Modular.to.pushNamed('/login');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Center(
                        child: Text(
                          'Panificação',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Text(
                          'Confeitaria',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Congelados',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Domingo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                  labelColor: Colors.red[800],
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  labelStyle: TextStyle(fontSize: 12),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildProdList(store.auxiliarPaes),
                      _buildProdList(store.auxiliarBolos),
                      _buildProdList(store.auxiliarFrios),
                      _buildProdList(store.auxiliardomingo),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              shape: CircularNotchedRectangle(),
              child: Container(
                height: 45,
                color: AppColors.gradient01,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.white,
                      ),
                      onPressed: _scrollToBottom,
                    ),
                    Spacer(),
                    IconButton(
                      icon:
                          Icon(Icons.arrow_upward_rounded, color: Colors.white),
                      onPressed: _scrollToTop,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            bottom: 10,
            end: width / 2 - 30,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.gradient01,
                        child: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          color: Colors.white,
                          onPressed: () {
                            store.goToOrderPage(_tabController.index);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProdList(List<Product> productList) {
    return Observer(builder: (_) {
      return store.loading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      AppColors.gradient01,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Carregando produtos',
                    style: TextStyle(
                      color: AppColors.gradient01,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              controller: scrollController,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return SelectItemProdWidget(
                  produto: productList[index],
                  tabIndex: _tabController.index,
                );
              },
            );
    });
  }
}
