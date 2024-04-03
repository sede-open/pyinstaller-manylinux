[![Test](https://github.com/oleksis/pyinstaller-manylinux/workflows/Test/badge.svg)](https://github.com/oleksis/pyinstaller-manylinux/actions/workflows/test.yml)
[![Build](https://github.com/oleksis/pyinstaller-manylinux/actions/workflows/build.yml/badge.svg)](https://github.com/oleksis/pyinstaller-manylinux/actions/workflows/build.yml)

# pyinstaller-manylinux-2.28
PyInstaller ManyLinux 2.28 Docker Action based on [AlmaLinux](https://github.com/pypa/manylinux) 8.7 (Stone Smilodon)"

This action run [PyInstaller](https://www.pyinstaller.org/) using docker image from [pypa/manylinux repository](https://quay.io/repository/pypa/manylinux_2_28_x86_64)

## Inputs
`pyinstaller-params`

**Required** List of parameters for pyinstaller

## Example usage
```yaml
uses: sede-open/pyinstaller-manylinux@v1.0.0
with:
  pyinstaller-params: "['-c', '-F', '--icon=assets/image.ico', '--exclude-module=test', '--name=app-binary', 'app_module/__main__.py']"
```

See more in [test.yml](.github/workflows/test.yml)

## How to use the Dockerfile
- Build the image *pyinstaller-manylinux-2.28*
```bash
docker build -f Dockerfile . -t ghcr.io/sede-open/pyinstaller-manylinux:latest
```
- Create bundle app using pyinstaller in the docker image
```bash
docker run --rm \
            -it \
            --workdir /src \
            -v $(pwd):/src \
            ghcr.io/sede-open/pyinstaller-manylinux:latest \
            -c -F --name=app tests/app.p
```
- Run the app in the local machine
```bash
./dist/app
Hello out there 👋
```

## How to use Github Container Registry
[Github Packages](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
- [pyinstaller-manylinux](https://github.com/sede-open/pyinstaller-manylinux/pkgs/container/pyinstaller-manylinux)

## Notes

1. This action can execute **`setup.sh`** if it exists in the repository, before installing the requirements (**`requirements.txt`**)
2. Use [pyenv](https://github.com/pyenv/pyenv) in ManyLinux to have Python builded with `--enable-shared`.
   Some project we need add **crypto binary library** using PyInstaller `--add-binary libcryt.so.2:.`
```bash
cp /usr/local/lib/libcrypt.so.2 .
```

## Releases
PyInstaller ManyLinux 2.28 Docker Action [v1.0.0](https://github.com/sede-open/pyinstaller-manylinux/releases/tag/v1.0.0)
- This action run PyInstaller using docker image (AlmaLinux 8.7 based) from [pypa/manylinux repository](https://quay.io/repository/pypa/manylinux_2_28_x86_64)
- Python 3.10
