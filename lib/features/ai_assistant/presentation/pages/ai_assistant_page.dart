import 'package:app_boilerplate/core/theme/app_spacing.dart';
import 'package:app_boilerplate/core/ui/widgets/ai_orb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AiAssistantPage extends StatefulWidget {
  const AiAssistantPage({super.key});

  @override
  State<AiAssistantPage> createState() => _AiAssistantPageState();
}

class _AiAssistantPageState extends State<AiAssistantPage> {
  AiOrbState _state = AiOrbState.idle;

  String get _statusLabel {
    switch (_state) {
      case AiOrbState.idle:
        return 'Tap the orb to start';
      case AiOrbState.listening:
        return 'Listening...';
      case AiOrbState.thinking:
        return 'Thinking...';
    }
  }

  void _cycleState() {
    setState(() {
      _state = switch (_state) {
        AiOrbState.idle => AiOrbState.listening,
        AiOrbState.listening => AiOrbState.thinking,
        AiOrbState.thinking => AiOrbState.idle,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _cycleState,
                child: AiOrb(state: _state),
              ),
              SizedBox(height: AppSpacing.xl),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Text(
                  _statusLabel,
                  key: ValueKey(_statusLabel),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
