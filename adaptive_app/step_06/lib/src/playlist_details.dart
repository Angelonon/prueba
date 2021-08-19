import 'package:flutter/material.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';

import 'adaptive_image.dart';
import 'adaptive_text.dart';
import 'app_state.dart';

class PlaylistDetails extends StatelessWidget {
  const PlaylistDetails(
      {required this.playlistId, required this.playlistName, Key? key})
      : super(key: key);
  final String playlistId;
  final String playlistName;

  @override
  Widget build(BuildContext context) {
    return Consumer<FlutterDevPlaylists>(
      builder: (context, flutterDev, _) {
        final playlistItems = flutterDev.playlistItems(playlistId: playlistId);
        if (playlistItems.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return _PlaylistDetailsListView(playlistItems: playlistItems);
      },
    );
  }
}

class _PlaylistDetailsListView extends StatelessWidget {
  const _PlaylistDetailsListView({Key? key, required this.playlistItems})
      : super(key: key);
  final List<PlaylistItem> playlistItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: ScrollController(),
      itemCount: playlistItems.length,
      itemBuilder: (context, index) {
        final playlistItem = playlistItems[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: AdaptiveText(playlistItem.snippet!.title!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AdaptiveText(playlistItem.snippet!.description!),
                if (playlistItem.snippet?.resourceId?.videoId != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Link(
                        uri: Uri.parse(
                            'https://www.youtube.com/watch?v=${playlistItem.snippet!.resourceId!.videoId}'),
                        builder: (context, followLink) => TextButton(
                          onPressed: followLink,
                          child: const AdaptiveText('Play'),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
              ],
            ),
            leading: AdaptiveImage.network(
                playlistItem.snippet!.thumbnails!.default_!.url!),
          ),
        );
      },
    );
  }
}
