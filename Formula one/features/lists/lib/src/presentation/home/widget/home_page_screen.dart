import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';
import '../widget/widgets.dart';
import 'package:preferences/preferences.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == FormzStatus.submissionFailure) {
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
                        color: FoundationColors.primaryColor,
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
