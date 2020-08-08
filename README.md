# pyinstaller-manylinux
PyInstaller ManyLinux 2014 Docker Action

This action run [PyInstaller](https://www.pyinstaller.org/) using docker image from [pypa/manylinux repository](https://quay.io/repository/pypa/manylinux2014_x86_64)

## Inputs

### `pyinstaller-params`

**Required** List of parameters for pyinstaller

## Example usage
```
uses: oleksis/pyinstaller-manylinux@v1
with:
  pyinstaller-params: [-c, -F, --icon=assets/image.ico, --exclude-module=test, --name=app-binary, app_module/__main__.py]
```