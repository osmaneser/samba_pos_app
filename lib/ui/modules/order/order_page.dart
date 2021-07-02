import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samba_pos_app/core/constants/global_constants.dart';
import 'package:samba_pos_app/core/models/base_view_model.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_card.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_circular_spinner.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_content_image.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_not_found_item.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_title_text.dart';
import 'package:samba_pos_app/ui/modules/order/order_menu_page.dart';
import 'package:samba_pos_app/ui/modules/order/order_view_model.dart';

class OrderPage extends StatefulWidget {
  final String mainMenu;
  const OrderPage({Key key, this.mainMenu}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    Provider.of<OrderViewModel>(context, listen: false).getMainMenuList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _listMenu = Consumer<OrderViewModel>(
      builder: (context, vModel, child) {
        if (vModel.state == BaseState.Busy) {
          return OeCustomSpinner();
        } else if (vModel.state == BaseState.Done) {
          return RefreshIndicator(
            onRefresh: () async {
              Provider.of<OrderViewModel>(context, listen: false).getMainMenuList();
              return null;
            },
            child: ListView.builder(
              itemCount: Provider.of<OrderViewModel>(context, listen: false).listMainMenu.length,
              itemBuilder: (context, i) {
                final vModel = Provider.of<OrderViewModel>(context, listen: false);
                final menu = vModel.listMainMenu[i];

                return Container(
                  width: 300,
                  height: 300,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderMenuPage(menuName: menu.name)));
                    },
                    child: OeCustomCard(
                      child: Column(
                        //TODO: refactor yapılacak!
                        children: [
                          OeContentImage(path: menu.image.replaceFirst(".", "assets")),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTitleText(text: menu.name),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return OeCustomNotFoundItem(
          isReloadData: true,
          onReload: () => Provider.of<OrderViewModel>(context, listen: false).getMainMenuList(),
          reloadDataText: "Ana Menüleri Getir",
        );
      },
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _listMenu,
      ),
      backgroundColor: GlobalConstant.mainBack,
    );
  }
}
