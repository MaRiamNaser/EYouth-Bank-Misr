import 'package:bank_misr/presentation/goals/goals_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets("Test delete the goal from database", (WidgetTester tester) async{
    final delete = find.byKey(ValueKey("deleteGoal"));

    //execute the actual test
     await tester.pumpWidget(Goalsview() );
     await tester.tap(delete);
     await tester.pump();// to rebuild your widget
      
    
    expect(find.byWidget( MaterialApp(home: Goalsview())),findsOneWidget );

  });
}