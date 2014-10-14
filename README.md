AngularDartWSK
==============

AngularDart base project with Google Web Start Kit

How run locally
---------------

```
pub serve
```

How to run in a Docker container
--------------------------------

```
pub build
docker build -t angulardwsk .
docker run -d -p 8080:8080 angulardwsk
```

Acces to the website
--------------------

```
chrome http://localhost:8080/
```

to know the version of Dart SDK used:

```
curl http://localhost:8080/version
```
