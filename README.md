# Potree Converter docker

Potree Converter utility packed as Docker container

[![chrvadala](https://img.shields.io/badge/website-chrvadala-orange.svg)](https://chrvadala.github.io)
[![Donate](https://img.shields.io/badge/donate-PayPal-green.svg)](https://www.paypal.me/chrvadala/25)

## Instructions
- Build the image (only first time) 
  ```sh
    docker build -t potreeconverter .
  ```
- Copy a LAS file into `/input`
- Personalize the following command and start the conversion 
  ```sh
    docker run -v $PWD/input:/input -v $PWD/output:/output potreeconverter PotreeConverter /input/perugia.las -p perugia -o /output/perugia
  ```

## Contributors
- [chrvadala](https://github.com/chrvadala) (author)
- [danilosalvati](https://github.com/danilosalvati)
- [SarcasticGeek](https://github.com/SarcasticGeek)
- [wjjmjh](https://github.com/wjjmjh)

## Credits
Project inspired by https://github.com/sverhoeven/PotreeConverter


# Docker build
```bash
sudo docker build -t potreeconverter:1.7 .

```

# Docker Run
```bash

docker run -v $PWD/input:/input -v $PWD/output:/output potreeconverter:1.7 PotreeConverter PotreeConverter /input/point_cloud.las -p pointcloud -o /output/pointcloud

```