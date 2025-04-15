FROM node:18

WORKDIR /app/counter-app

# package 関連だけ先にコピー（キャッシュ効かせる）
COPY counter-app/package*.json ./

RUN npm install

# アプリ全体コピー
COPY counter-app ./

# ポート開放（Viteは5173）
EXPOSE 5173

# Viteのdevサーバーを起動
CMD ["npm", "run", "dev", "--", "--host"]

