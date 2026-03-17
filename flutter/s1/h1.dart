import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  const H1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width - 24,
            child: Column(
              children: [
                SizedBox(height: 24),
                Container(color: Color(0xffE4F2FD), height: 100),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Container(color: Color(0xffE0E0E0), height: 24, width: 24),
                    SizedBox(width: 8),
                    Container(
                      color: Color(0xffE0E0E0),
                      height: 16,
                      width: MediaQuery.sizeOf(context).width - 56,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Container(color: Color(0xffE0E0E0), height: 1.5),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      color: Color(0xffE6F6E9),
                      height: 120,
                      width: MediaQuery.sizeOf(context).width / 2 - 20,
                      child: Column(
                        children: [
                          Container(
                            color: Color(0xffA5D6A7),
                            height: 55,
                            width: MediaQuery.sizeOf(context).width / 2 - 20,
                          ),
                          SizedBox(height: 10),
                          Container(
                            color: Color(0xffA5D6A7),
                            height: 55,
                            width: MediaQuery.sizeOf(context).width / 2 - 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      color: Color(0xffFFF2DF),
                      height: 120,
                      width: MediaQuery.sizeOf(context).width / 2 - 20,
                      child: Row(
                        children: [
                          Container(
                            color: Color(0xffFFCC80),
                            height: 120,
                            width: MediaQuery.sizeOf(context).width / 4 - 16,
                          ),
                          SizedBox(width: 10),
                          Container(
                            color: Color(0xffFFCC80),
                            height: 120,
                            width: MediaQuery.sizeOf(context).width / 4 - 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Container(
                  color: Color(0xffF3E5F6),
                  height: 100,
                  width: MediaQuery.sizeOf(context).width - 24,
                  child: Row(
                    children: [
                      Container(
                        color: Color(0xffE1BEE8),
                        height: 100,
                        width: MediaQuery.sizeOf(context).width / 4 - 14,
                      ),
                      SizedBox(width: 16),
                      Container(
                        color: Color(0xffE1BEE8),
                        height: 100,
                        width: MediaQuery.sizeOf(context).width / 4 - 14,

                        child: Column(
                          children: [
                            Container(
                              color: Color(0xffCF93D9),
                              height: 42,
                              width: MediaQuery.sizeOf(context).width / 4 - 16,
                            ),
                            SizedBox(height: 16),
                            Container(
                              color: Color(0xffCF93D9),
                              height: 42,
                              width: MediaQuery.sizeOf(context).width / 4 - 16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        color: Color(0xffE1BEE8),
                        height: 100,
                        width: MediaQuery.sizeOf(context).width / 4 - 14,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      color: Color(0xffB2DFDC),
                      height: 70,
                      width: MediaQuery.sizeOf(context).width / 2 - 20,
                    ),
                    SizedBox(width: 16),
                    Container(
                      color: Color(0xff80CBC4),
                      height: 70,
                      width: MediaQuery.sizeOf(context).width / 2 - 20,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Container(
                  color: Color(0xffDFDFDF),
                  height: 55,
                  width: MediaQuery.sizeOf(context).width - 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
