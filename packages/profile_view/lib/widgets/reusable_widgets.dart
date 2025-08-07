import 'package:flutter/material.dart';

/// A reusable widget for displaying a metric card with a value and a label.
///
/// [value] The main numerical or textual value to display.
/// [label] The descriptive text below the value.
Widget buildMetricCard(String value, String label) {
  return Container(
    width: 90, // Fixed width for consistent card size
    height: 110, // Fixed height for consistent card size
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20), // Rounded corners for a modern look
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Subtle shadow for depth
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3), // Bottom shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center, // Center label text
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

/// A reusable widget for displaying a friend's avatar and name.
///
/// [name] The name of the friend.
/// [imageUrl] The URL for the friend's profile image.
Widget buildFriendItem(String name, String imageUrl) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0), // Spacing between friend items
    child: Column(
      children: [
        Stack( // Allows overlapping widgets (avatar and online indicator)
          children: [
            CircleAvatar(
              radius: 30, // Size of the avatar
              backgroundImage: NetworkImage(imageUrl), // Friend's profile image
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.green, // Green dot for online indicator
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2), // White border around the dot
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8), // Space between avatar and name
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

/// A reusable widget for displaying a goal card with a value, unit, label, and a colored dot.
///
/// [value] The numerical value of the goal.
/// [unit] The unit for the goal (e.g., 'kg', 'steps'). Can be empty.
/// [label] The description of the goal (e.g., 'Weight goal').
/// [dotColor] The color of the small circular indicator.
Widget buildGoalCard(String value, String unit, String label, Color dotColor) {
  return Container(
    height: 150, // Fixed height for consistent card size
    width:90,
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Subtle shadow
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start (left)
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: dotColor, // The colored dot indicator
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10), // Space below the dot
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        if (unit.isNotEmpty) // Conditionally display unit if not empty
          Text(
            unit,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        const Spacer(), // Pushes the label to the bottom of the card
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    ),
  );
}

class VegIcon extends StatelessWidget {
  const VegIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.square , color: Colors.white,size:30.0),
        Icon(Icons.circle, color: Colors.green, size: 24.0), // Outer circle

      ],
    );
  }
}
