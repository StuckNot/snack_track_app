import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/l10n/l10n.dart';
import 'package:profile/src/domain/entities/user_profile.dart';
import 'package:profile/src/presentation/bloc/profile_bloc.dart';
import 'package:profile/src/presentation/widgets/goals.dart';
import 'package:profile/src/presentation/widgets/overview.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileAppBarTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ProfileBloc>().add(
          const SetProfile(
            UserProfile(
              name: 'Sunpreet',
              age: 30,
              gender: 'M',
              healthConditions: ['sugar'],
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

  const ProfileView({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Overview(), Goals()],
    );
  }
}

