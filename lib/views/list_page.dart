import 'package:flutter/material.dart';
import 'package:jpstockmemo2/components/custom_alert_dialog.dart';
import 'package:jpstockmemo2/components/stock_card.dart';
import 'package:jpstockmemo2/databases/tables.dart';
import 'package:jpstockmemo2/views/edit_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late StockMemoDatabase _db;

  late List<StockMemo> stockmemos = [];

  void _refreshMemos() async {
    _db = StockMemoDatabase();
    final data = await _db.getMemos();
    setState(
      () {
        stockmemos = data;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _refreshMemos();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bool isButtonMode = true;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
        title: const Text('ListPage'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
            child: Center(
              child: Text(
                'Adbannar',
                style: TextStyle(
                  fontSize: 30,
                  backgroundColor: Colors.amber,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stockmemos.length,
              itemBuilder: (context, index) => StockCard(
                isButtonMode: isButtonMode,
                stockname: stockmemos[index].stockname,
                code: stockmemos[index].code,
                market: "市場",
                memo: stockmemos[index].memo,
                onDeleteChanged: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomAlertDialog(
                        title: "${stockmemos[index].stockname}を削除しますか？",
                        buttonText: "OK",
                        onPressed: () async {
                          Navigator.of(context).pop();
                          await _db.deleteMemo(stockmemos[index].id);
                          _refreshMemos();
                        },
                      );
                    },
                  );
                },
                onEditChanged: () async {},
                createdAt: null,
                updatedAt: null,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditPage(),
            ),
          );
        },
        label: const Text('EditPage'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
