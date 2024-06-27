import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 127, 126, 126),
        highlightColor: const Color.fromARGB(255, 236, 235, 235),
        child: const ConsultingRequestCard());
  }
}

class CategoryCardShimmer extends StatelessWidget {
  const CategoryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.sizeOf(context).width / 4,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 25,
                  width: MediaQuery.sizeOf(context).width / 3,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const CircleAvatar(
                  radius: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 25,
              width: MediaQuery.sizeOf(context).width * 3 / 4,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultantCard extends StatelessWidget {
  const ConsultantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.sizeOf(context).width / 4,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                ),
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 25,
                          width: MediaQuery.sizeOf(context).width / 3,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 25,
                          width: MediaQuery.sizeOf(context).width / 4,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 25,
              width: MediaQuery.sizeOf(context).width * 3 / 4,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultingCard extends StatelessWidget {
  const ConsultingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: MediaQuery.sizeOf(context).width / 4,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: MediaQuery.sizeOf(context).width / 3,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: MediaQuery.sizeOf(context).width / 6,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 20,
                              width: MediaQuery.sizeOf(context).width / 6,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 20,
                              width: MediaQuery.sizeOf(context).width / 6,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: MediaQuery.sizeOf(context).width / 9,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: MediaQuery.sizeOf(context).width / 3.5,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  height: 30,
                  width: MediaQuery.sizeOf(context).width / 3.5,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultingRequestCard extends StatelessWidget {
  const ConsultingRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: MediaQuery.sizeOf(context).width / 4,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: MediaQuery.sizeOf(context).width / 3,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: MediaQuery.sizeOf(context).width / 6,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: MediaQuery.sizeOf(context).width / 9,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
