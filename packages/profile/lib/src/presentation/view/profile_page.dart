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
      create: (_) {
        return ProfileBloc()..add(const LoadProfile());
      },
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileAppBarTitle)),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProfileLoaded) {
            final data =<String,dynamic>{
              l10n.profileNameTitle: state.profile?.name??'',
              l10n.profileAgeTitle: state.profile?.age??'',
              l10n.profileDietTitle: state.profile?.dietPreference??'',
              l10n.profileGenderTitle: state.profile?.gender??'',
              l10n.profileWeightTitle: state.profile?.weightKg??'',
              l10n.profileHeightTitle: state.profile?.heightCm??'',
            };
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemBuilder: (context, index) => ProfileTile(
                title: data.keys.elementAt(index),
                value: data.values.elementAt(index).toString(),
              ),
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemCount: data.length,
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
