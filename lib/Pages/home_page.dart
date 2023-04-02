import 'dart:convert';

import 'package:firstapp/models/catalog.dart';
import 'package:firstapp/widgets/Drawer.dart';
import 'package:firstapp/widgets/item_widget.dart';
import 'package:firstapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }

  void LoadData() async {
    final String catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    print(decodeData);
    final product = decodeData["products"];

    CatalogModel.Items =
        List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creameColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CataogHeader(),
              if (CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CataogHeader extends StatelessWidget {
  const CataogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.xl5.color(MyThemes.darkBlueshColor).make(),
        "Trending products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CatalogModel.Items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.Items[index];
          return CataogItem(
            catalog: catalog,
          );
        });
  }
}

class CataogItem extends StatelessWidget {
  final Item catalog;
  const CataogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyThemes.darkBlueshColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyThemes.darkBlueshColor),
                      shape:
                          MaterialStateProperty.all(StadiumBorder())), //5;21;48
                  child: "Buy".text.make(),
                ).pOnly(
                  right: 8,
                )
              ],
            ),
          ],
        ))
      ],
    )).white.rounded.square(150).make().p8();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.p16.roundedFull.make();
  }
}
