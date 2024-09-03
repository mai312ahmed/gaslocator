import 'package:flutter/material.dart';

class RotatingCube extends StatefulWidget {
  const RotatingCube({super.key});

  @override
  RotatingCubeState createState() => RotatingCubeState();
}

class RotatingCubeState extends State<RotatingCube>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  void _toggleCube() {
    if (_showFrontSide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _toggleCube,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_controller.value * 3.14),
                      child: _controller.value <= 0.5
                          ? _buildFront()
                          : _buildBack(),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_controller.value * 3.14),
                      child: _controller.value <= 0.5
                          ? _buildFront()
                          : _buildBack(),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_controller.value * 3.14),
                      child: _controller.value <= 0.5
                          ? _buildFront()
                          : _buildBack(),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_controller.value * 3.14),
                      child: _controller.value <= 0.5
                          ? _buildFront()
                          : _buildBack(),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_controller.value * 3.14),
                      child: _controller.value <= 0.5
                          ? _buildFront()
                          : _buildBack(),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_controller.value * 3.14),
                      child: _controller.value <= 0.5
                          ? _buildFront()
                          : _buildBack(),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_controller.value * 3.14),
                      child: _controller.value <= 0.5
                          ? _buildFront()
                          : _buildBack(),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_controller.value * 3.14),
                      child: _controller.value <= 0.5
                          ? _buildFront()
                          : _buildBack(),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_controller.value * 3.14),
                      child: _controller.value <= 0.5
                          ? _buildFront()
                          : _buildBack(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      width: 100,
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text(
        'Front',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  Widget _buildBack() {
    return Container(
      width: 100,
      height: 200,
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text(
        'X',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
