# Кладите этот файл в корень репозитория рядом с loftly.zip.
FROM node:22-slim
RUN apt-get update && apt-get install -y --no-install-recommends unzip \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY loftly.zip .
RUN unzip -q loftly.zip && rm loftly.zip
WORKDIR /app/loftly/server
ENV NODE_ENV=production
ENV DB_PATH=/data/loftly.db
EXPOSE 8080
CMD ["node", "--disable-warning=ExperimentalWarning", "src/server.js"]
