AngularDartWSK
==============

Aim of this project is to propose a base project that combined:
* [AngularDart](https://angulardart.org/)
* [Google Web Starter Kit](https://developers.google.com/web/starter-kit/)

drone.io: [![Build Status](https://drone.io/github.com/cedriclam/AngularDartWSK/status.png)](https://drone.io/github.com/cedriclam/AngularDartWSK/latest)

# How to run 

## locally with pub

```
pub serve
```

## in a Docker container
--------------------------------

```
pub build
docker build -t angulardwsk .
docker run -d -p 8080:8080 angulardwsk
```

## Access the website

```
chrome http://localhost:8080/
```

# Still TODO
* Add Unit-test configuration and examples.
* Menu componentization 
* Add others AngularDart feature examples
