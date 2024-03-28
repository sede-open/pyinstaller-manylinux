FROM quay.io/pypa/manylinux_2_28_x86_64 AS compile-image

LABEL maintainer="Filip Brzek <filip.brzek at hitachids.com>"
LABEL org.opencontainers.image.source=https://github.com/sede-open/pyinstaller-manylinux
LABEL org.opencontainers.image.description="Run PyInstaller on PyPa ManyLinux glibc 2.28"
LABEL org.opencontainers.image.licenses=MIT

SHELL ["/bin/bash", "-c"]

ARG HOME=/root
ARG PYTHON_VERSION=3.10
ARG POETRY_VERSION=1.6.1
ARG PYINSTALLER_VERSION=6.5.0

ENV PYPI_URL=https://pypi.python.org/
ENV PYPI_INDEX_URL=https://pypi.python.org/simple
ENV HOME=${HOME}
ENV PYTHON_VERSION=${PYTHON_VERSION}
ENV PYTHON_EXE="python${PYTHON_VERSION}"
ENV POETRY_VERSION=${POETRY_VERSION}
ENV PYINSTALLER_VERSION=${PYINSTALLER_VERSION}
ENV POETRY_HOME="${HOME}/.poetry"
ENV PATH="${POETRY_HOME}/bin:${PATH}"

COPY pyinstaller-entrypoint.sh /usr/local/bin/pyinstaller-entrypoint.sh

RUN \
    set -x \
    && mkdir -p /src/ \
    && chmod +x /usr/local/bin/pyinstaller-entrypoint.sh \
    && ${PYTHON_EXE} -m pip install --upgrade pip pyinstaller~=${PYINSTALLER_VERSION} \
    && curl -sSL https://install.python-poetry.org | ${PYTHON_EXE} - --version ${POETRY_VERSION} \
    && poetry config virtualenvs.create false

VOLUME /src/
#WORKDIR /src/

ENTRYPOINT ["pyinstaller-entrypoint.sh"]
