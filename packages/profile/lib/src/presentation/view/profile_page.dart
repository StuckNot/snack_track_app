import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/domain/entities/user_profile.dart';
import 'package:profile/src/presentation/bloc/profile_bloc.dart';
import 'package:profile/src/presentation/widgets/goals.dart';
import 'package:profile/src/presentation/widgets/health_conditions.dart';
import 'package:profile/src/presentation/widgets/overview.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ProfileBloc>().add(
          const SetProfile(
            UserProfile(
              name: 'Sunpreet',
              age: 30,
              gender: 'M',
              healthConditions: ['sugar','hypertension'],
              language: 'English',
              nationality: 'India',
              dietPreference: 'Veg',
              heightCm: 172,
              weightKg: 65,
            ),
          ),
        ),
        child: const Text('Save'),
      ),
      body: BlocProvider(
        create: (_) {
          return ProfileBloc()..add(const LoadProfile());
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const CircularProgressIndicator();
            } else if (state is ProfileLoaded) {
              return ProfileView(profile: state.profile);
            } else {
              return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  final UserProfile? profile;

  const ProfileView({required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ColoredBox(
          color: Colors.black87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
              Text(
                profile?.name ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Overview(
              age: profile?.age ?? 0,
              weight: profile?.weightKg ?? 0,
              height: profile?.heightCm ?? 0,
            ),
            const Goals(),
            HealthConditions(
              healthConditions: profile?.healthConditions,
            ),
          ],
        ),
      ],
    );
  }
}
