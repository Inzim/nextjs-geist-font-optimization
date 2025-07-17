import 'package:flutter/material.dart';
import 'change_password_screen.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.folder_shared,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(height: 8),
                Text(
                  'E-Filing System',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            icon: Icons.add_circle_outline,
            title: 'Create New File',
            index: 0,
            context: context,
          ),
          _buildDrawerItem(
            icon: Icons.pending_actions,
            title: 'Pending Files',
            index: 1,
            context: context,
          ),
          _buildDrawerItem(
            icon: Icons.folder,
            title: 'My Files',
            index: 2,
            context: context,
          ),
          _buildDrawerItem(
            icon: Icons.warning_amber,
            title: 'Files Action Required',
            index: 3,
            context: context,
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.lock,
            title: 'Change Password',
            index: 4,
            context: context,
          ),
          _buildDrawerItem(
            icon: Icons.logout,
            title: 'Logout',
            index: 5,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required int index,
    required BuildContext context,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: selectedIndex == index
            ? Theme.of(context).colorScheme.primary
            : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: selectedIndex == index
              ? Theme.of(context).colorScheme.primary
              : null,
          fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: selectedIndex == index,
      onTap: () {
        Navigator.pop(context);
        if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChangePasswordScreen(),
            ),
          );
        } else if (index == 5) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          onItemSelected(0);
        } else {
          onItemSelected(index);
        }
      },
    );
  }
}
