import 'package:flutter/material.dart';
import 'package:jpstockmemo2/components/custom_alert_dialog.dart';
import 'package:jpstockmemo2/components/stock_card.dart';
import 'package:jpstockmemo2/viewmodels/list_model.dart';
import 'package:jpstockmemo2/views/edit_page.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    const bool isButtonMode = true;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
        title: const Text('ListPage'),
      ),
      body: ChangeNotifierProvider<ListModel>(
        create: (_) => ListModel()..fetchMemos(),
        child: Column(
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
              child: Consumer<ListModel>(
                builder: (BuildContext context, model, Widget? child) {
                  final stockmemos = model.stockmemos;
                  final stockcards = stockmemos
                      .map(
                        (stockcard) => StockCard(
                          isButtonMode: isButtonMode,
                          stockname: stockcard.stockname,
                          code: stockcard.code,
                          market: stockcard.market,
                          memo: stockcard.memo,
                          onDeleteChanged: () async {
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialog(
                                  title: "${stockcard.stockname}を削除しますか？",
                                  buttonText: "OK",
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    await model.deleteMemo(stockcard);
                                    await model.fetchMemos();
                                  },
                                );
                              },
                            );
                          },
                          onEditChanged: () async {},
                          createdAt: null,
                          updatedAt: null,
                        ),
                      ).toList();
                  return ListView(
                    children: stockcards,
                  );
                },
              ),
            ),
          ],
        ),
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
