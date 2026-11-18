{{flutter_js}}
{{flutter_build_config}}
function startupFailure() {
  const message = document.getElementById('startup-message');
  if (message) message.textContent = 'Não foi possível iniciar. / Could not start.';
  const retry = document.getElementById('startup-retry');
  if (retry) retry.hidden = false;
}
Promise.resolve(_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    try {
      const runner = await engineInitializer.initializeEngine();
      await runner.runApp();
      document.getElementById('startup')?.remove();
    } catch (_) { startupFailure(); }
  }
})).catch(startupFailure);
