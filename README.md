# multimaze

A multiplayer maze game powered by a Flutter client and Firebase backend.
Only built to target the web, as the `speech_to_text` dependency does not work on desktop.

## Deploying the web client

```sh
$ cd multimaze-ui
$ flutter build web && cp -r build/web/* ../multimaze-server/public/
$ cd ../multimaze-server
$ firebase deploy --only hosting
```
