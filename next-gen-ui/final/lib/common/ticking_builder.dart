import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickingBuilder extends StatefulWidget {
  const TickingBuilder({super.key, required this.builder});
  final Widget Function(BuildContext context, double time) builder;
  @override
  State<TickingBuilder> createState() => _TickingBuilderState();
}

class _TickingBuilderState extends State<TickingBuilder>
    with TickerProviderStateMixin {
  late final Ticker _ticker;
  double _time = 0.0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_handleTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _handleTick(Duration elapsed) {
    setState(() => _time = elapsed.inMilliseconds.toDouble() / 1000.0);
  }

  @override
  Widget build(BuildContext context) => widget.builder.call(context, _time);
}
