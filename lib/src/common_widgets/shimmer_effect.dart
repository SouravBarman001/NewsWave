import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.red,
      highlightColor: Colors.yellow,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(25),
          color: Colors.black.withOpacity(0.09),
        ),
      ),
    );
  }
}



class BodyShimmerEffect extends StatelessWidget {
  const BodyShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.red,
      highlightColor: Colors.yellow,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(25),
          color: Colors.black.withOpacity(0.09),
        ),
        child: Row(
          children: [
            Flexible(
                child:Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(25),
                      color: Colors.black12
                  ),
                ) ),
            Flexible(
                child:Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 7),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(25),
                    //color: Colors.red
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 18,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(25),
                            color: Colors.black12
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        width: double.infinity,
                        height: 18,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(25),
                            color: Colors.black12
                        ),
                      ),const SizedBox(height: 5,),
                      Container(
                        width: double.infinity,
                        height: 18,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(25),
                            color: Colors.black12
                        ),
                      ),const SizedBox(height: 5,),
                      Container(
                        width: double.infinity,
                        height: 18,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(25),
                            color: Colors.black12
                        ),
                      ),

                    ],
                  ),
                ) )
          ],
        ),
      ),
    );
  }
}

class SmallShimmerEffect extends StatelessWidget {
  const SmallShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.red,
      highlightColor: Colors.yellow,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(35),
          color: Colors.black.withOpacity(0.09),
        ),
      ),
    );
  }
}