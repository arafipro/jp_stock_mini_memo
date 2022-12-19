import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jpstockmemo2/components/custom_alert_dialog.dart';
import 'package:jpstockmemo2/components/stock_card.dart';
import 'package:jpstockmemo2/viewmodels/list_model.dart';
import 'package:jpstockmemo2/views/edit_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    const bool isButtonMode = true;
    return ChangeNotifierProvider<ListModel>(
      create: (_) => ListModel()..fetchMemos(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // 戻るボタンを表示しない
          title: const Text(
            '日本株投資メモ',
          ),
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
              child: Consumer<ListModel>(
                builder: (
                  BuildContext context,
                  model,
                  Widget? child,
                ) {
                  final stockmemos = model.stockmemos;
                  final stockcards = stockmemos
                      .map(
                        (stockcard) => StockCard(
                          isButtonMode: isButtonMode,
                          stockname: stockcard.name,
                          code: stockcard.code,
                          market: stockcard.market,
                          memo: stockcard.memo,
                          createdAt: stockcard.createdAt,
                          updatedAt: stockcard.updatedAt,
                          onDeleteChanged: () async {
                            await showDialog(
                              context: context,
                              builder: (
                                BuildContext context,
                              ) {
                                return CustomAlertDialog(
                                  title: "${stockcard.name}を削除しますか？",
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
                          onEditChanged: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPage(
                                  stockmemo: stockcard,
                                ),
                                fullscreenDialog: true,
                              ),
                            );
                            model.fetchMemos();
                          },
                        ),
                      )
                      .toList();
                  return ListView(
                    children: stockcards,
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (
                  context,
                ) =>
                    EditPage(
                  stockmemo: null,
                ),
                fullscreenDialog: true,
              ),
            );
          },
          label: const Text('新規登録'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
