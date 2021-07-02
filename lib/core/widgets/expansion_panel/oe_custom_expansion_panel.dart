import 'package:flutter/material.dart';
import 'package:samba_pos_app/core/constants/global_constants.dart';
import 'expansion_item.dart';

class OeExpansionPanel extends StatefulWidget {
  final List<ExpansionItem> listExpansion;
  final Color backgroundColor;
  final Function(int) onLastExpandedIndex;

  const OeExpansionPanel({Key key, this.listExpansion, this.onLastExpandedIndex, this.backgroundColor}) : super(key: key);

  @override
  _OeExpansionPanelState createState() => _OeExpansionPanelState();
}

class _OeExpansionPanelState extends State<OeExpansionPanel> {
  ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return ExpansionPanelList(
      dividerColor: GlobalConstant.fontColorAlternative,
      expandedHeaderPadding: EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          ExpansionItem expansionItem = widget.listExpansion[index];
          expansionItem.isExpanded = !isExpanded;
          widget.onLastExpandedIndex(index);
        });
      },
      animationDuration: Duration(milliseconds: 500),
      children: getExpansionList(),
    );
  }

  List<ExpansionPanel> getExpansionList() {
    return widget.listExpansion
        .map(
          (e) => ExpansionPanel(
            canTapOnHeader: true,
            backgroundColor: widget.backgroundColor != null ? widget.backgroundColor : GlobalConstant.mainSoft,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(e.title, style: TextStyle(color: GlobalConstant.fontColorLive, fontWeight: FontWeight.bold, fontSize: 12)),
              );
            },
            body: Container(
              padding: EdgeInsets.only(bottom: 16),
              child: Center(
                child: e.content,
              ),
            ),
            isExpanded: e.isExpanded,
          ),
        )
        .toList();
  }
}
