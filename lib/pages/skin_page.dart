import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SkinPage extends StatelessWidget {
  SkinPage(
      {super.key,
      required this.image,
      required this.name,
      required this.amount});
  String image;
  String name;
  String amount;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.withAlpha(80), Colors.grey.withAlpha(15)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
            ),
            body: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: Hero(
                        tag: name,
                        child: Image(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 500,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withAlpha(150)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                      Text(
                        amount,
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
