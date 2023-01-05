import 'package:jp_stock_mini_memo/constants/imports.dart';

class StockCard extends StatelessWidget {
/*　引数の詳細
isButtonMode：編集・削除の操作をボタンかジェスチャーか変更するためのトリガー引数
true => ボタン、false => ジェスチャー
stockname   ：銘柄名
code        ：証券コード
market      ：市場
memo        ：メモ
createdAt   ：新規日時
updatedAt   ：更新日時
*/

  final bool isButtonMode;
  final String? stockname;
  final String? code;
  final String? market;
  final String? memo;
  final dynamic onDeleteChanged;
  final dynamic onEditChanged;
  final String? createdAt;
  final String? updatedAt;

  const StockCard({
    super.key,
    required this.isButtonMode,
    required this.stockname,
    required this.code,
    required this.market,
    required this.memo,
    required this.onDeleteChanged,
    required this.onEditChanged,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            stockname!, // 銘柄名
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '($code)', // 証券コード
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                market!, // 市場
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              memo!, // メモ
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '登録日時：$createdAt',
                style: dateTimeTextStyle,
              ),
              Text(
                '更新日時：$updatedAt',
                style: dateTimeTextStyle,
              ),
            ],
          ),
          isButtonMode
              ? ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      icon: const Icon(
                        Icons.edit,
                      ),
                      label: const Text(
                        '編集',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                      onPressed: onEditChanged,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: const StadiumBorder(),
                      ),
                      icon: const Icon(Icons.delete),
                      label: const Text(
                        '削除',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                      onPressed: onDeleteChanged,
                    ),
                  ],
                )
              : const SizedBox(
                  height: 8,
                ),
        ],
      ),
    );
  }
}
