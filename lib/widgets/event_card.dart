import 'package:flutter/material.dart';
import 'package:readuslive/models/event_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          event.title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                <boltAction type="file" filePath="lib/widgets/event_card.dart">
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          DateFormat('MMM dd, yyyy • hh:mm a').format(event.eventDate),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ),
  ),
  if (event.isLive)
    Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.white,
              size: 8,
            ),
            const SizedBox(width: 4),
            Text(
              'LIVE',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
],
),
),
Padding(
padding: const EdgeInsets.all(12.0),
child: Row(
children: [
CircleAvatar(
radius: 20,
backgroundImage: CachedNetworkImageProvider(event.authorImage),
),
const SizedBox(width: 12),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
event.authorName,
style: Theme.of(context).textTheme.bodyMedium?.copyWith(
fontWeight: FontWeight.bold,
),
maxLines: 1,
overflow: TextOverflow.ellipsis,
),
Text(
'${event.attendeeCount} attendees',
style: Theme.of(context).textTheme.bodySmall,
),
],
),
),
ElevatedButton(
onPressed: onTap,
style: ElevatedButton.styleFrom(
padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
minimumSize: Size.zero,
tapTargetSize: MaterialTapTargetSize.shrinkWrap,
),
child: const Text('Join'),
),
],
),
),
],
),
),
);
}
}
