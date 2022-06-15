import 'package:flutter/cupertino.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
    child: SizedBox(
    height: 1/825 * screensize.height * 50,
    width: 1/393* screensize.width * 50,
          child: Image.asset(
              "assets/images/Icon awesome-tasks.png")
    ),
        ),
        SizedBox(
          height: 1/825 * screensize.height * 50,
          width: 1/393* screensize.width * 50,
          child: Image.asset(
              "assets/images/up-arrow-svgrepo-com.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
    child: SizedBox(
    height: 1/825 * screensize.height * 50,
    width: 1/393* screensize.width * 50,
          child: Image.asset(
              "assets/images/Icon awesome-coins.png")),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: SizedBox(
            height: 1/825 * screensize.height * 50,
            width: 1/393* screensize.width * 50,
            child: Image.asset(
                "assets/images/up-arrow-svgrepo-comm.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),child: SizedBox(
    height: 1/825 * screensize.height * 50,
    width: 1/393* screensize.width * 50,
          child: Image.asset(
              "assets/images/Icon awesome-wallet.png")),
        ),
      ],
    )
;
  }
}
