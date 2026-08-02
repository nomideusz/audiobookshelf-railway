# Deploy and Host Audiobookshelf on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/audiobookshelf?utm_medium=integration&utm_source=button&utm_campaign=audiobookshelf)

[Audiobookshelf](https://www.audiobookshelf.org/) is a free and open source self-hosted audiobook and podcast server. It streams your audiobooks and podcasts to any device with progress sync across all of them, a modern web player, and official mobile apps for iOS and Android. Chapters, bookmarks, sleep timers, series tracking, multi-user support, and automatic metadata fetching are all built in.

## About Hosting Audiobookshelf

This template runs Audiobookshelf as a single Railway service. The config database, metadata cache, and your media library all persist on one attached volume at `/data`, with library folders pre-created at `/data/library/audiobooks` and `/data/library/podcasts`. Getting books in is built in: Audiobookshelf's web UI has native drag-and-drop upload, so no extra file-manager sidecar is needed. Podcast episodes download server-side straight to the volume.

## Common Use Cases

- Your own Audible: stream your audiobook collection to browser, phone, or car from anywhere
- Podcast archive that auto-downloads new episodes and never loses them to feed rot
- Family audiobook server with per-user accounts, progress sync, and listening stats

## Dependencies for Audiobookshelf Hosting

- None — Audiobookshelf and ffmpeg are in the one service

### Deployment Dependencies

- [Audiobookshelf documentation](https://www.audiobookshelf.org/docs)
- [Official mobile apps](https://www.audiobookshelf.org/docs#mobile-apps)
- [Template source on GitHub](https://github.com/nomideusz/audiobookshelf-railway)

### Implementation Details

**First boot:** open the service's Railway domain and create your admin account.

**Adding libraries:** the template pre-creates `/data/library/audiobooks` and `/data/library/podcasts` on the volume. Create your first library in Settings → Libraries and point it at one of those folders (audiobooks as media type "Books", podcasts as "Podcasts").

**Uploading audiobooks:** use the Upload button in the web UI — drag and drop audio files or whole book folders, pick the library, done. An `Author/Book Title/files` layout gives the best automatic matching.

**Mobile apps:** the official [Audiobookshelf apps](https://www.audiobookshelf.org/docs#mobile-apps) (iOS TestFlight/App Store, Android Play Store) connect with your Railway domain as the server address.

Notes and limits:

- Storage is bounded by your volume size (grow it in the service settings; Hobby plan caps volumes at 5 GB).
- `PORT` is used by Railway's healthcheck probing — leave it at 80.
- Audio streams direct-play by default; transcoding (rare, e.g. for old formats) runs on CPU via the bundled ffmpeg.

## Why Deploy Audiobookshelf on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Audiobookshelf on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
