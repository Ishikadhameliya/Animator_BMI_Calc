import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation heightAnimation;
  late Animation widthAnimation;
  late Animation borderAnimation;
  late Animation borderColorAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..forward();

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 40),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/bmibg.jpeg"),fit: BoxFit.fill),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 55,),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: double.infinity,
              child: const Text("BMI Calculator",style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
            const SizedBox(height: 20),
            Padding(padding: const EdgeInsets.all(10),child:  Container(
              height: 40,
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text("       Body Mass Index is a measurement Which determines which weight category a person belong to.",style: TextStyle(color: Colors.white,fontSize: 15,),),
            ),),
            const SizedBox(height: 20,),
            Row(
              children: const [
                Icon(Icons.man,size: 180,color: Colors.white,),
                Icon(Icons.woman,size: 180,color: Colors.white,),
              ],
            ),
            const SizedBox(height: 50,),
            (animationController.isCompleted)
                ? TweenAnimationBuilder(
              tween: Tween<Offset>(
                  begin: const Offset(0, 250), end: const Offset(0, 100)),
              duration: const Duration(milliseconds: 2000),
              builder: (context, Offset align, _) {
                return Transform.translate(
                  offset: align,
                  child: Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Text('Calculate BMI', style: TextStyle(fontSize: 20,color: Colors.white),),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/');
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                            ),
                            child: const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}