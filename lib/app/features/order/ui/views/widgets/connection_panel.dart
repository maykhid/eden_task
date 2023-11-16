import 'package:eden_task/app/features/order/ui/connection_view_model.dart'
    as connect;
import 'package:eden_task/app/shared/ui/fading_widget.dart';
import 'package:eden_task/core/utils/connection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionPanel extends StatefulWidget {
  const ConnectionPanel({
    super.key,
  });

  @override
  State<ConnectionPanel> createState() => _ConnectionPanelState();
}

class _ConnectionPanelState extends State<ConnectionPanel> {
  // late ConnectionViewModel connection;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<connect.ConnectionCubit>(
      create: (context) => connect.ConnectionCubit(),
      child: BlocBuilder<connect.ConnectionCubit, connect.ConnectionState>(
        builder: (context, state) {
          final connectionState = state.connectionState;

          if (connectionState.isConnected) {
            return const ConnectionSignal();
          }

          return const DisconnectionSignal();
        },
      ),
    );
  }
}

class DisconnectionSignal extends StatelessWidget {
  const DisconnectionSignal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FadingWidget(
          child: Icon(
            Icons.circle,
            color: Colors.red,
            size: 8,
          ),
        ),
        Text(
          'disconnected',
          style: TextStyle(color: Colors.red, fontSize: 8),
        ),
      ],
    );
  }
}

class ConnectionSignal extends StatelessWidget {
  const ConnectionSignal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FadingWidget(
          child: Icon(
            Icons.circle,
            color: Colors.green,
            size: 12,
          ),
        ),
        Text(
          'connected',
          style: TextStyle(color: Colors.green, fontSize: 8),
        ),
      ],
    );
  }
}
