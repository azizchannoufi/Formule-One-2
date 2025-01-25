import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:core/core.dart';
import '../bloc/home_bloc.dart';
import '../widget/widgets.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state.status == FormzSubmissionStatus.inProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == FormzSubmissionStatus.failure) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Top 10 ranking 2021",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: state.drivers.isNotEmpty
                      ? ListView.builder(
                    itemCount: state.drivers.length,
                    itemBuilder: (context, index) {
                      final driver = state.drivers[index];
                      return PilotCard(
                        rank: index + 1,
                        name: "${driver.full_name} ",
                        team: driver.team_name ?? "Unknown",
                        image: driver.headshot_url!,
                      );
                    },
                  )
                      : const Center(child: Text("No data available")),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
