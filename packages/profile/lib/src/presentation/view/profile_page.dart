import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/l10n/l10n.dart';
import 'package:profile/src/domain/entities/user_profile.dart';
import 'package:profile/src/presentation/bloc/profile_bloc.dart';
import 'package:profile/src/presentation/widgets/profile_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(LoadProfile(context));
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileAppBarTitle)),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProfileLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemBuilder: (context, index) => ProfileTile(
                title: state.profile.keys.elementAt(index),
                value: state.profile.values.elementAt(index).toString(),
              ),
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemCount: state.profile.length,
            );
          } else {
            return const Text('Error');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ProfileBloc>().add(
          SetProfile(
            const UserProfile(
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
            context,
          ),
        ),
        child: const Text('Save'),
      ),
    );
  }
}
