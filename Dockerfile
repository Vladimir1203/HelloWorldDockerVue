# Koristimo Node.js kao osnovnu sliku
FROM node:18

# Postavljamo radni direktorijum unutar kontejnera
WORKDIR /app

# Kopiramo package.json i package-lock.json
COPY package*.json ./

# Instaliramo zavisnosti
RUN npm install

# Kopiramo sve fajlove iz trenutnog direktorijuma u radni direktorijum unutar kontejnera
COPY . .

# Buildamo Vue.js aplikaciju za produkciju
RUN npm run build

# Otvarmo port 80 za pristup aplikaciji
EXPOSE 80

# Pokrećemo jednostak web server za posluživanje Vue aplikacije
CMD ["npm", "run", "serve"]
