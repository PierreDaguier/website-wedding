# wedding_website

A new Flutter project.

## Secrets

Les renseignements personnels sont chargés via un fichier `secrets.json` non
versionné. Pour le créer :

1. Dupliquez `secrets.sample.json` en `secrets.json`.
2. Remplissez les valeurs.
3. Lancez l'app avec `--dart-define-from-file=secrets.json` :

```
flutter run -d chrome --dart-define-from-file=secrets.json
```

Pour une build web :

```
flutter build web --dart-define-from-file=secrets.json
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
