// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bank_misr/app/app.dart';
import 'package:bank_misr/business_logic/registerationProvider/registeration_logic.dart';
import 'package:bank_misr/presentation/login/login_view.dart';
import 'package:bank_misr/presentation/navgpage/navigation_page.dart';
import 'package:bank_misr/presentation/resources/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Login Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final username = find.byKey(Key("userName"));
    final password = find.byKey(Key("Password"));
    final loginbutton=find.byKey(Key("loginButton"));
    await tester.pumpWidget( MultiProvider(
            providers: [
              ChangeNotifierProvider<RegisterationProvider>(
                create: (context) =>
                    RegisterationProvider(),
              ),
            ],
            child: MaterialApp(home: LoginView())));
    await tester.enterText(username, "nana123");
    await tester.enterText(password, "123456789");
    await tester.dragUntilVisible(
      loginbutton, // what you want to find
      find.byType(SingleChildScrollView), // widget you want to scroll
      const Offset(0, 50), // delta to move
    );
    await tester.tap(loginbutton);
    TestWidgetsFlutterBinding.instance;
    await tester.pump(Duration(seconds: 9));

    expect(find.byWidget( MaterialApp(home: navgscreen())), findsOneWidget);

  });
}
