import 'package:flutter/material.dart';
import 'package:jpstockmemo2/components/custom_alert_dialog.dart';
import 'package:jpstockmemo2/components/custom_text_form_field.dart';
import 'package:drift/drift.dart' as drift hide Column;
import 'package:jpstockmemo2/databases/tables.dart';

const List<String> markets = ["プライム", "スタンダード", "グロース", "その他"];

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final StockMemoDatabase _db = StockMemoDatabase(); // データベースに接続
  List<StockMemo> stockmemos = []; // データベースから取得したデータを格納する変数
  String _dropdownValue = markets.first; // ドロップダウンメニューの値を格納する変数と初期値
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _db.close();
    _nameController.dispose();
    _codeController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditPage'),
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
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    controller: _codeController,
                    labelText: '証券コード',
                    maxLines: 1,
                    maxLength: 4,
                    onChanged: (text) {
                      _codeController.text = text;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return '証券コードを入力してください';
                      } else if (!RegExp(r"\d{4}").hasMatch(value)) {
                        return '４桁の半角数字を入力してください';
                      }
                    },
                    keyboardType: TextInputType.text,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: const Text(
                          '市場',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        subtitle: DropdownButton<String>(
                          isExpanded: true,
                          underline: Container(
                            height: 1,
                            color: Colors.black26,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _dropdownValue = value!;
                            });
                          },
                          value: _dropdownValue,
                          items: markets.map<DropdownMenuItem<String>>(
                            (String text) {
                              return DropdownMenuItem<String>(
                                value: text,
                                child: Text(text),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    controller: _nameController,
                    labelText: '銘柄名',
                    maxLines: 1,
                    maxLength: null,
                    onChanged: (text) {
                      _nameController.text = text;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return '銘柄名を入力してください';
                      }
                    },
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextFormField(
                    controller: _memoController,
                    labelText: 'メモ',
                    maxLines: 10,
                    maxLength: null,
                    onChanged: (text) {
                      _memoController.text = text;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'メモを入力してください';
                      }
                    },
                    keyboardType: TextInputType.text,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final entity = StockMemosCompanion(
                            code: drift.Value(_codeController.text),
                            stockname: drift.Value(_nameController.text),
                            market: drift.Value(_dropdownValue),
                            memo: drift.Value(_memoController.text),
                          );
                          _db.insertMemo(entity).then(
                                (value) => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomAlertDialog(
                                      title: "保存しました",
                                      buttonText: "OK",
                                      onPressed: () async {
                                        await Navigator.pushNamed(context, '/');
                                      },
                                    );
                                  },
                                ),
                              );
                        }
                      },
                      child: const Text(
                        '保存',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
