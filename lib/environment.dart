class Environment {
  // URL base del servicio
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://rickandmortyapi.com/api',
  );
  // Nombre del servicio
  static const String serviceName = String.fromEnvironment(
    'SERVICE_NAME',
    defaultValue: 'RickAndMorty',
  );
}