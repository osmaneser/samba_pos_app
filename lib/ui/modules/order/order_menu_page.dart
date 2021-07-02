import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samba_pos_app/core/constants/global_constants.dart';
import 'package:samba_pos_app/core/models/base_view_model.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_app_bar.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_circular_spinner.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_label_text.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_not_found_item.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_thumbnail_image.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_title_text.dart';
import 'package:samba_pos_app/ui/modules/order/order_sub_menu_page.dart';
import 'package:samba_pos_app/ui/modules/order/order_view_model.dart';

class OrderMenuPage extends StatefulWidget {
  final String menuName;
  const OrderMenuPage({Key key, this.menuName}) : super(key: key);

  @override
  _OrderMenuPageState createState() => _OrderMenuPageState();
}

class _OrderMenuPageState extends State<OrderMenuPage> {
  @override
  void initState() {
    Provider.of<OrderViewModel>(context, listen: false).getMenuByName(name: widget.menuName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: OeCustomAppBar(title: CustomTitleText(text: widget.menuName),), preferredSize: Size.fromHeight(50),),
      backgroundColor: GlobalConstant.mainBack,
      body: Consumer<OrderViewModel>(
        builder: (context, vModel, child) {
          if (vModel.state == BaseState.Busy) {
            return OeCustomSpinner();
          } else if (vModel.state == BaseState.Done) {
            return ListView.builder(
              itemCount: vModel.menuItem.items.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OrderSubMenuPage(menuItem: vModel.menuItem.items[i])));
                    },
                    child: ListTile(
                      tileColor: GlobalConstant.mainSoft,
                      leading: OeThumbnailImage(path: vModel.menuItem.items[i].image.replaceFirst(".", "assets")),
                      subtitle: CustomLabelText(text: "${vModel.menuItem.items[i].price} ₺"),
                      title: CustomTitleText(text: vModel.menuItem.items[i].name),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: GlobalConstant.fontColorLive,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return OeCustomNotFoundItem();
          }
        },
      ),
    );
  }
}
