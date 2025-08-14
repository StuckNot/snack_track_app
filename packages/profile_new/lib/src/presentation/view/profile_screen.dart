import 'package:flutter/material.dart';
// Import the reusable widgets file. Make sure 'profile_view' matches your actual project name.
import '../widgets/reusable_widgets.dart';

class FitnessProfileScreen extends StatelessWidget {
  const FitnessProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // Wrap the SingleChildScrollView with SafeArea to add top padding
      body: SafeArea(
        child: SingleChildScrollView( // Allows the content to scroll if it overflows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out content horizontally
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'John Ferguson', // User's name
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            // Replaced running icon with a vegetarian icon
                            VegIcon(),
                          ],
                        ),
                        Text(
                          'Vegetarian', // User's title/description (updated)
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // Replaced tune icon with an exit button
                    Icon(Icons.exit_to_app, color: Colors.deepOrange), // Exit button icon
                  ],
                ),
              ),
              const SizedBox(height: 20), // Vertical spacing
              Center(
                child: Stack( // Used for overlapping the profile image and its border
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3), // White border around the avatar
                      ),
                      child: const CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            'https://placehold.co/150x150/000000/FFFFFF?text=User'), // Placeholder image for user
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Vertical spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribute metric cards evenly
                  children: [
                    // Using reusable buildMetricCard widget
                    buildMetricCard('34', 'Age\nSteps'),
                    buildMetricCard('70 kg', 'Weight'),
                    buildMetricCard('175 cm', 'Height'),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Vertical spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Friends', // Friends section title
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Friends rating >', // Link to friends rating
                      style: TextStyle(
                        color: Colors.deepOrange.shade300,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15), // Vertical spacing
              SizedBox(
                height: 100, // Fixed height for the horizontal friends list
                child: ListView(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    // Using reusable buildFriendItem widget
                    buildFriendItem('Andrew', 'https://placehold.co/60x60/000000/FFFFFF?text=A'),
                    buildFriendItem('Shawn', 'https://placehold.co/60x60/000000/FFFFFF?text=S'),
                    buildFriendItem('Lucy', 'https://placehold.co/60x60/000000/FFFFFF?text=L'),
                    buildFriendItem('Alex', 'https://placehold.co/60x60/000000/FFFFFF?text=Al'),
                    buildFriendItem('Tony', 'https://placehold.co/60x60/000000/FFFFFF?text=T'),

                  ],
                ),
              ),
              const SizedBox(height: 30), // Vertical spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Goals', // Goals section title
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // TODO: Implement add goal action
                      },
                      icon: const Icon(Icons.add, color: Colors.deepOrange), // Add icon
                      label: const Text(
                        'Add goal +',
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15), // Vertical spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded( // Allows goal cards to take equal space
                      child: buildGoalCard( // Using reusable buildGoalCard widget
                        '76',
                        'kg',
                        'Weight goal',
                        Colors.purple,
                      ),
                    ),
                    const SizedBox(width: 16), // Spacing between goal cards
                    Expanded(
                      child: buildGoalCard( // Using reusable buildGoalCard widget
                        '2 000',
                        'steps',
                        'Activity goal',
                        Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 16), // Spacing between goal cards
                    Expanded(
                      child: buildGoalCard( // Using reusable buildGoalCard widget
                        'Lose Weight',
                        '', // No unit for this one in the image
                        '', // Partial text from image
                        Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              // Added a SizedBox for the time display at the top, now that AppBar is gone
              const SizedBox(height: 30), // Adjust this value as needed for desired spacing
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),

              ),


              const SizedBox(height: 100), // Space for the bottom nav bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepOrange, // Color for the selected icon
        unselectedItemColor: Colors.grey, // Color for unselected icons
        showSelectedLabels: false, // Hide labels for selected items
        showUnselectedLabels: false, // Hide labels for unselected items
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart), // Stats icon
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle), // Middle button icon
            label: 'Middle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), // Profile icon
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}