import 'package:flutter/material.dart';
import 'package:jpstockmemo2/components/custom_alert_dialog.dart';
import 'package:jpstockmemo2/components/stock_card.dart';
import 'package:jpstockmemo2/databases/tables.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late MemoDatabase _db;

  late List<Memo> memos = [];

  void _refreshMemos() async {
    _db = MemoDatabase();
    final data = await _db.getMemos();
    setState(() {
      memos = data;
    });
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
        title: const Text('ListPage'),
      ),
      body: ListView.builder(
        itemCount: memos.length,
        itemBuilder: (context, index) => StockCard(
          isButtonMode: isButtonMode,
          stockname: memos[index].stockname,
          code: memos[index].code,
          market: "市場",
          memo: memos[index].memo,
          onDeleteChanged: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog(
                  title: "${memos[index].stockname}を削除しますか？",
                  buttonText: "OK",
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _db.deleteMemo(memos[index].id);
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/editpage');
        },
        label: const Text('EditPage'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
