import 'dart:convert';

import 'package:flutter/material.dart';

ExpansionItem expansionItemFromJson(String str) => ExpansionItem.fromJson(json.decode(str));

String expansionItemToJson(ExpansionItem data) => json.encode(data.toJson());

class ExpansionItem {
    ExpansionItem({
        this.title,
        this.content,
        this.isExpanded,
    });

    String title;
    Widget content;
    bool isExpanded;

    factory ExpansionItem.fromJson(Map<String, dynamic> json) => ExpansionItem(
        title: json["title"],
        content: json["content"],
        isExpanded: json["isExpanded"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "isExpanded": isExpanded,
    };
}
