<link rel="stylesheet" href="https://unpkg.com/swagger-ui-dist@latest/swagger-ui.css">
<script src="https://unpkg.com/swagger-ui-dist@latest/swagger-ui-bundle.js"></script>

<div id="swagger-ui"></div>

<script>
    window.onload = function () {
        window.ui = SwaggerUIBundle({
            url: '{{ base_path('reference/jds.yml') }}',
            dom_id: '#swagger-ui',
            deepLinking: true,
            presets: [
                SwaggerUIBundle.presets.apis,
            ],
            layout: 'BaseLayout',
        });
    };
</script>
