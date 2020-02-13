# User News and Weather as a Three Services

This chart creates a three services. The services are:

- weather
- news
- user-news-and-weather

The APIKeys for NewsAPI and OpenWeatherMap are set in values.yaml for this demo scenario. In production environments these should be deployed as out of band secrets.

```
news:
  # The API key for NewsAPI.org
  backendKey: yourNewsAPIOrgKey

weather:
  # The API Key for OpenWeatherMap.org
  backendKey: yourOpenWeatherMapKey
```

These are then passed into the services as environment variables that override the config:

```
...
            - name: NEWSAPI_APIKEY
              value: {{ .Values.news.backendKey }}
...
            - name: OPENWEATHER_APIKEY
              value: {{ .Values.weather.backendKey }}
...
```
