# AMPLIFY Mesh Demo

## Installing 

### Create the cluster
This example uses k3d to create the cluster. It can be done equally well with minikube or a cloud hosted cluster.

```
. ./k3d.sh
```

This script creates the cluster, installs helm and loads in the images the demo will use.

### Connecting to AMPLIFY Central

For convenience this setup is creating a self-signed key for the central cluster and pregenerate keys for SDA and CSA agents. In production you should follow the steps in: https://docs.axway.com/bundle/axway-open-docs/page/docs/central/add_hybrid_env/index.html

```
./mesh-connect.sh <pathToOverrideZip>
```


## Adding the Demo

```
kubectl create namespace demo
kubectl label namespace demo istio-injection=enabled
helm install --namespace demo --name brief ./helm/user-news-and-weather-1.0.0.tgz --set news.backendKey=<you newsapi key> --set weather.backendKey=<your openweather key> 
```

Note you need to get the API Key for the News and Weather API backends from https://newsapi.org and https://openweathermap.org respectively. 

### Configuring governance

In API Central expose the `user-news-and-weather` service as a proxy. Deploy the proxy to the mesh.
Add the following as egress policies:

newsapi.org:443
api.openweathermap.org:443


### Testing


#### Registration
```
curl -v --location --request POST '<mesh ur>/<basepath>/register' \
--user mykey: \
--header 'Content-Type: application/json' \
--data-raw '{
    "uid": "fred",
    "city": "Dublin",
    "country": "IE",
    "interest": "Technology"
}'
```

e.g.
```
curl --insecure --location --request POST 'https://meshdemo.apicentral-hybrid.axwaytest.net:443/api/unw-brief/register' \
--user mykey: \
--header 'Content-Type: application/json' \
--data-raw '{
    "uid": "fred",
    "city": "Dublin",
    "country": "IE",
    "interest": "Technology"
}'
```

#### Info
```
curl --location --user mykey: --request GET '<mesh ur>/<basepath>/<uid>/info'
```

e.g.
```
curl --insecure --location --user mykey: --request GET 'https://meshdemo.apicentral-hybrid.axwaytest.net:443/api/unw-brief/fred/info'
```

