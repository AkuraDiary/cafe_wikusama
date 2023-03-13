import 'package:cafe_wikusama/data/models/menu_model.dart';
import 'package:cafe_wikusama/data/models/transaksi_model.dart';
import 'package:cafe_wikusama/domain/usecase/transaksi/AllTransaksi.dart';
import 'package:cafe_wikusama/presentation/Assets_For_Icon/my_flutter_app_icons.dart';
import 'package:cafe_wikusama/presentation/notifier/transaksi/transaksi_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../Model.dart';

class Pesanan extends StatefulWidget {
  Pesanan({Key? key}) : super(key: key);

  @override
  _PesananState createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  allTransaksi() async {
    Future.microtask(() =>
        Provider.of<TransaksiNotifier>(context, listen: false)..transaksi());
  }

  @override
  void initState() {
    super.initState();
    allTransaksi();
    setState(() {
      isFilter = false;
    });
  }

  bool isFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 38,
          child: Text(
            "Pesanan",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        actions: [
          //Filter Icon
          IconButton(
            icon: Icon(
              MyFlutterApp.sliders_h,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              // print("Test");
              setState(() {
                isFilter = !isFilter;
              });
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Consumer<TransaksiNotifier>(builder: (context, provider, child) {
          return provider.transaksiResult.length > 0
              ? ListView.builder(
                  itemCount: provider.transaksiResult.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: pesananCard(
                          transaksiModel: provider.transaksiResult[index]!),
                    );
                  })
              : Center(
                  child: Text(
                  "No users found",
                  style: TextStyle(color: Colors.black),
                ));
        }),
      ),
    );
  }

  pesananCard({required TransaksiModel transaksiModel}) {
    return isFilter == false
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // transaksiModel.idMeja.toString(),
                        "No ${transaksiModel.idMeja}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaksiModel.namaPelanggan!,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   user.price,
                      //   style: TextStyle(
                      //       color: Colors.black, fontWeight: FontWeight.w500),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: transaksiModel.status == "lunas"
                            ? Colors.green
                            : Colors.amber,
                        child: Text(
                          transaksiModel.status == "lunas"
                              ? 'Done'
                              : 'On going',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        transaksiModel.tglTransaksi!,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        : transaksiModel.status! == "belum_bayar"
            ? Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // transaksiModel.idMeja.toString(),
                        "No ${transaksiModel.idMeja}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaksiModel.namaPelanggan!,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: Colors.amber,
                        child: Text(
                          'On going',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        transaksiModel.tglTransaksi!,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ):Container(
              
            );
  }
}
