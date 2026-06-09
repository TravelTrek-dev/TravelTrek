import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_trek/Features/auth/domain/entity/user_entity.dart';
import 'package:travel_trek/Features/auth/presentation/views/sign_in_view.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ProfileViewBody());
  }
}

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  UserEntity? userEntity;
  String? _profileImagePath;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadUser();
    _loadProfileImage();
  }

  void _loadUser() {
    setState(() {
      userEntity = Prefs.getUserEntity();
    });
  }

  void _loadProfileImage() {
    final path = Prefs.getString(kProfileImagePath);
    if (path.isNotEmpty) {
      setState(() => _profileImagePath = path);
    }
  }

  // ── Pick image ────────────────────────────────────────────────────────────
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 600,
        maxHeight: 600,
      );
      if (picked == null) return;
      await Prefs.setString(kProfileImagePath, picked.path);
      setState(() => _profileImagePath = picked.path);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not pick image: $e')),
      );
    }
  }

  void _showImageSourceSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD1C7C3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Change Profile Photo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D2926),
                ),
              ),
              const SizedBox(height: 20),
              _SourceTile(
                icon: Icons.photo_library_outlined,
                label: 'Choose from Gallery',
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(ImageSource.gallery);
                },
              ),
              const SizedBox(height: 8),
              _SourceTile(
                icon: Icons.camera_alt_outlined,
                label: 'Take a Photo',
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(ImageSource.camera);
                },
              ),
              if (_profileImagePath != null) ...[
                const SizedBox(height: 8),
                _SourceTile(
                  icon: Icons.delete_outline,
                  label: 'Remove Photo',
                  color: const Color(0xFFB0413E),
                  onTap: () async {
                    await Prefs.setString(kProfileImagePath, '');
                    setState(() => _profileImagePath = null);
                    if (!mounted) return;
                    Navigator.pop(ctx);
                  },
                ),
              ],
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  // ── Edit Profile sheet ───────────────────────────────────────────────────
  void _showEditProfileSheet() {
    final controller = TextEditingController(text: userEntity?.name ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD1C7C3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D2926),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Display Name',
                  labelStyle: const TextStyle(color: Color(0xFF847577)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide:
                        const BorderSide(color: Color(0xFF66595B), width: 2),
                  ),
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Color(0xFF847577),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(54),
                    backgroundColor: const Color(0xFF66595B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () async {
                    final updatedName = controller.text.trim();
                    if (updatedName.isEmpty) return;
                    final existing = userEntity;
                    if (existing == null) return;
                    final updatedUser = UserEntity(
                      name: updatedName,
                      email: existing.email,
                      uId: existing.uId,
                      accessToken: existing.accessToken,
                      refreshToken: existing.refreshToken,
                    );
                    await Prefs.setUserEntity(updatedUser);
                    setState(() => userEntity = updatedUser);
                    if (!mounted) return;
                    Navigator.pop(ctx);
                  },
                  child: const Text('Save Changes'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  Future<void> _logout() async {
    await Prefs.removeUserEntity();
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInView.routeName,
      (route) => false,
    );
  }

  // ── Build ────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final displayName = userEntity?.name ?? 'Traveler';
    final displayEmail = userEntity?.email ?? 'hello@traveltrek.com';
    final hasImage =
        _profileImagePath != null && _profileImagePath!.isNotEmpty;

    return Container(
      color: const Color(0xFFF5F5EA),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Avatar ───────────────────────────────────────────────────
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFD1C7C3),
                          width: 2,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.08),
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: hasImage
                          ? Image.file(
                              File(_profileImagePath!),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stack) =>
                                  _AvatarInitial(name: displayName),
                            )
                          : _AvatarInitial(name: displayName),
                    ),

                    // Camera badge
                    GestureDetector(
                      onTap: _showImageSourceSheet,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFF66595B),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.5),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Name
              Text(
                displayName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D2926),
                ),
              ),
              const SizedBox(height: 6),

              // Email
              Text(
                displayEmail,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF847577),
                  letterSpacing: 0.2,
                ),
              ),

              const SizedBox(height: 32),

              // ── Settings card ────────────────────────────────────────────
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _ProfileTile(
                      icon: Icons.edit_outlined,
                      title: 'Edit Profile',
                      onTap: _showEditProfileSheet,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 56,
                      color: Color(0xFFF0ECEB),
                    ),
                    _ProfileTile(
                      icon: Icons.add_photo_alternate_outlined,
                      title: 'Change Profile Photo',
                      onTap: _showImageSourceSheet,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 56,
                      color: Color(0xFFF0ECEB),
                    ),
                    _ProfileTile(
                      icon: Icons.info_outline,
                      title: 'About TravelTrek',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Logout ───────────────────────────────────────────────────
              GestureDetector(
                onTap: _logout,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                        blurRadius: 16,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.logout, color: Color(0xFFB0413E)),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Color(0xFFB0413E),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Color(0xFFB0413E)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Avatar Initials ──────────────────────────────────────────────────────────

class _AvatarInitial extends StatelessWidget {
  const _AvatarInitial({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : 'T',
        style: const TextStyle(
          color: Color(0xFF847577),
          fontSize: 40,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// ─── Source Picker Tile ───────────────────────────────────────────────────────

class _SourceTile extends StatelessWidget {
  const _SourceTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? const Color(0xFF2D2926);
    return Material(
      color: const Color(0xFFF8F7F4),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: c, size: 22),
              const SizedBox(width: 14),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: c,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Profile Tile ─────────────────────────────────────────────────────────────

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            children: [
              Icon(icon, size: 22, color: const Color(0xFF847577)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF2D2926),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFFBDB6B4)),
            ],
          ),
        ),
      ),
    );
  }
}
