// To parse this JSON data, do
//
//     final radioButtonItem = radioButtonItemFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

RadioButtonItem radioButtonItemFromJson(String str) => RadioButtonItem.fromJson(json.decode(str));

String radioButtonItemToJson(RadioButtonItem data) => json.encode(data.toJson());

class RadioButtonItem {
    RadioButtonItem({
        this.value,
        this.content,
    });

    dynamic value;
    Widget content;

    factory RadioButtonItem.fromJson(Map<String, dynamic> json) => RadioButtonItem(
        value: json["value"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "content": content,
    };
}
