import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              elevation: 3,
              shadowColor: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               
                    Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 175,
                          height: 175,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 10),
                   
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                          Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor: Colors.white,
                              child: Container(
                                height: 20,
                                width: double.infinity,
                                color: Colors.white,
                              )),
                          const SizedBox(height: 16),
                          Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor: Colors.white,
                              child:
                                
                                  Container(
                                height: 16,
                                width: 150,
                                color: Colors.white,
                              )),
                          const SizedBox(height: 16),
                          
                          Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor: Colors.white,
                              child: Container(
                                height: 14,
                                width: 100,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
