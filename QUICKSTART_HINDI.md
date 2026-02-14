# Instagram Scraper - Quick Start Guide (हिंदी)

## 🎯 Project का उद्देश्य

यह project Instagram से trending data को scrape करके CSV file में save करता है। यह automatically हर 1 घंटे में run होता है।

## 📋 ज़रूरी चीज़ें

1. **Node.js** (v14+) - [Download करें](https://nodejs.org/)
2. **MongoDB** (v4.4+) - [Download करें](https://www.mongodb.com/try/download/community)
3. **Git** (optional) - Code download करने के लिए

## 🚀 Installation Steps

### Option 1: Automatic Setup (सबसे आसान)

#### Linux/Mac Users:
```bash
chmod +x setup.sh
./setup.sh
```

#### Windows Users:
```bash
setup.bat
```

### Option 2: Manual Setup

#### Step 1: Backend Setup
```bash
cd backend
npm install
```

#### Step 2: Frontend Setup
```bash
cd frontend
npm install
```

## ▶️ Project को Run करना

### Step 1: MongoDB Start करें

**Linux/Mac:**
```bash
mongod
```

**Windows:**
- MongoDB को service के रूप में start करें या
- Command Prompt में `mongod` run करें

### Step 2: Backend Server Start करें

नया terminal खोलें:
```bash
cd backend
npm start
```

आपको ये messages दिखेंगे:
```
✅ MongoDB Connected
🚀 Server running on http://localhost:5000
⏰ Scraper will run automatically every 1 hour
🚀 Running initial scrape on server start...
```

### Step 3: Frontend Start करें

एक और नया terminal खोलें:
```bash
cd frontend
npm start
```

Browser में automatically `http://localhost:3000` खुलेगा।

## 🎨 Dashboard का उपयोग कैसे करें

### Dashboard में आपको मिलेगा:

1. **Statistics Cards**
   - Total Posts: कुल scraped posts
   - Last Scrape: आखिरी scraping का time
   - CSV Path: CSV file का location

2. **Action Buttons**
   - **Scrape Now**: तुरंत scraping शुरू करने के लिए
   - **Download CSV**: CSV file download करने के लिए
   - **Refresh Data**: Latest data reload करने के लिए

3. **Trending Posts Grid**
   - सभी scraped posts की detailed view
   - Likes, comments, और hashtags के साथ

## 📊 CSV File कहाँ मिलेगी?

CSV file यहाँ save होगी:
```
backend/data/instagram_trending.csv
```

आप इसे Dashboard से भी download कर सकते हैं।

## ⏰ Automatic Scraping

- Scraper हर **1 घंटे** में automatically run होता है
- Server start होते ही पहली scraping तुरंत होती है
- आप manually भी "Scrape Now" button से scrape कर सकते हैं

### Scraping Schedule बदलना

`backend/server.js` में cron schedule modify करें:

```javascript
// हर घंटे (Current)
cron.schedule('0 * * * *', ...);

// हर 30 मिनट में
cron.schedule('*/30 * * * *', ...);

// हर 2 घंटे में
cron.schedule('0 */2 * * *', ...);

// हर दिन सुबह 9 बजे
cron.schedule('0 9 * * *', ...);
```

## 🔍 API Endpoints का उपयोग

### 1. सभी Trending Data fetch करें
```bash
curl http://localhost:5000/api/trending
```

### 2. Manual Scraping trigger करें
```bash
curl -X POST http://localhost:5000/api/scrape-now
```

### 3. Statistics देखें
```bash
curl http://localhost:5000/api/stats
```

### 4. CSV Download करें
```
http://localhost:5000/api/download-csv
```

## 🛠️ Common Issues और Solutions

### Issue 1: MongoDB Connection Error
**Error:** `MongoDB Connection Error`
**Solution:** 
- Check करें कि MongoDB run हो रहा है: `mongod`
- Port 27017 free है या नहीं check करें

### Issue 2: Port Already in Use
**Error:** `Port 5000 is already in use`
**Solution:**
- `.env` file में PORT बदलें
- या running process को kill करें

### Issue 3: Dependencies Installation Failed
**Solution:**
```bash
# Cache clear करें
npm cache clean --force
# फिर से install करें
npm install
```

### Issue 4: Puppeteer Installation Failed
**Solution:**
```bash
# Linux पर
sudo apt-get install -y libgbm-dev

# Mac पर
brew install chromium
```

## 📁 Project Structure समझना

```
instagram-scraper-mern/
├── backend/                    # Server-side code
│   ├── models/                 # Database schemas
│   ├── routes/                 # API endpoints
│   ├── services/               # Business logic (scraper)
│   ├── data/                   # CSV files storage
│   ├── .env                    # Configuration
│   └── server.js               # Main server file
│
├── frontend/                   # Client-side code
│   ├── src/
│   │   ├── App.js             # Main React component
│   │   └── App.css            # Styles
│   └── public/
│
└── README.md                   # Documentation
```

## 💡 Tips और Best Practices

1. **Development Mode**: हमेशा `npm run dev` use करें (auto-restart के लिए)
2. **CSV Files**: Regular backup लें
3. **MongoDB**: Production में MongoDB Atlas use करें
4. **Environment Variables**: Sensitive data `.env` में रखें
5. **Git**: `.gitignore` में `.env` और `node_modules` add करें

## 🎓 Next Steps

1. Instagram Graph API integrate करें (production के लिए)
2. Authentication add करें
3. More filters और options add करें
4. Charts और analytics add करें
5. Docker में containerize करें

## 📞 Help और Support

- Issues के लिए: GitHub Issues create करें
- Questions के लिए: README documentation पढ़ें
- Contributions welcome हैं!

## ⚠️ Important Notes

- यह demo project sample data generate करता है
- Real Instagram scraping के लिए Instagram Graph API use करें
- Instagram की Terms of Service follow करें
- Rate limiting implement करें production में

---

**Happy Coding! 🚀**
