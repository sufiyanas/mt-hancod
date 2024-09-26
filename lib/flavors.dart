enum Flavor {
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'MT Hancod Dev';
      case Flavor.production:
        return 'MT Hancod';
      default:
        return 'title';
    }
  }

  static String get supabaseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return 'https://toqwqrybalvgmdcfkkvm.supabase.co';
      case Flavor.production:
        return '';
      default:
        return '';
    }
  }

  static String get supabaseAnonKey {
    switch (appFlavor) {
      case Flavor.development:
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRvcXdxcnliYWx2Z21kY2Zra3ZtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjcyNDM5NjgsImV4cCI6MjA0MjgxOTk2OH0.gBbYLDveGOTEGD4J6B0Gum3jnvVE6IktZffb9dM8YDA';
      case Flavor.production:
        return '';
      default:
        return '';
    }
  }
}
