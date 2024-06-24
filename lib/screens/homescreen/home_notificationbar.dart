import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plotsfolio/state/current_volume.dart';
import 'package:plotsfolio/state/expansiontile_controller.dart';
import 'package:plotsfolio/utils/utils.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreenNotificationBar extends StatelessWidget {
  const HomeScreenNotificationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ExpansionTile(
        controller: sExpansionTileController.watch(context),
        tilePadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: const NotificationBarSmallTime(),
        title: const NotificationBarIconRowLeft(),
        trailing: const NotificationBarIconRowRight(),
        children: <Widget>[
          Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('12:00 Sun, Jun 16'),
                    FaIcon(FontAwesomeIcons.gear),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              const SizedBox(height: 8),
              const NotificationBarLargeToggleRow(),
              const SizedBox(height: 16),
              const NotificationBarLargeVolumeSlider(),
              const SizedBox(height: 8),
              NotificationBarLargeNotification(
                icon: FontAwesomeIcons.xTwitter,
                iconSize: 16,
                iconColor: Utils.gunMetal,
                title: ':plotsklapps',
                subtitle: 'Follow me on X',
                onTap: () async {
                  await Utils.launchXURL();
                },
                expandedTitle: 'X profile',
                expandedSubtitle: 'Click here to visit my X profile',
              ),
              NotificationBarLargeNotification(
                icon: FontAwesomeIcons.github,
                iconSize: 16,
                iconColor: Utils.gunMetal,
                title: ':plotsklapps',
                subtitle: 'Follow me on GitHub',
                onTap: () async {
                  await Utils.launchGithubURL();
                },
                expandedTitle: 'GitHub repositories',
                expandedSubtitle: 'Click here to visit my GitHub profile',
              ),
              NotificationBarLargeNotification(
                icon: FontAwesomeIcons.hashnode,
                iconSize: 16,
                iconColor: Utils.gunMetal,
                title: ':plotsklapps',
                subtitle: 'Follow me on Hashnode',
                onTap: () async {
                  await Utils.launchHashnodeURL();
                },
                expandedTitle: 'Hashnode blog posts',
                expandedSubtitle: 'Click here to visit my Hashnode profile',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationBarIconRowLeft extends StatelessWidget {
  const NotificationBarIconRowLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FaIcon(
          FontAwesomeIcons.xTwitter,
          size: 20,
          color: Utils.gunMetal,
        ),
        FaIcon(
          FontAwesomeIcons.github,
          size: 20,
          color: Utils.gunMetal,
        ),
        SizedBox(width: 2),
        FaIcon(
          FontAwesomeIcons.hashnode,
          size: 20,
          color: Utils.gunMetal,
        ),
      ],
    );
  }
}

class NotificationBarIconRowRight extends StatelessWidget {
  const NotificationBarIconRowRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FaIcon(
          FontAwesomeIcons.wifi,
          size: 16,
          color: Utils.gunMetal,
        ),
        FaIcon(
          FontAwesomeIcons.signal,
          size: 16,
          color: Utils.gunMetal,
        ),
        SizedBox(width: 4),
        FaIcon(
          FontAwesomeIcons.batteryThreeQuarters,
          size: 20,
          color: Utils.gunMetal,
        ),
      ],
    );
  }
}

class NotificationBarSmallTime extends StatelessWidget {
  const NotificationBarSmallTime({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '12:00',
      style: TextStyle(
        fontSize: 20,
        color: Utils.gunMetal,
      ),
    );
  }
}

class NotificationBarLargeToggle extends StatelessWidget {
  const NotificationBarLargeToggle({
    required this.radius,
    required this.color,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    super.key,
  });

  final double radius;
  final Color color;
  final IconData icon;
  final double iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: FaIcon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}

class NotificationBarLargeToggleRow extends StatelessWidget {
  const NotificationBarLargeToggleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        NotificationBarLargeToggle(
          radius: 20,
          color: Utils.flame,
          icon: FontAwesomeIcons.wifi,
          iconSize: 16,
          iconColor: Utils.gunMetal,
        ),
        NotificationBarLargeToggle(
          radius: 20,
          color: Utils.flame,
          icon: FontAwesomeIcons.signal,
          iconSize: 16,
          iconColor: Utils.gunMetal,
        ),
        NotificationBarLargeToggle(
          radius: 20,
          color: Utils.flame,
          icon: FontAwesomeIcons.signal,
          iconSize: 16,
          iconColor: Utils.gunMetal,
        ),
        NotificationBarLargeToggle(
          radius: 20,
          color: Utils.flame,
          icon: FontAwesomeIcons.bluetooth,
          iconSize: 20,
          iconColor: Utils.gunMetal,
        ),
        NotificationBarLargeToggle(
          radius: 20,
          color: Utils.gunMetal,
          icon: FontAwesomeIcons.unlock,
          iconSize: 16,
          iconColor: Utils.lightGrey,
        ),
        NotificationBarLargeToggle(
          radius: 20,
          color: Utils.gunMetal,
          icon: FontAwesomeIcons.solidLightbulb,
          iconSize: 16,
          iconColor: Utils.lightGrey,
        ),
      ],
    );
  }
}

class NotificationBarLargeVolumeSlider extends StatelessWidget {
  const NotificationBarLargeVolumeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: sCurrentVolume.watch(context),
      max: 100,
      divisions: 25,
      onChanged: (double value) {
        sCurrentVolume.value = value;
      },
      label: sCurrentVolume.watch(context).round().toString(),
      activeColor: Utils.flame,
      inactiveColor: Utils.gunMetal,
    );
  }
}

class NotificationBarLargeNotification extends StatelessWidget {
  const NotificationBarLargeNotification({
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.expandedTitle,
    required this.expandedSubtitle,
    super.key,
  });

  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String expandedTitle;
  final String expandedSubtitle;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: FaIcon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const FaIcon(
        FontAwesomeIcons.chevronDown,
        size: 16,
        color: Utils.gunMetal,
      ),
      children: <Widget>[
        ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 12,
            child: Image.asset(
              'assets/images/plotsklappsIcon.png',
            ),
          ),
          title: Text(expandedTitle),
          subtitle: Text(expandedSubtitle),
        ),
      ],
    );
  }
}
