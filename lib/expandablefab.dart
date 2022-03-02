import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
  }) : super(key: key);

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
          _buildTapToCloseFab(),
        ],
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 100.0 / (count - 1);
    for (var i = 0, angleInDegrees = pi + 37;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance * 1.2,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.bottomCenter,
        transform: Matrix4.diagonal3Values(
          _open ? 0.65 : 1.0,
          _open ? 0.65 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 1 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.elasticInOut),
          duration: const Duration(milliseconds: 250),
          child: GestureDetector(
            onLongPress: _toggle,
            child: SizedBox(
              height: 100,
              width: 100,
              child: FloatingActionButton(
                elevation: 0,
                highlightElevation: 0,
                backgroundColor:
                    _open ? Colors.white : const Color.fromARGB(225, 69, 19, 1),
                splashColor: Colors.white,
                onPressed: () {
                  _toggle();
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return Visibility(
      visible: _open,
      child: SizedBox(
        width: 62,
        height: 62,
        child: FloatingActionButton(
          elevation: 0,
          highlightElevation: 0,
          backgroundColor: const Color.fromARGB(255, 120, 60, 8),
          splashColor: Colors.white,
          onPressed: () {
            _toggle();
          },
          child: const Icon(
            Icons.close,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    Key? key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          height: 80,
          width: MediaQuery.of(context).size.width,
          right: offset.dx,
          bottom: offset.dy - 10,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: const Color.fromARGB(245, 155, 108, 77),
      elevation: 4.0,
      child: IconTheme.merge(
        data: theme.primaryIconTheme,
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
