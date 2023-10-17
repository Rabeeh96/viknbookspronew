import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class ProfileHeadSection extends StatefulWidget {
  const ProfileHeadSection({super.key});

  @override
  State<ProfileHeadSection> createState() => _ProfileHeadSectionState();
}

class _ProfileHeadSectionState extends State<ProfileHeadSection> {

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Settings', 'Print Settings', 'Contact us', 'About us', 'Language'];
    Color lightgrey = Color(0xFFE8E8E8);
    Color grey= Color(0xFFE8E8E8).withOpacity(.3);
    double mqh = MediaQuery.of(context).size.height;
    double mqw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height:mqh*.39 ,
                  width:mqw*.92,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFF9BE33).withOpacity(.065),
                          // Colors.white.withOpacity(.01),
                          Colors.lightBlueAccent.withOpacity(.08)
                        ],
                        stops: const [0.3, 1],
                        begin:  Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.grey.withOpacity(.2))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: mqh*.125,
                          width:mqw*.845,
                          decoration: const BoxDecoration(
                            // border: Border.all(color: Colors.black,width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: mqh*.088,
                                width: mqw*.185,
                                decoration:BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(10)
                                ) ,
                                child: Image.asset('assets/pnn1.png',height: 60,width: 60,),
                              ),

                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 21,),
                                  Text(
                                    "Savad farooque",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000000),
                                      height: 24/16,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "savadfarooque@gmail.com",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff7d7d7d),
                                      height: 20/13,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),

                              IconButton(
                                  onPressed: (){},
                                  icon: SvgPicture.asset('assets/edit.svg',width: 20,height:20 ,))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: mqh*.095,
                          width:mqw*.845,
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              border: Border.all(color: Colors.grey.withOpacity(.05)),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text(
                                      "Organization",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff7d7d7d),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Fossa Solutions PVT LTD",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff000000),
                                        height: 24/16,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 28,),
                                  Container(
                                    height: mqh*.05,
                                    width: mqw*.2,
                                    decoration: const BoxDecoration(
                                        color:Colors.transparent),
                                    child:
                                    TextButton(
                                      onPressed: (){},
                                      child: const Text(
                                        "Change",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff0a9ef3),
                                          height: 21/14,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                              },
                              child: Container(
                                height: mqh*.065,
                                width: mqw*.44,
                                decoration: BoxDecoration(
                                  color:Colors.grey.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset('assets/delete5.svg',width: 19,height: 19,),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 3,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 3.5,),
                                        Text(
                                          "Delete Account",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffc80000),
                                            // height: 23/15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),

                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: mqh*.065,
                                width: mqw*.38,
                                decoration: BoxDecoration(
                                  color:const Color(0xFFFFCFCF),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/logout.svg',width: 22,height: 22,),
                                      ],
                                    ),
                                    const SizedBox(width: 3,),
                                    const Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffea6262),
                                        height: 23/15,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: 300,
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: [
                        Container(
                          height: mqh*.07,
                          width: mqw*.6,
                          decoration: BoxDecoration(
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(items[index],
                              style: TextStyle(fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                grey, // Transparent color
                                lightgrey, // Middle color
                                grey, // Transparent color
                              ],
                                stops: [0.1,0.4,1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
