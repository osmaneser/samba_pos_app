import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samba_pos_app/core/constants/custom_enums.dart';
import 'package:samba_pos_app/core/constants/global_constants.dart';
import 'package:samba_pos_app/core/services/dialog_service.dart';
import 'package:samba_pos_app/core/services/loading_service.dart';
import 'package:samba_pos_app/core/widgets/expansion_panel/expansion_item.dart';
import 'package:samba_pos_app/core/widgets/expansion_panel/oe_custom_expansion_panel.dart';
import 'package:samba_pos_app/core/widgets/oe_button.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_app_bar.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_card.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_content_image.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_content_text.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_label_text.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_thumbnail_image.dart';
import 'package:samba_pos_app/core/widgets/oe_custom_title_text.dart';
import 'package:samba_pos_app/core/widgets/radio_button/oe_custom_radio_button.dart';
import 'package:samba_pos_app/core/widgets/radio_button/radio_button_item.dart';
import 'package:samba_pos_app/ui/models/menu_item_model.dart';
import 'package:samba_pos_app/ui/models/menu_model.dart';
import 'package:samba_pos_app/ui/models/order_model.dart';
import 'package:samba_pos_app/ui/modules/order/order_view_model.dart';

class OrderSubMenuPage extends StatefulWidget {
  final MenuItem menuItem;
  const OrderSubMenuPage({Key key, @required this.menuItem}) : super(key: key);

  @override
  _OrderSubMenuPageState createState() => _OrderSubMenuPageState();
}

class _OrderSubMenuPageState extends State<OrderSubMenuPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: OeCustomAppBar(
          title: CustomTitleText(text: widget.menuItem.name),
          onBackButton: () {
            print("object");
            Provider.of<OrderViewModel>(context, listen: false).orderModel = [];
            Navigator.pop(context);
          },
        ),
        preferredSize: Size.fromHeight(50),
      ),
      backgroundColor: GlobalConstant.mainBack,
      body: Column(
        children: [
          Expanded(
            flex: 90,
            child: ListView(primary: false, children: [
              widget.menuItem.subMenus != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OeExpansionPanel(
                        listExpansion: widget.menuItem.subMenus.map((e) {
                          final vModel = Provider.of<OrderViewModel>(context, listen: false);
                          final subMenu = vModel.responseMenu.menus.firstWhere((element) => element.key == e);
                          return ExpansionItem(content: _contentSubMenu(subMenu), isExpanded: false, title: subMenu.description);
                        }).toList(),
                        onLastExpandedIndex: (v) {},
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OeCustomCard(
                          child: Column(
                        children: [
                          SizedBox(child: OeContentImage(path: widget.menuItem.image.replaceFirst(".", "assets"))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [CustomTitleText(text: widget.menuItem.name), CustomTitleText(text: "${widget.menuItem.price} ₺")],
                            ),
                          )
                        ],
                      )),
                    ),
            ]),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OeButton(
                onTap: () async {
                  final vModel = Provider.of<OrderViewModel>(context, listen: false);
                  LoadingService.loadingScreen(context: context, isOpen: true,message: "Sipariş alınıyor...");
                  final result = await vModel.orderNow(widget.menuItem);
                  await LoadingService.loadingScreen(context: context, isOpen: false);

                  DialogService.alertDialog(
                      context: context,
                      message: vModel.message,
                      type: result ? EnumAlertType.Success : EnumAlertType.Error,
                      onCloseTap: () {
                        if (result) Navigator.pop(context);
                      });
                },
                text: "Sipariş Ver",
                color: GlobalConstant.alternative,
              ),
            ),
          )
        ],
      ),
    );
  }

  _contentSubMenu(Menu subMenu) {
    return OeRadioButton(
      isShowLabel: false,
      initValue: null,
      listRadioGroup: subMenu.items.map(
        (e) {
          return RadioButtonItem(
            content: ListTile(
              leading: e.image != null ? OeThumbnailImage(path: e.image.replaceFirst(".", "assets")) : SizedBox.shrink(),
              title: CustomContentText(text: e.name != null ? e.name : e.caption),
              subtitle: e.price != null ? CustomLabelText(text: "Fiyat: ${e.price} ₺") : SizedBox.shrink(),
            ),
            value: e.name,
          );
        },
      ).toList(),
      onChanged: (val) async {
        final vModel = Provider.of<OrderViewModel>(context, listen: false);
        await vModel.chooseItem(OrderModel(key: subMenu.key, chooseItem: val));
      },
    );
  }
}
