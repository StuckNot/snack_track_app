import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_domain/profile_domain.dart';
import 'package:snack_track_app/l10n/l10n.dart';
import 'package:snack_track_app/profile/profile.dart';
import 'package:snack_track_app/profile/widgets/profile_tile.dart';

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
    context.read<ProfileBloc>().add(const LoadProfile());
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProfileLoaded) {
            return ListView.separated(
              itemBuilder: (context, index) => ProfileTile(
                title: state.profile.keys.elementAt(index),
                value: state.profile.values.elementAt(index).toString(),
              ),
              separatorBuilder: (_, _) => const Divider(),
              itemCount: state.profile.length,
            );
          } else {
            return const Text('Error');
          }
        },
      ),
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
    );
  }
}
