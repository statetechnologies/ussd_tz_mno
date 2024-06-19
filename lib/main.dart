import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ussd_tz_mno/ussdChanges.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // HoverUssd.initialize(
    //   apiKey: "021caacf6bc6b81ac179666deeeb090b",
    //     branding: 'Hover Ussd Example', logo: "mipmap/ic_launcher");
  } catch (e) {
    print(e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  bool ready = true;
  final pin = TextEditingController();

  // late final HoverUssd _hoverUssd = HoverUssd();
  late StreamSubscription transactionListening;
  late StreamSubscription _actionDownloadListening;

  @override
  void initState() {
    // transactionListening = _hoverUssd.getUssdTransactionState!.listen((event) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text(event.toMap().toString())));
    // });
    super.initState();
  }

  @override
  void dispose() {
    // transactionListening.cancel();
    // _actionDownloadListening.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AutoUssd Sample (Flutter)'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 36,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "AutoUssd Sample",
                  style: theme.textTheme.headline3?.copyWith(
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "We'll be using this sample starting app to illustrate how to use the AutoUssd platform",
                  style: theme.textTheme.bodyText2,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: pin,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "Enter PIN", labelText: "Account PIN"),
                ),
                SizedBox(height: 24),
                OutlinedButton(
                    onPressed: () async {
                      if (pin.text.isNotEmpty) {
                        String? _res = await UssdAdvancedJames.multisessionUssd(
                            code: "*150*01#");
                        print(_res.toString());
                        String? _res2 =
                            await UssdAdvancedJames.sendMessage('6');
                        // print(_res2.toString());
                        String? _res3 =
                            await UssdAdvancedJames.sendMessage('3');
                        // print(_res3.toString());
                        String? _res4 =
                            await UssdAdvancedJames.sendMessage('1');
                        // print(_res4.toString());
                        String? _res5 =
                            await UssdAdvancedJames.sendMessage('1');
                        // print(_res5.toString());
                        String? _res6 = await UssdAdvancedJames.sendMessage(
                            pin.text.toString());
                        print(_res6.toString());

                        Future.delayed(Duration(seconds: 1), () async {
                          {
                            await UssdAdvancedJames.cancelSession();
                          }
                        });
                      }
                    },
                    child: Text("Check TIGO Balance")),
                SizedBox(height: 24),
                OutlinedButton(
                    onPressed: () async {
                      if (pin.text.isNotEmpty) {
                        String? _res = await UssdAdvancedJames.multisessionUssd(
                            code: "*150*60#");
                        // print(_res.toString());
                        String? _res2 =
                            await UssdAdvancedJames.sendMessage('7');
                        // print(_res2.toString());
                        String? _res3 =
                            await UssdAdvancedJames.sendMessage('3');
                        String? _res6 = await UssdAdvancedJames.sendMessage(
                            pin.text.toString());
                        print(_res6.toString());

                        Future.delayed(Duration(seconds: 1), () async {
                          {
                            await UssdAdvancedJames.cancelSession();
                          }
                        });
                      }
                    },
                    child: Text("Check Airtel Balance")),
                SizedBox(height: 24),
                OutlinedButton(
                    onPressed: () async {
                      if (pin.text.isNotEmpty) {
                        String? _res = await UssdAdvancedJames.multisessionUssd(
                            code: "*150*00#");
                        // print(_res.toString());
                        String? _res2 =
                            await UssdAdvancedJames.sendMessage('7');
                        // print(_res2.toString());
                        String? _res3 =
                            await UssdAdvancedJames.sendMessage('3');
                        String? _res4 =
                            await UssdAdvancedJames.sendMessage('1');
                        String? _res6 = await UssdAdvancedJames.sendMessage(
                            pin.text.toString());
                        print(_res6.toString());

                        Future.delayed(Duration(seconds: 1), () async {
                          {
                            await UssdAdvancedJames.cancelSession();
                          }
                        });
                      }
                    },
                    child: Text("Check M-Pesa Balance")),
                SizedBox(height: 24),
                OutlinedButton(
                    onPressed: () async {
                      if (pin.text.isNotEmpty) {
                        String? _res = await UssdAdvancedJames.multisessionUssd(
                            code: "*150*71#");
                        // print(_res.toString());
                        String? _res2 =
                            await UssdAdvancedJames.sendMessage('8');
                        // print(_res2.toString());
                        String? _res3 =
                            await UssdAdvancedJames.sendMessage('1');
                        String? _res6 = await UssdAdvancedJames.sendMessage(
                            pin.text.toString());
                        print(_res6.toString());

                        Future.delayed(Duration(seconds: 1), () async {
                          {
                            await UssdAdvancedJames.cancelSession();
                          }
                        });
                      }
                    },
                    child: Text("Check T-Pesa Balance")),
                SizedBox(height: 24),
                OutlinedButton(
                    onPressed: () async {
                      // String? _res = await UssdAdvancedJames.sendAdvancedUssd(
                      //     code: "*150*71*8*1*2504#");

                      String? _res = await UssdAdvancedJames.multisessionUssd(
                          code: "*147*00#");
                      // String? _res = await UssdAdvancedJames.sendAdvancedUssd(
                      //     code: "*147*00#");
                      print(_res.toString());

                      // Future.delayed(Duration(seconds: 3), () async {
                      //   {
                      //     await UssdAdvancedJames.cancelSession();
                      //   }
                      // });
                    },
                    child: Text("Background USSD")),
                StreamBuilder<String?>(
                  stream: UssdAdvancedJames.onEnd().stream,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("Sms parsed : \n${snapshot.data}");
                    }
                    return Text("No state");
                  },
                ),
                // OutlinedButton(
                //   onPressed: () {
                //     _hoverUssd.startTransaction(
                //         actionId: "b7d6ece7", extras: {"pin": pin.text});
                //   },
                //   child: Text("Start Transaction"),
                // ),
                // StreamBuilder<TransactionState>(
                //   stream: _hoverUssd.getUssdTransactionState,
                //   builder: (BuildContext context, snapshot) {
                //     if (snapshot.data is SmsParsed) {
                //       return Text(
                //           "Sms parsed : \n" + snapshot.data!.toMap().toString());
                //     }
                //
                //     if (snapshot.data is UssdSucceded) {
                //       return Text("Ussd Succeded : \n" +
                //           snapshot.data!.toMap().toString());
                //     }
                //     if (snapshot.data is UssdLoading) {
                //       return Text("loading...");
                //     }
                //     if (snapshot.data is UssdFailed) {
                //       return Text(
                //           "Ussd Failed : \n" + snapshot.data!.toMap().toString());
                //     }
                //     if (snapshot.data is EmptyState) {
                //       return Text("Empty State");
                //     }
                //
                //     return Text("No state");
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
