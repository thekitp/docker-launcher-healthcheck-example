FROM python:3.8-slim AS builder

WORKDIR /build
COPY . /build
RUN PYTHONDONTWRITEBYTECODE=1 pip install --no-cache-dir -r requirements-dev.lock
RUN python3 -m build

FROM python:3.8 AS runner

WORKDIR /app
COPY --from=builder /build/dist/ /app/dist/
RUN PYTHONDONTWRITEBYTECODE=1 python3 -m pip install --no-cache-dir /app/dist/*.whl

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY healthcheck.sh /usr/local/bin/healthcheck.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]